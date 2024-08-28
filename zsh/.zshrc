alias tmux="tmux -u"
alias dev="tmuxifier load-window dev"
alias android_studio="/usr/local/android-studio/bin/studio.sh"
alias tvim="NVIM_APPNAME=tvim nvim"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

 #See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="JimmyNXT"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.tmuxifier/bin:$PATH"

export ANDROID_HOME=${HOME}/Android/Sdk
eval "$(tmuxifier init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export MAVEN_OPTS="-Xmx512m -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts \
                     -Djavax.net.ssl.trustStorePassword=password"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
