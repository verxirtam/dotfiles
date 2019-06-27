#dotfileの反映、githubへのアップロードを行う
#
#ホームディレクトリに配置するドットファイルが対象



#変数定義
###################################################

#管理対象のdotfiles
#このmakefileと同一ディレクトリのdotfileを対象とする
DOTFILES := $(shell ls -1Fa  | grep -v / | grep ^\\.)


#コマンド
###################################################

#dotfilesをホームディレクトリに配置する
.PHONY: update
update:
	cp -p $(DOTFILES) ~/
	(cd ~; ls -l $(DOTFILES);)


#githubにアップロードを行う
.PHONY: git
git:
	git add --all .
	git commit -m "update dotfiles."
	git push



