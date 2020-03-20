#--------------------------------------------------
# os
#--------------------------------------------------
if [ "$(uname)" == "Darwin" ]; then
  echo Mac
  # bachrcを読込み
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo Windows
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo Linux
else
  echo Unknown OS
fi
