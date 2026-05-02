#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.nvm/nvm.sh
export PATH="$HOME/.local/bin/scripts:$PATH"

bind '"\C-f":"tmux-sessionizer\n"'

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export PATH="$JAVA_HOME/bin:$PATH"

alias windows='sudo grub-reboot "Windows Boot Manager (on /dev/nvme0n1p1)" && reboot'
alias uni1='cd ~/dev/uni/year-1'
alias uni2='cd ~/dev/uni/year-2'
