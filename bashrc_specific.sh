#!/bin/bash

# ホスト固有の設定
# hosts/<hostname>/specific.sh が存在すればそれを読み込む
HOST_SPECIFIC_CONFIG="$DOTFILES_DIR/hosts/$(uname -n)/specific.sh"
if [ -f "$HOST_SPECIFIC_CONFIG" ]; then
	source "$HOST_SPECIFIC_CONFIG"
fi
unset HOST_SPECIFIC_CONFIG

