_N='\033[0m'    # Normal
_R='\033[0;31m' # Red
_G='\033[0;32m' # Green
_Y='\033[0;33m' # Yellow
_B='\033[0;34m' # Blue
_P='\033[0;35m' # Purple _C='\033[0;36m' # Cyan
_S='\033[1;37m' # Gray (Soft)

echo ":>"

function ed() { case $1 in
		'z')
			nvim $HOME/.zshrc;;
		'v')
			nvim $HOME/.config/nvim/init.lua;;
		'l')
			nvim $HOME/.config/nvim/lua/config/lazy.lua;;
		't')
			nvim $HOME/.tmux.conf;;
		*) echo "nothing happened.";;
	esac
}

alias p="python3"
alias j="java"
alias jc="javac"
alias jr="java -jar"
alias g="./gradlew"
alias gb="./gradlew build run"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias gitl="git log --oneline --graph --all"
alias yeet="git push"

alias doc="cd ~/Documents"
alias dots="cd ~/dots"
alias c="cd ~/Documents/code"
alias 2c="cd ..;cd .."
alias todo="nvim ~/Documents/todo.txt"
alias su="cd ~/Documents/code/java/sudoku/"

alias r="exec $SHELL -l"

unsetopt BEEP

function prompt_git() {
  local branch=$(git branch --show-current 2> /dev/null)
  if [ $branch ]; then
    local remote=${${$(git config --get remote.origin.url)##*/}%*.git}
    if [ $remote ]; then
      echo "%F{241}(%F{246}${remote}%F{241}/${branch})"
    else
      echo "%F{241}(${branch})"
    fi
  fi
}

setopt prompt_subst
PROMPT=$'%F{blue}%~ $(prompt_git)%f
%(?.%F{green}> %f.%F{red}> %f)'

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="Useres/ramen/.local/share/nvim/mason/packages/jdtls:$PATH"
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

IGNORE=("--ignore-glob='.DS_Store|.git|.gitconfig|.gitignore'")
EZA_OPTS=("--all --group-directories-first --sort=Name $IGNORE")
alias ls="eza --across $EZA_OPTS"
alias lss="eza --tree --level=2 $EZA_OPTS"
alias lsss="eza --tree --level=3 $EZA_OPTS"
alias ll="eza -l"
