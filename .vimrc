set number
set autoindent
set hlsearch
set wrap
set list
syntax on
set foldmethod=syntax
set encoding=utf-8
set shiftwidth=4
auto FileType java :set dictionary=j2se14.dict
auto FileType c :set dictionary=c.dict
auto FileType c :setlocal shiftwidth=4 
auto FileType cpp :setlocal shiftwidth=4
auto FileType ml :setlocal shiftwidth=4
auto FileType hs :setlocal shiftwidth=4
auto FileType haskell :setlocal shiftwidth=4
auto FileType omlet :setlocal shiftwidth=2
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

set statusline=%F%m%r%h%w\ TYPE=%Y\ POS=%04l,%04v\ LEN=%L
set wildmode=list:longest
set t_Co=256

set laststatus=2

set expandtab
set ts=4

auto FileType java :set foldmethod=marker foldmarker={,}

set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp

"let twitvim_login = "garasubo_"

let twitvim_browser_cmd = "firefox"
let twitvim_count = 100


autocmd FileType scheme :let is_gauche=1

imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

"vim japanese
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1

"neocomplcache
let g:neocomplcache_enable_at_startup = 0 "起動時に無効
let g:neocomplcache_disable_auto_complete = 1

" source explore
" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR> 

"NERD_tree
let g:NERDTreeHijackNetrw = 0

"for vundle
filetype off


"key bind
nmap <F5>   :make<CR>
nmap <C-F5>   :make clean all<CR>
nmap <F6>   :VimShellPop<CR>make write<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gv :Gitv --all<CR>
nmap <Leader>gp :!git push<CR>
"<Leader>u*はuniteにバインドしよう.jp
nmap <Leader>ub :Unite buffer<CR>
nmap <Leader>un :Unite -buffer-name=file file<CR>
nmap <Leader>ur :Unite file_mru<CR>
nmap <C-p> :TweetVimSay<CR>


" for neobundle
set rtp+=~/.vim/bundle/neobundle.vim

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/'))
endif
NeoBundle 'gmarik/vundle'
"on github
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'supermomonga/unite-sudden-death'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'chazmcgarvey/vimcoder'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'gregsexton/gitv'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'
NeoBundle 'vim-scripts/errormarker.vim.git'
NeoBundle 'wincent/Command-T'
NeoBundle 'vim-script/VimCoder.jar'
NeoBundle 'itchyny/lightline.vim'

"ふぇぇ☆*✲ﾟ*｡(((´♡‿♡`+)))｡*ﾟ✲*☆10万円ほしいでしゅ
"
"on www.vim.org
NeoBundle 'Align'
NeoBundle 'omlet.vim'
NeoBundle 'verilog.vim'
NeoBundle 'verilog_systemverilog.vim'
NeoBundle 'pyte'

"localrc.vim
:let g:localrc_filename = ".local.vimrc"

"<ESC>押したあと素早く日本語モードを解除できたらいいな
"なんかバグの温床になっているみたいなのでやめた
"set timeout timeoutlen=500 ttimeoutlen=500



"others

filetype plugin indent on

"project.vim
:let g:proj_flags = "imstc"
:nmap <silent> <Leader>P <Plug>ToggleProject
:nmap <silent> <Leader>p :Project<CR>

if getcwd() != $HOME
        if filereadable(getcwd(). '/.vimprojects')
                Project .vimprojects
        endif
endif

"vim-power line
set guifont=Inconsolata-Powerline:h11
"let g:Powerline_symbols = 'fancy'

"colorscheme pyte

"
"octoeditor
let g:octopress_path = "$HOME/Documents/octopress/"

"command! -nargs=? OctNewPost call octopress#new_article(<q-args>)
"let g:octopress_article_ext = "markdown"
"let g:octopress_rootdir = '~/Document/octopress'

let g:quickrun_config = {}
let g:quickrun_config.mkd = {
            \ 'outputter' : 'browser',
            \   'command': 'pandoc',
            \   'exec': '%c --from=markdown --to=html %o %s %a',
            \ }
let g:quickrun_config.processing = {
            \ 'outputter' : 'quickfix',
            \ 'command': 'processing-java',
            \ 'exec': '%c --sketch=%s:p:h --output=/tmp/vim-processing/%s:p:h:t  --run --force',
            \ }
"!processing-java --sketch="/home/champ/is/enshu3/kenyu/main" --output=/tmp/vim-processing/main --run --force
