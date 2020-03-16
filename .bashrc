#--------------------------------------------------
# os
#--------------------------------------------------
if [ "$(uname)" == "Darwin" ]; then
  echo Mac
  # gitのブランチ名をターミナルで表示できるようにする
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/git-completion.bash
  GIT_PS1_SHOWDIRTYSTATE=true

  if [ $UID -eq 0 ]; then
    PS1='\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
  else
    PS1='\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo Windows
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo Linux
else
  echo Unknown OS
fi
