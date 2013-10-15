set nocompatible

if has('vim_starting')
  set runtimepath+=$HOME/.bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.bundle'))

" base {{{
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimproc', {
\  'build': {
\     'mac' : 'make -f make_mac.mak',
\     'unix': 'make -f make_unix.mak',
\     'cygwin': 'make -f make_cygwin.mak',
\   },
\ }
NeoBundle 'itchyny/lightline.vim'
" }}}

" unite {{{
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload': {'commands': [
\       {'name': 'Unite', 'complete': 'customlist,unite#complete_source'},
\       'UniteWithBufferDir',
\   ]}
\ }
NeoBundleLazy 'Shougo/unite-outline', {
\   'depends': 'Shougo/unite.vim',
\   'autoload': {'unite_sources': 'outline'}
\ }
NeoBundleLazy 'ujihisa/unite-colorscheme', {
\   'depends': 'Shougo/unite.vim',
\   'autoload': {'unite_sources': 'colorscheme'}
\ }
" }}}

" quickrun {{{
NeoBundleLazy 'hamaco/quickrun-hook-u-nya-'
NeoBundleLazy 'thinca/vim-quickrun', {
\   'depends': ['Shougo/unite.vim', 'hamaco/quickrun-hook-u-nya-'],
\   'autoload' : {'mappings' : ['<Leader>r', '<Plug>(quickrun)']},
\ }
NeoBundleLazy 'karakaram/vim-quickrun-phpunit', {
\   'depends': 'thinca/vim-quickrun'
\ }
NeoBundleLazy 'osyo-manga/shabadou.vim', {
\   'depends': 'thinca/vim-quickrun'
\ }
NeoBundleLazy 'osyo-manga/unite-quickfix', {
\   'depends': ['Shougo/unite.vim', 'thinca/vim-quickrun']
\ }
NeoBundleLazy 'jceb/vim-hier'
NeoBundleLazy 'osyo-manga/vim-watchdogs', {
\   'depends': ['Shougo/vimproc', 'thinca/vim-quickrun', 'jceb/vim-hier', 'osyo-manga/unite-quickfix', 'osyo-manga/shabadou.vim'],
\   'autoload': {
\     'insert': 1,
\   }
\ }
" }}}

" neocomplete {{{
NeoBundleLazy 'Shougo/neocomplete', {
\   'vim_version': '7.3.885',
\   'autoload': {
\     'insert': 1,
\   }
\ }
NeoBundleLazy 'Shougo/neosnippet', {
\   'vim_version': '7.3.885',
\   'depends': 'Shougo/neocomplete',
\   'autoload': {
\     'insert': 1,
\     'filetypes': 'snippet',
\     'unite_sources': ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
\   }
\ }
" }}}

" git {{{
" autocmd で頑張ってるので Lazy できなさそう?
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
" NeoBundleLazy 'airblade/vim-gitgutter'
" }}}

" php {{{
NeoBundleLazy 'vim-scripts/php_localvarcheck.vim', {
\   'autoload': {'filetypes': 'php'}
\ }
NeoBundleLazy 'StanAngeloff/php.vim', {
\   'autoload': {'filetypes': 'php'}
\ }
" }}}

" html {{{
NeoBundleLazy 'vim-scripts/indenthtml.vim', {
\   'autoload': {'filetypes': 'html'}
\ }
" }}}

" javascript {{{
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
\   'autoload': {'filetypes': 'javascript'}
\ }

NeoBundleLazy 'kchmck/vim-coffee-script', {
\   'autoload': {'filetypes': 'coffee'}
\ }
" }}}

" blog {{{
NeoBundleLazy 'tangledhelix/vim-octopress'
NeoBundleLazy 'glidenote/octoeditor.vim', {
\   'depends': 'tangledhelix/vim-octopress',
\   'autoload': {'commands': ['OctopressList', 'OctopressNew']}
\ }
" }}}

" twitter {{{
NeoBundleLazy 'tyru/open-browser.vim', {
\   'autoload': {'mappings' : '<Plug>(openbrowser-'}
\ }

NeoBundleLazy 'basyura/twibill.vim'
NeoBundleLazy 'basyura/TweetVim', {
\   'depends': ['tyru/open-browser.vim', 'basyura/twibill.vim'],
\   'autoload': {'commands': 'TweetVimHomeTimeline'}
\ }
NeoBundleLazy 'rhysd/tmpwin.vim', {
\   'autoload': {'functions': 'tmpwin#toggle'}
\ }
" }}}

" colorscheme {{{
NeoBundle 'vim-scripts/newspaper.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'git://gist.github.com/187578.git', {'directory' : 'h2u_white'}
" }}}

NeoBundleLazy 'tyru/caw.vim', {
\   'autoload': {'mappings': '<Plug>(caw:prefix)'}
\ }
NeoBundleLazy 'tyru/current-func-info.vim', {
\   'autoload': {'functions': 'cfi#format'}
\ }
NeoBundleLazy 'Shougo/vimfiler', {
\   'depends': 'Shougo/unite.vim',
\   'autoload': {
\     'commands': [
\        {'name' : 'VimFiler', 'complete': 'customlist,vimfiler#complete'},
\        'VimFilerExplorer'
\     ],
\     'explorer': 1,
\   }
\ }
NeoBundleLazy 'Shougo/vimshell', {
\   'depends': 'Shougo/vimproc',
\   'autoload': {
\       'commands': [
\           {'name': 'VimShell', 'complete': 'customlist,vimshell#complete'},
\           'VimShellPop', 'VimShellExecute',
\       ],
\       'mappings': ['<Plug>(vimshell_switch)'],
\ }}

NeoBundleLazy 'h1mesuke/vim-alignta', {
\   'autoload': {'commands': ['Alignta']},
\ }




" other
NeoBundleLazy 'rhysd/clever-f.vim', {
\   'autoload': {
\     'mappings': ['f', 'F', 't', 'T']
\   }
\ }
NeoBundleLazy 'kana/vim-smartchr'
NeoBundleLazy 'kana/vim-smartinput', {
\   'autoload': {'insert': 1}
\ }
NeoBundleLazy 'kana/vim-smartword', {
\   'autoload': {
\     'mappings': '<Plug>(smartword-'
\   }
\ }

NeoBundleLazy 'kana/vim-niceblock'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace', {
\   'depends': 'kana/vim-operator-user',
\ }
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/sonictemplate-vim'

NeoBundleLazy 'mattn/webapi-vim'
NeoBundleLazy 'mattn/gist-vim', {
\   'depends': 'mattn/webapi-vim',
\   'autoload': {'commands': ['Gist']}
\ }
" NeoBundleLazy 'teramako/instant-markdown-vim'
NeoBundleLazy 'thinca/vim-localrc'
NeoBundleLazy 'thinca/vim-ref', {
\   'autoload': {
\     'commands': ['Ref'],
\     'mappings': ['K', '<Plug>(ref-keyword)'],
\   }
\ }
NeoBundleLazy 'kana/vim-submode'
NeoBundleLazy 'osyo-manga/vim-hideout', {
\   'autoload': {'commands': ['HideoutOn']}
\ }
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundleLazy 'tyru/autochmodx.vim'
NeoBundleLazy 'tyru/eskk.vim', {
\   'autoload': {'mappings' : [['i', '<Plug>(eskk:toggle)']]}
\ }
NeoBundle 'tyru/vim-altercmd'
NeoBundleLazy 'tyru/restart.vim', {
\   'gui': 1,
\   'autoload': {'commands': ['Restart', 'RestartWithSession']}
\ }
NeoBundle 'ujihisa/shadow.vim'
NeoBundleLazy 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundleLazy 'majutsushi/tagbar'

NeoBundle 'osyo-manga/vim-pronamachang', {
\   'depends' : ['osyo-manga/vim-sound', 'Shougo/vimproc']
\ }
NeoBundle 'osyo-manga/vim-automatic', {
\   'vim_version': '7.3.895',
\   'depends':     'osyo-manga/vim-gift',
\ }

NeoBundleLazy 'supermomonga/shaberu.vim', {
\   'depends': 'Shougo/vimproc'
\ }
NeoBundleLazy 'rking/ag.vim', {
\   'autoload': {
\     'commands': [{'name': 'Ag', 'complete': 'file'}]
\ }}

NeoBundleLazy 'thinca/vim-scouter', {
\   'autoload': {'commands': ['Scouter']}
\ }
NeoBundleLazy 'thinca/vim-prettyprint', {
\   'autoload': {'commands': ['PP', 'PrettyPrint']}
\ }



NeoBundleLazy 'deris/vim-rengbang', {
\   'autoload': {'commands': ['RengBang', 'RengBangUsePrev']}
\ }

NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'

filetype indent plugin on

" vim: foldmethod=marker
