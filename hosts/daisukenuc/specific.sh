# obsidian mcp向けの証明書設定
export NODE_EXTRA_CA_CERTS="$HOME/obsidian-cert.pem"

#$SHLVL = 1 の時のみ実施
if [ $SHLVL = 1 ]; then
	sageenv () {
		source ~/miniforge3/bin/activate
		conda activate sage
	}

	sagecode () {
		source ~/miniforge3/bin/activate
		conda activate sage
		code .
	}
	sagejupyter () {
		source ~/miniforge3/bin/activate
		conda activate sage
		jupyter lab
	}
	globalenv () {
		while [ ! -z "$CONDA_DEFAULT_ENV" ]; do
		conda deactivate
		done
	}
fi
