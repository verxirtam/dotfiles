#!/bin/bash

###################################
# daisuke-lubuntu
###################################
if [ $(uname -n) = "daisuke-lubuntu" ]; then
	# jdk
	export JAVA_HOME=/usr/java/jdk1.8.0_20
	export CLASSPATH=.:/usr/java
	
	#PATHの設定
	#$SHLVL = 1 の時のみ実施
	if [ $SHLVL = 1 ]; then
		#jdk
		export PATH=/usr/java/jdk1.8.0_20/bin:$PATH
		#eclipse
		export PATH=/usr/local/eclipse:$PATH
		#STS setting 2015/12/27
		export PATH=/usr/local/sts-bundle/sts-3.7.2.RELEASE:$PATH
		:
	fi
fi


###################################
# dev
###################################
if [ $(uname -n) = "dev" ]; then
	
	#PATHの設定
	#$SHLVL = 1 の時のみ実施
	if [ $SHLVL = 1 ]; then
		# rust
		export PATH="$HOME/.cargo/bin:$PATH"
		:
	fi
fi


###################################
# daisuke-jetson
###################################
if [ $(uname -n) = "daisuke-jetson" ]; then
	
	#PATHの設定
	#$SHLVL = 1 の時のみ実施
	if [ $SHLVL = 1 ]; then
		# CUDA
		export PATH=/usr/local/cuda/bin:${PATH}
		export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
		:
	fi
fi

