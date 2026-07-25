#! /bin/bash

# デフォルト設定

# ユーザ名@ホスト名
PS1_2_USERHOST_COLOR='00;38;05;204'
# 区切り文字(:)
PS1_3_SEPARATOR_COLOR='00;38;05;204'
# カレントディレクトリ
PS1_4_DIR_COLOR='00;38;05;204'
# gitステータス
PS1_5_GIT_STATUS_COLOR='00'
# $
PS1_6_DOLLER_COLOR='00;38;05;204'


# git-promptの表示オプション変更
# 表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


# ホスト固有の設定
# hosts/<hostname>/ps1.sh が存在すればそれを読み込む
HOST_PS1_CONFIG=~/tools/dotfiles/hosts/$(uname -n)/ps1.sh
if [ -f "$HOST_PS1_CONFIG" ]; then
	source "$HOST_PS1_CONFIG"
fi
unset HOST_PS1_CONFIG

# PS1文字列の作成

# ルートディレクトリ
PS1_1_ROOT='${debian_chroot:+($debian_chroot)}'
# ユーザ名@ホスト名
PS1_2_USERHOST='\[\e[${PS1_2_USERHOST_COLOR}m\]\u@\h\[\e[00m\]'
# 区切り文字(:)
PS1_3_SEPARATOR='\[\e[${PS1_3_SEPARATOR_COLOR}m\]:\[\e[00m\]'
# カレントディレクトリ
PS1_4_DIR='\[\e[${PS1_4_DIR_COLOR}m\]\w\[\e[00m\]'
# gitステータス
PS1_5_GIT_STATUS='\[\e[${PS1_5_GIT_STATUS_COLOR}m\] $(__git_ps1 "[%s]")\[\e[00m\]'
# $
PS1_6_DOLLER='\[\e[${PS1_6_DOLLER_COLOR}m\]\$\[\e[00m\]'
# スペース
PS1_7_SPACE=' '

# PS1の設定

PS1=${PS1_1_ROOT}
PS1=$PS1${PS1_2_USERHOST}
PS1=$PS1${PS1_3_SEPARATOR}
PS1=$PS1${PS1_4_DIR}
PS1=$PS1${PS1_5_GIT_STATUS}
PS1=$PS1${PS1_6_DOLLER}
PS1=$PS1${PS1_7_SPACE}

# 使用しない環境変数の開放

#unset PS1_2_USERHOST_COLOR
#unset PS1_3_SEPARATOR_COLOR
#unset PS1_4_DIR_COLOR
#unset PS1_6_DOLLER_COLOR

unset PS1_1_ROOT
unset PS1_2_USERHOST
unset PS1_3_SEPARATOR
unset PS1_4_DIR
unset PS1_6_DOLLER
unset PS1_7_SPACE

#
# git-completion.bash / git-prompt.sh
#
if [ -f ~/tools/dotfiles/tools/git/git-completion.bash ]; then
    source ~/tools/dotfiles/tools/git/git-completion.bash
fi
if [ -f ~/tools/dotfiles/tools/git/git-prompt.sh ]; then
    source ~/tools/dotfiles/tools/git/git-prompt.sh
fi




