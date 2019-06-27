#! /bin/bash

# デフォルト設定

# ユーザ名@ホスト名
PS1_2_USERHOST_COLOR='00;38;05;204'
# 区切り文字(:)
PS1_3_SEPARATOR_COLOR='00;38;05;204'
# カレントディレクトリ$
PS1_4_DIR_COLOR='00;38;05;204'
# 半角スペース, $
PS1_5_DOLLER_COLOR='00;38;05;204'

# daisuke-lubuntu
if [ $(uname -n) = "daisuke-lubuntu" ]; then
	# ユーザ名@ホスト名
	PS1_2_USERHOST_COLOR='00'
	# 区切り文字(:)
	PS1_3_SEPARATOR_COLOR='00'
	# カレントディレクトリ$
	PS1_4_DIR_COLOR='00'
	# 半角スペース, $
	PS1_5_DOLLER_COLOR='00'
fi

# dev (docker in daisuke-lubuntu)
if [ $(uname -n) = "dev" ]; then
	# ユーザ名@ホスト名
	PS1_2_USERHOST_COLOR='00;38;05;227'
	# 区切り文字(:)
	PS1_3_SEPARATOR_COLOR='00;38;05;227'
	# カレントディレクトリ$
	PS1_4_DIR_COLOR='00;38;05;227'
	# 半角スペース, $
	PS1_5_DOLLER_COLOR='00'
fi

# daisuke-raspi01
if [ $(uname -n) = "daisuke-raspi01" ]; then
	# ユーザ名@ホスト名
	PS1_2_USERHOST='00;32'
	# 区切り文字(:)
	PS1_3_SEPARATOR='00;32'
	# カレントディレクトリ$
	PS1_4_DIR='00;32'
	# 半角スペース, $
	PS1_5_DOLLER='00'
fi

# daisuke-raspi02
if [ $(uname -n) = "daisuke-raspi02" ]; then
	# ユーザ名@ホスト名
	PS1_2_USERHOST='00;38;05;87'
	# 区切り文字(:)
	PS1_3_SEPARATOR='00;38;05;87'
	# カレントディレクトリ$
	PS1_4_DIR='00;38;05;87'
	# 半角スペース, $
	PS1_5_DOLLER='00'
fi

# daisuke-letsnote
if [ $(uname -n) = "daisuke-letsnote" ]; then
	# ユーザ名@ホスト名
	PS1_2_USERHOST='00;38;05;211'
	# 区切り文字(:)
	PS1_3_SEPARATOR='00;38;05;211'
	# カレントディレクトリ$
	PS1_4_DIR='00;38;05;211'
	# 半角スペース, $
	PS1_5_DOLLER='00'
fi


# PS1文字列の作成

# ルートディレクトリ
PS1_1_ROOT='${debian_chroot:+($debian_chroot)}'
# ユーザ名@ホスト名
PS1_2_USERHOST='\[\e[${PS1_2_USERHOST_COLOR}m\]\u@\h\[\e[00m\]'
# 区切り文字(:)
PS1_3_SEPARATOR='\[\e[${PS1_3_SEPARATOR_COLOR}m\]:\[\e[00m\]'
# カレントディレクトリ$
PS1_4_DIR='\[\e[${PS1_4_DIR_COLOR}m\]\w\[\e[00m\]'
# 半角スペース, $
PS1_5_DOLLER='\[\e[${PS1_5_DOLLER_COLOR}m\] \$\[\e[00m\]'
# スペース
PS1_6_SPACE=' '

# PS1の設定

PS1=${PS1_1_ROOT}
PS1=$PS1${PS1_2_USERHOST}
PS1=$PS1${PS1_3_SEPARATOR}
PS1=$PS1${PS1_4_DIR}
PS1=$PS1${PS1_5_DOLLER}
PS1=$PS1${PS1_6_SPACE}

# 使用しない環境変数の開放

unset PS1_2_USERHOST_COLOR
unset PS1_3_SEPARATOR_COLOR
unset PS1_4_DIR_COLOR
unset PS1_5_DOLLER_COLOR

unset PS1_1_ROOT
unset PS1_2_USERHOST
unset PS1_3_SEPARATOR
unset PS1_4_DIR
unset PS1_5_DOLLER
unset PS1_6_SPACE

