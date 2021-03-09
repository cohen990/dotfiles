alias y=yarn
alias tg=terragrunt
alias tf=terraform
alias c="code ."
alias fixtime="sudo ntpd -qg"
alias cci=circleci
alias icat="kitty +kitten icat --align left"

setxkbmap -layout gb
setxkbmap -option 'caps:escape'

xset b off
xset b 0 0 0

export AWS_REGION=eu-west-1

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/serverless.fish ]; and . /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/sls.fish ]; and . /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/slss.fish ]; and . /home/dan/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/slss.fish
