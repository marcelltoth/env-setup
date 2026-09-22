export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/c/Users/marce/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/marce/AppData/Local/Programs/Python/Python314:$PATH"
export PATH="/c/Users/marce/.cargo/bin:$PATH"
export PATH="/c/Users/marce/AppData/Local/Microsoft/WindowsApps:$PATH"
export PATH="/c/Users/marce/AppData/Local/JetBrains/Toolbox/scripts:$PATH"
export PATH="/c/Users/marce/AppData/Roaming/nvm:$PATH"
export PATH="/c/Program Files/nodejs:$PATH"
export PATH="/c/tools/msys64:$PATH"
export PATH="/c/Users/marce/AppData/Local/Muse Hub/lib:$PATH"
export PATH="/c/Users/marce/bin:$PATH"
export PATH="/c/Users/marce/AppData/Roaming/Python/Scripts:$PATH"
export PATH="/c/Users/marce/.local/bin:$PATH"
export PATH="/c/Users/marce/AppData/Local/Microsoft/WinGet/Packages/Anthropic.ClaudeCode_Microsoft.Winget.Source_8wekyb3d8bbwe:$PATH"
export PATH="/c/Program Files/Git/cmd:$PATH"

export GIT_SSH="C:\Windows\System32\OpenSSH\ssh.exe"

# Path to your oh-my-zsh installation.
export ZSH="/home/marce/.oh-my-zsh"


export EDITOR=/usr/bin/vim

ZSH_THEME=""

eval `dircolors ~/.dircolors`

# Disable BEEP
unsetopt BEEP

plugins=(git docker yarn)

source $ZSH/oh-my-zsh.sh

PROMPT='%B%F{41}%n%f%b:%~$ '


# User configuration
alias yolo="git commit --all --amend --no-edit --no-verify && git push --force-with-lease --no-verify"
alias gst="git status"


export GITHUB_TOKEN=
export NPM_TOKEN=
