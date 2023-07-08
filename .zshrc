_N='\033[0m'    # Normal
_R='\033[0;31m' # Red
_G='\033[0;32m' # Green
_Y='\033[0;33m' # Yellow
_B='\033[0;34m' # Blue
_P='\033[0;35m' # Purple
_C='\033[0;36m' # Cyan
_S='\033[1;37m' # Gray (Soft)

function ed() {
	case $1 in
		'z')
			nvim $HOME/.zshrc;;
		'v')
			nvim $HOME/.config/nvim/init.vim;;
		*) echo "nothing happened.";;
	esac
}
function hi() {
  echo 'hello there'
}
alias g="google-chrome-stable &"
alias p="python3"
alias w="cd ~/documents/infocomm/2022/wordle_pw"
alias gitl="git log --oneline --graph"
alias r="exec $SHELL -l"
setopt prompt_subst

echo ":>"

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
