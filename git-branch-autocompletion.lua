function git_checkout_match_generator(text, first, last)
	found_matches = false;
	if is_supported_git_function(rl_state.line_buffer) then
		for line in io.popen("git branch 2>nul"):lines() do
			local m = line:match("[%* ] (.+)$")
			if m then
				if not has_branch_name(rl_state.line_buffer) then
					clink.add_match(m)
					found_matches = true;
			        elseif #text > 0 and m:sub(1, string.len(text)) == text then
					clink.add_match(m)
					found_matches = true;
				end
			end
		end
	end

	return found_matches
end

function is_supported_git_function(text)
    return 
        text:find("^git checkout ") or 
        text:find("^git checkout %-%a ") or 
        text:find("^git co ") or 
        text:find("^git co %-%a ") or 
        text:find("^git b ") or 
        text:find("^git b %-%a ") or 
        text:find("^git branch ") or 
        text:find("^git branch %-%a ") or 
        text:find("^git rebase ") or 
        text:find("^git rebase %-%a ") or 
        text:find("^git r ") or
        text:find("^git r %-%a ")
end 

function has_branch_name(text)
    return 
        text:find("^git checkout [^-]+$") or 
        text:find("^git checkout %-%a [^-]+$") or 
        text:find("^git co [^-]+$") or 
        text:find("^git co %-%a [^-]+$") or 
        text:find("^git b [^-]+$") or 
        text:find("^git b %-%a [^-]+$") or 
        text:find("^git branch [^-]+$") or 
        text:find("^git branch %-%a [^-]+$") or 
        text:find("^git rebase [^-]+$") or 
        text:find("^git rebase %-%a [^-]+$") or 
        text:find("^git r [^-]+$") or
        text:find("^git r %-%a [^-]+$")
end 

clink.register_match_generator(git_checkout_match_generator, 10)
