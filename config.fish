alias y=yarn
alias tg=terragrunt
alias tf=terraform
alias c="code ."
alias fixtime="sudo ntpd -qg"
alias cci=circleci
alias icat-clear="kitty +kitten icat --clear"
alias icat="kitty +kitten icat --align left"
alias iclip="xclip -sel clipboard -t image/png"
alias splitpipe="tee (tty)"
alias z=zoxide
alias togit="cd /home/git"
alias dn=dotnet
alias bat=batcat

function pw
    ls $argv.puml | entr -s "plantuml $argv.puml && icat $argv.png" && iclip $argv.png
end

function struct
    docker run -it --rm -p 8080:8080 -v $(pwd):/usr/local/structurizr --name structurizr structurizr/lite
end

setxkbmap -layout gb
setxkbmap -option 'caps:escape'

xset b off
xset b 0 0 0

export AWS_REGION=eu-west-1
export AWS_DEFAULT_REGION=eu-west-1

export PATH="/home/sammie/.local/bin:$PATH"
export PATH="/home/sammiecohen/.local/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/serverless.fish ]; and . /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/sls.fish ]; and . /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/slss.fish ]; and . /home/sammie/git/cazoo/monitoring-and-alarms-automation/node_modules/tabtab/.completions/slss.fish

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Inits
zoxide init fish | source

alias togglecaps="xdotool key Caps_Lock"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
