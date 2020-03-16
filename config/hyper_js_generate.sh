#!/bin/bash

##############################################################################
# 定数
##############################################################################
DOTPATH=~/.dotfiles;
HYPER_JS=.hyper.js;
HYPER_JS_PATH=config/hyper_js_preferences;
WINDOWS_HYPER_JS=$HYPER_JS_PATH/.windows.js;
OTHER_HYPER_JS=$HYPER_JS_PATH/.other.js;

##############################################################################
# hyper.jsのクロスプラットフォーム化
##############################################################################
if [ "$(uname)" == "Darwin" ]; then
  echo Mac
  ln -snfv "$DOTPATH/$OTHER_HYPER_JS" "$HOME/$HYPER_JS"
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo Windows
  ln -snfv "$DOTPATH/$WINDOWS_HYPER_JS" "$HOME/$HYPER_JS"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo Linux
  ln -snfv "$DOTPATH/$OTHER_HYPER_JS" "$HOME/$HYPER_JS"
else
  echo Unknown OS
fi
