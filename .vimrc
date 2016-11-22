
"---------------------------------------
"共通設定
"---------------------------------------

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
set cursorline
"highlight clear CursorLine

"検索結果をハイライトする
set hlsearch

" ステータスラインを常に表示
set laststatus=2

" 挿入モードで日本語入力時にEscapeキーでIMEをOFFにする
" Mozcのキー設定で、Escapeキー入力でIMEを無効化する
" Mozcプロパティ-[一般]-[キー設定]-[キー設定の選択]-[編集]
" [編集]ボタン-[エントリーを追加]で下記を入力
" ・モード：入力文字なし
" ・入力キー：Escape
" ・コマンド：キャンセル後IMEを無効化

" make等の実行時にQuickfixを自動で開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

"---------------------------------------
"ファイルタイプ別の設定
"---------------------------------------
" filetype=cpp が設定された時に呼ばれる関数
" "Vim で C++ の設定を行う場合はこの関数内で記述する
" " ここで設定する項目は各自好きに行って下さい
function! s:cpp()
	" インクルードパスを設定する
	" gf などでヘッダーファイルを開きたい場合に影響する
	setlocal path+=/usr/include,/usr/local/include,/usr/local/cuda/include

	" 空白文字ではなくてタブ文字を使用する
	setlocal noexpandtab

	" 括弧を構成する設定に <> を追加する
	" template<> を多用するのであれば
	setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
	autocmd!
	"filetype=cpp が設定された場合に関数を呼ぶ
	autocmd FileType cpp call s:cpp()
augroup END

augroup vimrc-cu
	autocmd!
	"filetype=cu が設定された場合に関数を呼ぶ
	"cppと共通にする
	autocmd FileType cuda call s:cpp()
augroup END
"---------------------------------------
"プラグインの設定
"---------------------------------------

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'

" hybrid カラースキーム
NeoBundle 'w0ng/vim-hybrid'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'

" インデントの可視化
NeoBundle 'nathanaelkane/vim-indent-guides'
" 起動時にインデント可視化
let g:indent_guides_enable_on_vim_startup = 1
" インデントの色を手動で設定
let g:indent_guides_auto_colors = 0
" 奇数列目の色の設定
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
" 偶数列目の色の設定
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237

"unite向けの短縮入力
cabbrev uf Unite file
cabbrev ub Unite buffer
cabbrev ufb Unite file buffer
cabbrev uo Unite outline

"GLSL向けハイライト
NeoBundle 'tikhomirov/vim-glsl'

"doxygenコメントを挿入するプラグイン
NeoBundle 'DoxygenToolkit.vim'
"コメントのスタイルを"///"にする<-やめる
"let g:DoxygenToolkit_commentType = "C++"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
	" neocomplete用設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
	let g:neocomplete#enable_auto_select = 1
	inoremap <expr><CR>   pumvisible() ? neocomplete#close_popup()  : "<CR>"
elseif neobundle#is_installed('neocomplcache')
	" neocomplcache用設定
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_ignore_case = 1
	let g:neocomplcache_enable_smart_case = 1
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
	" 1番目の候補を自動選択
	let g:neocomplcache_enable_auto_select = 1 
	" 補完候補が表示されている場合は確定。そうでない場合は改行
	inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"アウトラインを表示するプラグイン
NeoBundle "Shougo/unite-outline"

" スニペットを入力するプラグイン
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" スニペットを展開するキーマッピング
" <Tab> で選択されているスニペットの展開を行う
" 選択されている候補がスニペットであれば展開し、
" それ以外であれば次の候補を選択する
" また、既にスニペットが展開されている場合は次のマークへと移動する
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"


" c, c++向けのプラグイン
NeoBundle 'c.vim'

" Clangを利用した入力補完
NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\    },
	\ }
NeoBundle "osyo-manga/vim-reunions"
NeoBundle "osyo-manga/vim-marching"

" clang コマンドの設定
let g:marching_clang_command = "/usr/bin/clang-3.5"

" オプションを追加する場合
let g:marching_clang_command_option="-std=c++1y"

" インクルードディレクトリのパスを設定
let g:marching_include_paths = filter(
\	split(glob('/usr/include/c++/*'), '\n') +
\	split(glob('/usr/include/*/c++/*'), '\n') +
\	split(glob('/usr/include/*/'), '\n') +
\	split(glob('/usr/local/include/*/'), '\n') +
\	split(glob('/usr/local/cuda/include/'), '\n') +
\	split(glob('/usr/local/cuda/include/*/'), '\n'),
\	'isdirectory(v:val)')

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 環境に合わせて間隔を短くする
set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""


call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

"カラースキームの設定
"Neobundleの設定の後に入力する必要がある
set background=dark
"colorscheme desert
"colorscheme molokai
colorscheme hybrid
"colorscheme jellybeans

"全角空白の表示
highlight ZenkakuSpace ctermbg=white
match ZenkakuSpace /　/



