#PATHの設定
#$SHLVL = 1 の時のみ実施
if [ $SHLVL = 1 ]; then
	# CUDA
	export PATH=/usr/local/cuda/bin:${PATH}
	export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
	:
fi
