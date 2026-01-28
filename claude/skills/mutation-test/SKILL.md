---
name: mutation-test
description: Run Stryker mutation tests against C# projects and analyze results to find weak spots in test coverage
argument-hint: [test-project-path]
allowed-tools: Bash, Read, Glob, Grep
---

# Mutation Testing with Stryker.NET

Run Stryker mutation tests to evaluate test suite effectiveness. Mutation testing finds code that can be changed without failing tests—indicating weak coverage.

## Arguments

If provided, `$ARGUMENTS` is the path to the test project or solution. Otherwise, search for test projects.

## Workflow

### 1. Find the Test Project

If no path provided, search for test projects:
```bash
find . -name "*.Tests.csproj" -o -name "*.UnitTests.csproj" | head -20
```

### 2. Check Stryker Installation

```bash
dotnet stryker --version
```

If not installed:
```bash
dotnet tool install -g dotnet-stryker
```

### 3. Check for Configuration

Look for `stryker-config.json` in the test project directory—it may have project-specific settings.

### 4. Run Stryker

From the test project directory:
```bash
dotnet stryker
```

With options for faster runs:
```bash
# Only mutate files changed since main
dotnet stryker --since:main

# Target specific files
dotnet stryker --mutate "src/Services/**/*.cs"
```

### 5. Interpret Results

**Console output shows:**
```
- Killed:    150  (mutants detected by tests - good)
- Survived:   25  (mutants NOT detected - weak tests)
- Timeout:     5  (caused infinite loop - usually OK)
- No Coverage: 10  (code not covered by tests)

Mutation score: 78.95%
```

**Score interpretation:**
| Score | Quality |
|-------|---------|
| 80%+ | Excellent |
| 60-80% | Good, some gaps |
| 40-60% | Fair, significant weaknesses |
| <40% | Poor coverage |

### 6. Find Surviving Mutants

Check the HTML report at `StrykerOutput/reports/mutation-report.html` for:
- Which files have survivors
- Exact line numbers and mutation types
- What was changed

**Common survivor patterns indicate:**
- Boundary conditions not tested (`>` → `>=` survives)
- Missing negative tests (`if (x)` → `if (true)` survives)
- Return values not verified
- Exception paths not tested

## Reporting

Provide:

1. **Summary**: Overall score, killed/survived/no-coverage counts
2. **Weak spots**: Files with lowest scores, specific surviving mutations
3. **Recommendations**: Specific tests to add based on survivors

Example:
```
Mutation Score: 72%
- Killed: 145, Survived: 28, No Coverage: 12

Weak spots:
- UserService.cs (65%): Line 45 `age > 18` → `age >= 18` survived (boundary not tested)
- OrderValidator.cs (78%): Line 23 `&&` → `||` survived (logic branch not covered)

Recommendations:
- Add test for age exactly 18
- Add test where first condition true, second false
```

## Troubleshooting

**Too slow**: Use `--since:main` or `--mutate` to limit scope

**No tests found**: Run from test project directory, check `--project` points to source project

**Memory issues**: Reduce concurrency with `--concurrency 2`
