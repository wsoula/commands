#Set command prompt
. ~/git/git/contrib/completion/git-prompt.sh
#PS1="\[\033[0;31m\]\t \[\033[0;34m\]\w> \[\033[0m\]"
PS1='\[\033[0;31m\]\t\[\033[0m\] \[\033[0;32m\]\h\[\033[0m\] \[\033[0;34m\]\w$(__git_ps1 " (%s)")> \[\033[0m\]'
#Add user scripts
PATH=$PATH:~/bin
#Add play to path
PATH=$PATH:~/play/play-2.1.2

#Aliases
#reload=source ~/.bashrc
alias cleanMp3Folder="find . -type f ! -name '*.mp3' -delete"
#alias plixid="ls"
#alias plixid="for i in *_\[plixid.com\].mp3; do mv '$i' '${i/_\[plixid.com\].mp3/}.mp3'; done"
#alias plixid="for i in *_\[plixid.com\].mp3; do echo $i; done"
#alias lg1="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
alias lg1="git log --graph -40 --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
#alias lg2="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
alias lg2="git log --graph -40 --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
DOCKER_HOST=tcp://127.0.0.1:4243
alias ssh="ssh -o 'UserKnownHostsFile /dev/null' -o StrictHostKeyChecking=no"
