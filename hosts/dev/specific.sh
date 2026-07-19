#PATHの設定
#$SHLVL = 1 の時のみ実施
if [ $SHLVL = 1 ]; then
	# rust
	export PATH="$HOME/.cargo/bin:$PATH"
	:
fi
