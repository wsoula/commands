#Symlink this file from git clone to local
#ln -s ~/git/commands/.bashrc ~/.bashrc

#Set command prompt
#. ~/git/git/contrib/completion/git-prompt.sh
#. ~/git/git/contrib/completion/git-completion.bash
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
#export PATH=/opt/chefdk/embedded/bin:$PATH:/opt/chefdk/bin:/Users/willsoula/.chefdk/gem/ruby/2.4.0/bin
#eval "$(chef shell-init bash)"
#eval "$(/opt/chefdk/embedded/bin/ruby ~/git/multi_chef/multi_chef.rb -a api.chef.io -o di -u wsoula)"
#eval "$(~/git/multi_chef/multi_chef.rb -a api.chef.io -o didev -u wsoula)"
#alias onprem-dev-chef="chef-switch -a chef-api.drillinginfo.com -o didev -u william_soula"
#alias dev-chef="chef-switch -a api.chef.io -o didev -u wsoula"
#alias prod-chef="chef-switch -a api.chef.io -o di -u wsoula"
#alias ops-chef="chef-switch -a chef-api.drillinginfo.com -o di-ops-prod -u william_soula"
#docker
export PATH=$PATH:/usr/local/bin:/usr/bin
#Sqitch
alias sqitch="docker run -it --rm -v ~/.sqitch:/root/.sqitch -v $(pwd):/flipr --workdir=/flipr aleksandrvin/sqitch"
alias sqitch-local="docker run -it --rm -v ~/.sqitch:/root/.sqitch --link some-postgres -v $(pwd):/flipr --workdir=/flipr aleksandrvin/sqitch"
#. ~/.aws_config
#. ~/.bash_profile
# Terraform
export PATH=$PATH:/Users/willsoula/bin
# zsh-syntax-highlighting only expands $PWD and ${PWD} now
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/771#issuecomment-708568839
alias terraform-docs-replace='docker run --rm -v $PWD:/docs cytopia/terraform-docs terraform-docs-replace --sort-inputs-by-required --with-aggregate-type-defaults md README.md'
alias terraform='docker run -v $PWD:/temp/terraform -v $HOME/.aws:/home/$USER.linux/.aws -v $HOME/.ssh:/home/$USER.linux/.ssh --workdir /temp/terraform --rm -it -u $(id -u ${USER}):$(id -g ${USER}) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro hashicorp/terraform'
alias terraform12='docker run -v $PWD:/temp/terraform -v $HOME/.aws:/root/.aws --workdir /temp/terraform --rm -it hashicorp/terraform:0.12.29'
alias terraform11='docker run -v $PWD:/temp/terraform -v $HOME/.aws:/root/.aws --workdir /temp/terraform --rm -it -u $(id -u ${USER}):$(id -g ${USER}) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro hashicorp/terraform:0.11.14'
alias terraformThreadRepo='docker run -v $PWD:/temp/ -v $HOME/.aws:/root/.aws --workdir /temp/thread --rm -it hashicorp/terraform:0.11.15'
alias cdktf-cli='docker run -it --rm -v $(pwd):/src -w "/src" cdktf-cli:latest sh'
alias cat=bat
# Docker Containers for Desktop
alias htop="docker run --rm -it --pid host jess/htop"
alias chrome="docker run --rm -it --net host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=docker.for.mac.host.internal:0 -v $HOME/Downloads:/home/chrome/Downloads -v $HOME/.config/google-chrome/:/data --security-opt seccomp=$HOME/chrome.json -v /dev/shm:/dev/shm --name chrome jess/chrome"
alias wireshark="docker run --rm -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=docker.for.mac.host.internal:0 --name wireshark jess/wireshark"
# docker run --rm mehrdadrad/tcpprobe https://www.starz.com/us/en/
alias tcpprobe="docker run --rm mehrdadrad/tcpprobe"
alias nin="docker run --rm -it -v $HOME/.todos.yaml:/root/.todos.yaml nin"
alias tmpsms="docker run --rm -it -v $HOME:/tmp/tmpsms tmpsms"
alias segno='docker run --rm -it -v ${PWD}:/tmp segno'
alias maze='docker run --rm -it -v $PWD:/var/tmp/maze-output maze'
alias nafas="docker run --rm -it nafas"
alias aws='docker run --rm -v ~/.aws:/root/.aws -v $PWD:/aws amazon/aws-cli'
alias aws-session-manager='docker run --rm -it -v ~/.aws:/root/.aws -v $PWD:/aws aws-session-manager'
alias http="docker run -it --rm http"
alias rare='docker run -it --rm -v $PWD:/tmp/rare rare --notrim'
alias slo-generator="docker run -it --rm -v $(pwd):/app/ -e STACKDRIVER_HOST_PROJECT_ID=1 -e DATADOG_API_KEY=1 -e DATADOG_APP_KEY=1 -e DYNATRACE_API_URL=1 \
        -e DYNATRACE_API_TOKEN=1 -e ELASTICSEARCH_URL=1 -e PROMETHEUS_URL=1 -e PUBSUB_PROJECT_ID=1 -e PROMETHEUS_PUSHGATEWAY_URL=1 -e PUBSUB_TOPIC_NAME=1 \
        -e DEBUG=1 slo-generator"
# To enforce conventional commits: https://github.com/craicoverflow/sailr
# ln -s ~/git/sailr/sailr.sh ~/.git-templates/hooks/commit-msg
export SAILR_CONFIG=~/sailr.json
alias git-cliff='docker run --rm -t -v $PWD:/app/ -v $HOME/git/git-cliff/cliff.toml:/app/cliff.toml orhunp/git-cliff:latest'
alias convco='docker run -u $(id -u):$(id -g) -v $PWD:/tmp --workdir /tmp --rm convco/convco'
alias aic='docker run -t -v "$(pwd)":/tmp/aic  ascii-image-converter'
export PATH=~/.npm-global/bin:$PATH
# NVM/NPM/Node
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
alias mute='osascript -e "set volume output volume 0"'
alias unmute='osascript -e "set volume output volume 41"'
# For brew
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
# Turn of docker buildkit
export DOCKER_BUILDKIT=0
alias jq='docker run -i stedolan/jq'
alias gitversion='docker run --rm -t -v $(pwd):/repo gittools/gitversion /repo'
alias ov='docker run --rm -it -v $(PWD):/tmp ov'
alias diagram='docker run --rm -it -v $(PWD):/tmp --name dac dac'
alias stree='docker run -it --rm -v ~/.aws:/root/.aws stree'
alias mysql='docker run -it --rm mysql mysql'
# have xargs use aliases instead of binary - https://unix.stackexchange.com/questions/141367/have-xargs-use-alias-instead-of-binary
# alias xargs='xargs '
# Work aliases
. $HOME/.work_aliases
# Node alias to work with N
export N_PREFIX=~/.n
export PATH=$N_PREFIX/bin:$PATH
alias scout='docker run --rm -it -v $(PWD):/tmp -v ~/.aws:/root/.aws --name scout scout'
alias jira='docker run -it --rm --entrypoint /bin/jira -e JIRA_API_TOKEN=$(cat ~/.jira) -v /Users/wills/.config/.jira:/root/.config/.jira ghcr.io/ankitpokhrel/jira-cli:latest'
#alias jira='docker run -it --rm -e JIRA_API_TOKEN=$(cat ~/.jira) -v /Users/wills/.config/.jira:/root/.config/.jira ghcr.io/ankitpokhrel/jira-cli:latest'
. ~/.aws_accounts
