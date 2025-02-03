export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jimmynxt"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd-mm-yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export LANG=en_US.UTF-8
export EDITOR='nvim'

export PATH="$HOME/.tmuxifier/bin:$PATH"

export ANDROID_HOME=${HOME}/Android/Sdk
eval "$(tmuxifier init -)"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -u'
alias dev='tmuxifier load-window dev'
alias android_studio='/usr/local/android-studio/bin/studio.sh'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export MAVEN_OPTS="-Xmx512m -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts \
                     -Djavax.net.ssl.trustStorePassword=password"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

