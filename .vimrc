" John's .vimrc
"===============
" with great help from
"   James Pickard  (http://github.com/euoia)
"   Gabriel Guzman (https://github.com/gabeguz)


" VimPlug plugins 
    " Plugins are installed using https://github.com/junegunn/vim-plug
    "
    " Plugins need to load before everything else because some settings
    " require plugins to be loaded (e.g. setting the colourscheme requires
    " vim-colorschemes).
    call plug#begin('~/.nvim/plugged')

        Plug 'junegunn/seoul256.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'junegunn/vim-easy-align'
        Plug 'https://github.com/junegunn/vim-github-dashboard.git'
        Plug 'bling/vim-airline'

        Plug 'mxw/vim-jsx'

        Plug 'SirVer/ultisnips' 
        Plug 'Valloric/YouCompleteMe'

        Plug 'chriskempson/base16-vim' " Optional colorscheme


        Plug 'git@github.com:euoia/vim-neosnippet-snippets.git' " Snippets
        Plug 'marijnh/tern_for_vim'
        Plug 'mustache/vim-mustache-handlebars'
        Plug 'groenewege/vim-less'
        Plug 'pangloss/vim-javascript'
        
        Plug 'rking/ag.vim'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-jdaddy'
        Plug 'tpope/vim-markdown'
        Plug 'vim-scripts/mru.vim'

    call plug#end()

"----------------------------------------------

if has('gui_running')
	set guifont=Source\ Code\ Pro:h12
endif

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234
colo seoul256

let g:jsx_ext_required = 0 " Allow JSX in normal JS files





set nocompatible
set noexrc
syntax on

let mapleader=','

set nowrapscan

set grepprg=ag\ --smart-case\ --nocolor\ --nogroup\ --column
set grepformat=%f:%l:%c:%m

set t_Co=256

" Which register to use for yanked text.
" unnamed - use the operating system clipboard.
set clipboard=unnamed


" Whether to load filetype-specific settings. Vim itself comes with some
" sensible default settings for many file types. If this is on, when one
" of those file types is opened, the settings will be sourced from
" $VIMRUNTIME/ftplugin/<file type>.vim.
filetype plugin indent on

" Whether to automatically switch the vim current working directory to the
" directory of the current file.
set noautochdir

" Comma-separated list of settings for the behaviour of backspace. In vi,
" for example, backspace cannot remove pre-existing characters in inser
" mode.
set backspace=indent,eol,start


" Whether to make backup files of every file that is edited.
set backup

" Where to store backup files.
set backupdir=~/.vim/backup

" Where to store swap files.
set directory=~/.vim/tmp

" Which end-of-line character to use, in order of preference.
set fileformats=unix,mac,dos
set noswapfile

" Whether to unload buffers when they are not in a window.
" hidden - do not unload buffers.
" nohidden - unload buffers.
set hidden

" Which characters are considered part of a "word" for the purpose of word
" movements. It's sometimes a good idea to change this on a per-filetype
" basis using autocmd.
set iskeyword+=_,@,%,#


" Whether to use the bell for error messages.
set noerrorbells

" Whether to use a visual bell instead of making a noise. To enable this
" in GUI vims this needs to be set in ~/.gvimrc.
set novisualbell


" Whether to show a menu for command completions. If this is off,
" completions cycle without showing the list they are cycling through.
    set wildmenu

    " Comma-separated list specifying what to do when the completion menu is
    " displayed and 'wildchar' is entered.
    set wildmode=full

    " Comma-separated list of patterns. This tells vim which files to ignore
    " when completing filenames and directory names.
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png,DEAD,.DS_Store

    " How many commands to remember in the history.
    set history=5000

    " Whether to automatically indent the cursor after pressing return.
    set autoindent

    " Whether to use persistent undo. Persistent undo keeps the undo history
    " even after a file is closed and reopened.
    set undofile


    " Which directory to store the undo history files in.
    set undodir=~/.vim/undo


" Whether to highlight the current column of the cursor.
    set nocursorcolumn

    " Whether to highlight the current line.
    set cursorline

    " Whether to incrementally search as each character is entered.
    set incsearch

    " Whether to show a status line (0=never, 1=sometimes, 2=always).
    set laststatus=2


    " Number of additional pixels between lines.
    set linespace=0

    " Whether to show tab characters visually.
    set list

    " When 'list' is on, which characters to use.
    set listchars=tab:>-,trail:-
    


    
    " Whether to highlight matching brackets.
    set showmatch

    " Tenths of a second to blink matching brackets for.
    set matchtime=0

    " Whether to highlight all matches of the current search.
    set hlsearch

    " Whether to move the cursor to the start of line after some commands (see
    " help for full list).
    set nostartofline

    " Whether to show line numbers in the gutter.
    set number

    
    " Width of the line number gutter.
    set numberwidth=5

    " Threshold for reporting number lines changed.
    set report=0


    
    " Show cursor positions (overridden by 'statusline').
    set ruler

    " Number of lines to keep for scope at top and bottom of window.
    set scrolloff=10

    " Number of lines to keep for scope at side of window.
    set sidescrolloff=10

    " Settings for shortening messages; avoid 'press a key' prompt.
    set shortmess=aOstT

    " Whether to show the command being typed.
    set showcmd


    set statusline=%f%m%r\ [%p%%\ %Ll]%=%<%{substitute(getcwd(),$HOME,'~','')}
    "              | | | |  | | | |   | | |
    "              | | | |  | | | |   | | +--- Vim working directory.
    "              | | | |  | | | |   | |      (use ~ for $HOME).
    "              | | | |  | | | |   | |
    "              | | | |  | | | |   | +--- Truncate the line here.
    "              | | | |  | | | |   +--- Everything after this is right
    "              | | | |  | | | |        aligned.
    "              | | | |  | | | +--- Number of lines in the file.
    "              | | | |  | | +--- A space.
    "              | | | |  | +--- A percentage symbol.
    "              | | | |  +--- Percentage through file in lines.
    "              | | | +--- A space.
    "              | | +--- Show a flag if the file is readonly.
    "              | +--- Show a flag if the file is modified and unsaved.
    "              +--- The filename relative to vim's current directory.
    "
    "
    "
    "              
    "
    "              
    " Whether to be case-sensitive in searches.
    set ignorecase

    " Whether to be case-sensitive only when a search contains upper-case
    " characters.
    set smartcase

    " Same as smartcase but for insert-mode completions.
    set infercase

    " Whether to show long lines wrapped onto the next screen line.
    " wrap - Show long lines wrapped.
    " nowrap - Long lines go off the edge of the screen.
    set nowrap " do not wrap line



    
    " Tabs and spaces {{
        " These are just defaults. In many cases it's appropriate to override
        " these for specific file types using autocmd. Vim's tab and spacing
        " options are unfortunately a bit confusing. This page is helpful:
        " http://tedlogan.com/techblog3.html

        " Whether to use spaces or tabs for indentation.
        " expandtab - use spaces.
        " noexpandtab - use tabs.
        set noexpandtab

        " Number of spaces to use for each step of autoindenting and when
        " adjusting indent using visual-mode '>' and '<'.
        set shiftwidth=4

        " Whether to round indents to the nearest multiple of 'shiftwidth'.
        set shiftround

        " How many spaces a tab counts for in the display.
        set tabstop=4

        " Number of spaces to insert when pressing <tab> or
        " delete when pressing backspace.
        set softtabstop=4



        
" Folding {{
    " Whether to enable folding.
    set foldenable

    " Comma separated pair of strings which indicate the start and end of a
    " fold. It is appropriate to override this on a per-file type basis.
    set foldmarker={,}

    " When to fold. Vim provides several options, see the help.
    set foldmethod=marker

    " The threshold for folding. Zero closes all folds. Higher numbers close
    " fewer folds.
    set foldlevel=100

    " Which types of commands open folds.
    set foldopen=block,mark,percent,quickfix,tag

    " This function is used to override the default text shown for a fold.
    " It returns the text to be displayed for the fold line.
    function! SimpleFoldText()
        return getline(v:foldstart).' '
    endfunction

    " What to display on fold lines.
    set foldtext=SimpleFoldText()
" }}
"
	autocmd FileType javascript let b:JsFormat_config = "~/.js-beautify.json"
	autocmd FileType javascript nmap <silent> <buffer> <F1> :JsFormat<cr>
	autocmd FileType javascript vmap <silent> <buffer> <F1> :JsFormat<cr>

	let b:match_ignorecase = 1


	nnoremap <F2> :silent :MRU<cr>
    let MRU_Max_Entries=1000


	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.vim$', '\~$', '^CVS$']

	" Do not clobber my mappings for next and previous tab.
	let NERDTreeMapJumpLastChild='\J'
	let NERDTreeMapJumpFirstChild='\K'

	" When to change vim's working directory.
	" 1 - Only change when NERDTree is first opened.
	" 2 - Whenever the root changes.
	let NERDTreeChDirMode=2

	" If NERDTree is the only window left, close it.
	function! CheckNERDTree()
		if bufname("%") =~ "NERD_tree"
			if len(tabpagebuflist()) == 1
				:bd
			endif
		endif
	endfunction

	if has("gui_macvim")
		nnoremap <silent> <D-M> :NERDTreeMirror<cr>
		nnoremap <silent> <D-N> :NERDTreeToggle<cr>
	endif

	autocmd BufEnter * call CheckNERDTree()

	let NERDTreeIgnore += ['\.pyc$']


	
        " Whether to open the tag list automatically.
        let Tlist_Auto_Open=1

        " Whether the tag list should update automatically.
        let Tlist_Auto_Update=1

        " Whether to use the small version of the menu.
        let Tlist_Compact_Format = 1

        " Path to ctags.
        let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

        " Whether to use folding.
        let Tlist_Enable_Fold_Column = 0

        " Whether to auto close folds.
        let Tlist_File_Fold_Auto_Close = 0

        " Whether to just show the current buffer's tags (as opposed to all
        " open buffers).
        let Tlist_Show_One_File = 1

        " Order tags by appearance within file.
        let Tlist_Sort_Type = "order"

        " Exit vim when TList is the only remaining window.
        let Tlist_Exist_OnlyWindow = 1

         " Split to the right side of the screen
        let Tlist_Use_Right_Window = 1

         " 40 columns wide, makes reading function names easier.
        let Tlist_WinWidth = 40

        " Faster highlighting of current tag in taglist window (default was 4000).
        set updatetime=100

        " Language specifics {{
            " Just functions, classes and constants. No variables.
            let tlist_php_settings = 'php;c:class;d:constant;f:function'

            " Tags for JavaScript. Requires custom .ctags. See
            " http://stackoverflow.com/questions/1790623/how-can-i-make-vims-taglist-plugin-show-useful-information-for-javascript
            let tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'
        " }}

        " Use a status line that includes TagList current tag.
        " Add this to get the current tag: %{Tlist_Get_Tagname_By_Line()}
        set statusline=%f%m%r\ %{Tlist_Get_Tagname_By_Line()}\ [%p%%\ %Ll]%=%<%(%)%{substitute(getcwd(),$HOME,'~','')}

        nnoremap <silent> <F4> :TlistToggle<cr>


		let g:UltiSnipsSnippetsDir = "~/.vim/plugged/vim-neosnippet-snippets/MyUltiSnips"
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        let g:UltiSnipsSnippetDirectories=["MyUltiSnips", "UltiSnips"]
        let g:UltiSnipsEditSplit="horizontal"


		" Filetype auto commands {{
    " Coffeescript {{
        autocmd FileType coffee setlocal shiftwidth=2
        autocmd FileType coffee setlocal softtabstop=2
        autocmd FileType coffee setlocal tabstop=2
        autocmd FileType coffee setlocal expandtab
    " }}
    " Ruby {{
        " ruby standard 2 spaces, always
        autocmd BufRead,BufNewFile *.rb,*.rhtml setlocal shiftwidth=2
        autocmd BufRead,BufNewFile *.rb,*.rhtml setlocal softtabstop=2
    " }}
    " Html {{
        autocmd FileType html setlocal noexpandtab
        autocmd FileType html setlocal softtabstop=4
        autocmd FileType html setlocal shiftwidth=4
        autocmd FileType html setlocal tabstop=4
        autocmd FileType html setlocal isk=@,48-57,_,192-255,_,@,%,$,-

    " }}

	hi link jsObjectKey Identifier
	hi link jsFunctionKey Identifier
	hi link jsFunction Identifier
	hi link jsLabel Special



" JSON {{
        " npm package.json defaults.
        au FileType json setlocal expandtab
        au FileType json setlocal list
        au FileType json setlocal softtabstop=2
        au FileType json setlocal shiftwidth=2
        au FileType json setlocal tabstop=2

    " }}
    " Less {{
        au FileType less setlocal noexpandtab
        au FileType less setlocal softtabstop=4
        au FileType less setlocal shiftwidth=4
        au FileType less setlocal tabstop=4
        au FileType less setlocal nolist

        " Testing auto save.
        au Filetype less inoremap <buffer> <Esc> <Esc>:w<CR>
        au BufLeave *.less :silent wa
        au FocusLost *.less :silent wa
    " }}
    " Vim {{
        autocmd FileType vim setlocal tabstop=4
        autocmd FileType vim setlocal shiftwidth=4
        autocmd FileType vim setlocal expandtab
        autocmd FileType vim setlocal list
    " }}
	" PHP {{
        " The dollar is not part of identifier.
        autocmd FileType php setlocal iskeyword-=$

        " Format as paragraph regardless of trailing whitespace.
        autocmd FileType php setlocal formatoptions-=w

        " Vim was beeping at my for not matching the '>' symbol when typing
        " '=>' due to including ftplugin/html.vim matchpairs.
        autocmd FileType php setlocal matchpairs-=<:>
        autocmd FileType php setlocal foldmethod=manual
        autocmd FileType php setlocal nofoldenable
        autocmd FileType php setlocal expandtab
        autocmd FileType php setlocal list

        " https://github.com/m2mdas/phpcomplete-extended
        autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
    " }}
	"
	" Commands and functions {{
    " Copy the current filename into the clipboard.
    command! FN :let @+ = expand("%")

    " Change directory of current window to directory of current file.
    command! CD :lcd %:p:h

    " Git related {{
        " Add and commit the current file with a message.
        function! CommitThis(msg)
            write
            :!git add %
            execute "!git commit -m " . a:msg
        endfunction

        " Commit the current file with a message.
        command! -nargs=1 CT call CommitThis(<f-args>)

        " Commit with a message and push.
        command! -nargs=1 CTP execute 'call CommitThis(<f-args>)' | :!git push
        

        " Push.
        command! GP :!git push
    " }}
	"
	
    " Replace tabs with spaces, except at the start of lines.
    command! RetabIndents call RetabIndents()
    func! RetabIndents()
        let saved_view = winsaveview()
        execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
        call winrestview(saved_view)
    endfunc

	
    " Lookup words. Note that according to the following discussion, google's
    " I'm Feeling Lucky search does not always work unless the referrer is
    " google.com.
    function! JSLookupKeyword(kw)
        " Must escape % or it will be replaced with the file name.
        " Duck Duck Go I'm feeling ducky:
        " execute '!open "https://duckduckgo.com/?q=\!+javascript+' . a:kw . '"'

        " Google I'm feeling lucky:
        execute '!open "http://www.google.com/search?q=javascript+' . a:kw . '&btnI=Im+Feeling+Lucky"'
    endfunction

    function! ExpressLookup(kw)
        " Must escape % or it will be replaced with the file name.
        " Duck Duck Go I'm feeling ducky:
        " execute '!open "https://duckduckgo.com/?q=\!+node.js+express+' . a:kw . '"'

        " Google I'm feeling lucky:
        execute '!open "http://www.google.com/search?q=node.js+express+' . a:kw . '&btnI=Im+Feeling+Lucky"'
    endfunction

    function! Search(kw)
        " Must escape % or it will be replaced with the file name.
        " Duck Duck Go I'm feeling ducky:
        " execute '!open "https://duckduckgo.com/?q=\!+node.js+express+' . a:kw . '"'

        " Google I'm feeling lucky:
        execute '!open "http://www.google.com/search?q=' . a:kw . '&btnI=Im+Feeling+Lucky"'
    endfunction

    function! TclLookup(kw)
        execute '!open "http://www.tcl.tk/man/tcl/TclCmd/' . a:kw . '.htm"'
    endfunction


	" Fixes and workarounds {{
    " http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
    if &term =~ "xterm.*"
        let &t_ti = &t_ti . "\e[?2004h"
        let &t_te = "\e[?2004l" . &t_te
        function XTermPasteBegin(ret)
            set pastetoggle=<Esc>[201~
            set paste
            return a:ret
        endfunction
        map <expr> <Esc>[200~ XTermPasteBegin("i")
        imap <expr> <Esc>[200~ XTermPasteBegin("")
        cmap <Esc>[200~ <nop>
        cmap <Esc>[201~ <nop>
    endif



    " Trailing whitespace {{
        " ExtraWhitespace highlight group (don't allow ColorScheme to override it).
        au ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
        highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

        " Match trailing whitespace except when in insert mode
        au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        au InsertLeave * match ExtraWhitespace /\s\+$/

        " Inappropriate use of tab.
        au ColorScheme * highlight BadTab ctermbg=darkred guibg=lightblue
        highlight BadTab ctermbg=darkred guibg=lightred

        " Highlight any use of tab after a non-whitespace character.
        "
        " The \@<= means that the \S (non-whitespace) must precede \t\+ but
        " will not be included in the match.
        au FileType tcl 2match BadTab /\S\@<=\t\+/

        " Highlight any use of space before the first non-whitespace
        " character.
        au FileType tcl match BadTab /\(^\t*\)\@<=[ ]\+\s\+/

        " Never leave trailing whitespace on the current line {{
            " Disabled because it prevents UltiSnips from inserting
            " placeholders with leading whitespace. Highlighting the trailing
            " whitespace ought to be enough.
            if 0
                function! RemoveTrailingWhitespace()
                    if &ft != 'markdown'
                        let l:winview = winsaveview()
                        silent! s/\s\+$/
                        call winrestview(l:winview)
                    endif
                endfunction

                autocmd InsertLeave * call RemoveTrailingWhitespace()
            endif
        " }}
    " }}
" }}

