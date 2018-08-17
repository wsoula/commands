#Symlink this file from git clone to local
#ln -s ~/git/commands/.bashrc ~/.bashrc

#Set command prompt
. ~/git/git/contrib/completion/git-prompt.sh
. ~/git/git/contrib/completion/git-completion.bash
#PS1="\[\033[0;31m\]\t \[\033[0;34m\]\w> \[\033[0m\]"
#PS1='\[\e[0;31m\]\t\[\e[m\] \[\e[0;32m\]\h\[\e[m\] \[\e[0;34m\]\w$(__git_ps1 " (%s)")> \[\e[m\]'
ZSH_THEME="agnoster"
#Default PATH
export PATH=/usr/bin:/usr/sbin:/bin:/sbin
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
#DOCKER_HOST=tcp://127.0.0.1:4243
alias ssh="ssh -o 'UserKnownHostsFile /dev/null' -o StrictHostKeyChecking=no"
export VISUAL=vim
export EDITOR="$VISUAL"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#export PATH=$JAVA_HOME/bin:$PATH
#chef
export PATH=/opt/chefdk/embedded/bin:$PATH:/opt/chefdk/bin:/Users/willsoula/.chefdk/gem/ruby/2.4.0/bin
#eval "$(chef shell-init bash)"
#eval "$(/opt/chefdk/embedded/bin/ruby ~/git/multi_chef/multi_chef.rb -a api.chef.io -o di -u wsoula)"
eval "$(~/git/multi_chef/multi_chef.rb -a api.chef.io -o di -u wsoula)"
alias onprem-dev-chef="chef-switch -a chef-api.drillinginfo.com -o didev -u william_soula"
alias dev-chef="chef-switch -a api.chef.io -o didev -u wsoula"
alias prod-chef="chef-switch -a api.chef.io -o di -u wsoula"
#docker
export PATH=$PATH:/usr/local/bin
#Sqitch
alias sqitch="docker run -it --rm -v ~/.sqitch:/root/.sqitch -v $(pwd):/flipr --workdir=/flipr aleksandrvin/sqitch"
alias sqitch-local="docker run -it --rm -v ~/.sqitch:/root/.sqitch --link some-postgres -v $(pwd):/flipr --workdir=/flipr aleksandrvin/sqitch"
. ~/.aws_config
. ~/.bash_profile
# Terraform
export PATH=$PATH:/Users/willsoula/bin
