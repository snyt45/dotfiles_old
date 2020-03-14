# 除外リスト
DOTFILES_EXCEPT := .DS_Store .git .gitmodules .gitignore
# 対象リスト
DOTFILES_TARGET := $(wildcard .??*) bin
# ドットファイルディレクトリ
DOTFILES_DIR := $(PWD)
# 対象リストから除外リストを除外したリスト
DOTFILES_FILES := $(filter-out $(DOTFILES_EXCEPT), $(DOTFILES_TARGET))

###################################################
# makeコマンド
###################################################

# 更新
update:
	git pull origin master
#	git submodule init
#	git submodule update
#	git submodule foreach git pull origin master

# デプロイ
deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
