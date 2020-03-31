# 除外リスト
DOTFILES_EXCEPT := .DS_Store .git .gitmodules .gitignore .gitignore_global
# 対象リスト
DOTFILES_TARGET := $(wildcard .??*) bin
# ドットファイルディレクトリ
DOTFILES_DIR := $(PWD)
# 対象リストから除外リストを除外したリスト
DOTFILES_FILES := $(filter-out $(DOTFILES_EXCEPT), $(DOTFILES_TARGET))
# ホームディレクトリ
# $(変数名:置換する文字列=置換後)
HOME_DIR := $(DOTFILES_DIR:/.dotfiles=)

###################################################
# makeコマンド
###################################################

# hyper.js生成
hyper_js_generate:
	bash config/hyper_js_generate.sh

# 更新
update:
	git pull origin master
#	git submodule init
#	git submodule update
#	git submodule foreach git pull origin master

# デプロイ
deploy:
	@make hyper_js_generate # Run make hyper_js_generate
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(DOTFILES_DIR)/$(val) $(HOME_DIR)/$(val);)

