set number
set autoindent
set hlsearch
set wrap
set list
set listchars=tab:>-,trail:$
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
autocmd FileType javascript     setlocal sw=2 sts=2 ts=2 et
autocmd FileType scala setlocal sw=2 sts=2 ts=2
autocmd FileType ruby setlocal sw=2 sts=2 ts=2
autocmd FileType css setlocal sw=2 sts=2 ts=2
autocmd FileType scss setlocal sw=2 sts=2 ts=2
autocmd FileType ts setlocal sw=2 sts=2 ts=2
autocmd FileType asm setlocal noexpandtab
autocmd FileType lnk setlocal noexpandtab

set statusline=%F%m%r%h%w\ TYPE=%Y\ POS=%04l,%04v\ LEN=%L
set wildmode=list:longest
set t_Co=256

set laststatus=2

set expandtab
set ts=4

auto FileType java :set foldmethod=marker foldmarker={,}

set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp

" let twitvim_browser_cmd = "firefox"
" let twitvim_count = 100

set guifont=あずきフォント


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
"tweet
nmap <C-t>s :TweetVimSay<CR>
"gtags
map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$HOME/.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-localrc')
call dein#add('leafgarland/typescript-vim')
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')
call dein#add('itchyny/lightline.vim')
call dein#add('vimwiki/vimwiki')
call dein#add('tpope/vim-endwise')
call dein#add('rhysd/clever-f.vim')
call dein#add('derekwyatt/vim-scala')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------




"on github
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/vimfiler'
" NeoBundle 'Shougo/vimproc', {
"       \ 'build' : {
"       \     'windows' : 'make -f make_mingw32.mak',
"       \     'cygwin' : 'make -f make_cygwin.mak',
"       \     'mac' : 'make -f make_mac.mak',
"       \     'unix' : 'make -f make_unix.mak',
"       \    },
"       \ }
" NeoBundle 'supermomonga/unite-sudden-death'
" NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'glidenote/octoeditor.vim'
" NeoBundle 'chazmcgarvey/vimcoder'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'sophacles/vim-processing'
" NeoBundle 'basyura/TweetVim'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'basyura/twibill.vim'
" NeoBundle 'h1mesuke/unite-outline'
" NeoBundle 'basyura/bitly.vim'
" NeoBundle 'derekwyatt/vim-scala'
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'claco/jasmine.vim'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'szw/vim-tags'
" NeoBundle 'vim-scripts/errormarker.vim.git'
" NeoBundle 'wincent/Command-T'
" NeoBundle 'alpaca-tc/alpaca_tags'
" NeoBundle 'tpope/vim-rails'
" NeoBundle 'basyura/unite-rails'
" NeoBundle 'AndrewRadev/switch.vim'
" NeoBundle 'basyura/unite-rails'
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'yuku-t/vim-ref-ri'
" NeoBundle 'hewes/unite-gtags'

"ふぇぇ☆*✲ﾟ*｡(((´♡‿♡`+)))｡*ﾟ✲*☆10万円ほしいでしゅ
"
"on www.vim.org
" NeoBundle 'Align'
" NeoBundle 'omlet.vim'
" NeoBundle 'verilog.vim'
" NeoBundle 'verilog_systemverilog.vim'
" NeoBundle 'pyte'


filetype plugin indent on

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

"vim-wiki
let g:vimwiki_list = [ 
    \ {'path':'~/Dropbox/vimwiki/ls1021a','gohome':'vsplist'},
    \ {'path':'~/Dropbox/vimwiki/linux-sunxi','gohome':'vsplist'},
    \ {'path':'~/Dropbox/tkread','path_html':'~/Dropbox/tkread_html','gohome':'vsplit'},
    \ {'path':'~/Dropbox/diary','gohome':'vsplist'},
    \ {'path':'~/Dropbox/mptkread','gohome':'vsplist'},
    \ {'path':'~/Dropbox/tmread','gohome':'vsplist'},
    \ {'path':'~/Dropbox/tkmemo','gohome':'vsplist'},
    \ {'path':'~/Dropbox/safegread','path_html':'~/Dropbox/srhtml','gohome':'vsplit'}]
set nocompatible
filetype plugin on
syntax on

"rails
if !exists('loaded_matchit')
    " matchitを有効化
    runtime macros/matchit.vim
endif


" if exists('&ambiwidth')
"     set ambiwidth=double
" endif
