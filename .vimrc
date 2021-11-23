
" ////////////////////////////////////////////////////////////
" // プラグインマネージャVundleの設定
" ////////////////////////////////////////////////////////////


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" =====================================
" 以下からプラグインを追加する
" =====================================

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html

" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" =====================================
" カラースキームhybrid
Plugin 'w0ng/vim-hybrid'

" ランチャー
Plugin 'Shougo/unite.vim'

" ステータスラインの表示内容強化
Plugin 'itchyny/lightline.vim'

" インデントの可視化
Plugin 'nathanaelkane/vim-indent-guides'
" 起動時にインデント可視化
let g:indent_guides_enable_on_vim_startup = 1
" インデントの色を手動で設定
let g:indent_guides_auto_colors = 0
" 奇数列目の色の設定
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
" 偶数列目の色の設定
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237

"GLSL向けハイライト
Plugin 'tikhomirov/vim-glsl'

"doxygenコメントを挿入するプラグイン
Plugin 'DoxygenToolkit.vim'

" coc.nvim 入力補完
if system('uname -m | tr -d "\n"') == 'armv6l'
	"raspberry pi zero (arm6l)向け：<
	"pinnedによってgitの更新はされなくなる<
	"typescript-eslint/eslint-plugin<
	"がzero(arm6l)向けのnode-jsに対応していないため(v0.0.78)に固定する<
	Plugin 'neoclide/coc.nvim', {'pinned': 1}
else
	Plugin 'neoclide/coc.nvim'
endif

" vimdoc-jp
Plugin 'vim-jp/vimdoc-ja'
" 日本語ヘルプを優先する
set helplang=ja,en

" =====================================
" プラグインの追加終了 
" =====================================


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ////////////////////////////////////////////////////////////
" // 以下はプラグイン以外の設定
" ////////////////////////////////////////////////////////////

set background=dark
colorscheme hybrid

"ハイライトの設定
syntax on
        
"バックスペースキーの設定 
set backspace=indent,eol,start
        
"行番号を表示 
set number

set list  " 不可視文字を表示する
set listchars=tab:>\ ,trail:_,eol:< "タブを ">   " で表示する

"タブ文字の長さ 
set tabstop=4
set softtabstop=4 
set shiftwidth=4

"タグジャンプの設定
"複数候補がある場合は候補の一覧を出す
nnoremap <C-]> g<C-]>

"カレント行にアンダーラインを表示
"set cursorline

"検索結果をハイライトする
set hlsearch

" ステータスラインを常に表示
set laststatus=2

" make等の実行時にQuickfixを自動で開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen


"unite向けの短縮入力
cabbrev uf Unite file
cabbrev ub Unite buffer
cabbrev ufb Unite file buffer
cabbrev uo Unite outline


"全角空白の表示
highlight ZenkakuSpace ctermbg=white
match ZenkakuSpace /　/

"対応する括弧の表示の制御
highlight MatchParen ctermfg=60 ctermbg=234<

