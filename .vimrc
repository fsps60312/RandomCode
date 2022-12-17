set encoding=utf-8
set nu
set rnu
set nowrap
set bg=dark
set foldmethod=indent
set expandtab  " never wanna see a '\t' in your file, tabs keypresses will be expanded into spaces
set softtabstop=2  " how many columns of whitespace is a 'tab' keypress or a 'backspace' keypress worth
set tabstop=2
set shiftwidth=2
syntax on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Semshi provides semantic highlighting for Python in Neovim.
" " Unlike regex-based syntax highlighters, Semshi understands Python code and performs static analysis as you type. It builds a syntax tree and symbol tables to highlight names based on their scope and context. This makes code easier to read and lets you quickly identify missing imports, unused arguments, misspelled names, and more.
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-python-pep8-indent
" https://circleci.com/gh/Vimjas/vim-python-pep8-indent.svg?style=svg 
" This small script modifies Vim’s indentation behavior to comply with PEP8 and my aesthetic preferences. Most importantly:
" 
" foobar(foo,
"        bar)
" and:
" 
" foobar(
"    foo,
"    bar
" )
Plug 'Vimjas/vim-python-pep8-indent'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make your Vim/Neovim as smart as VSCode.
" True snippet and additional text editing support
" Why?
" 🚀 Fast: instant increment completion, increment buffer sync using buffer update events.
" 💎 Reliable: typed language, tested with CI.
" 🌟 Featured: full LSP support
" ❤️ Flexible: configured like VSCode, extensions work like in VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'} " :CocInstall coc-pyright before use

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode is a Vim plugin that magically converts Vim into a Python IDE.
" 
" Why Python-mode?
" 
" Be more productive: Pymode saves time by bringing all the tools necessary for professional developers so that you can focus on bigger things. It has been finely tuned based on decades of experience working with Vim and is constantly kept up to date.
" Get smart assistance: Pymode knows all about your code. We use the best-in-class intellisense code completion, on-the-fly error checking and quick-fixes; easy project navigation and much more.
" Use the full power and capabilities of Vim: Unlike traditional IDEs which can only provide a small subset of Vim functionalities, you can do everything and anything that you can in Vim.
" Modular structure: We attempt to create Python-mode with the same principles of python: i.e. have a modular structure, so that as and when better libraries evolve, we can provide you the best experience, while abstracting the details so that you can get back to what you do best.
" Written mostly in Python: 96.1% written in Python. Well, we love Python :)
" The plugin contains all you need to develop python applications in Vim.
" 
" Support Python and 3.6+
" Syntax highlighting
" Virtualenv support
" Run python code (<leader>r)
" Add/remove breakpoints (<leader>b)
" Improved Python indentation
" Python motions and operators (]], 3[[, ]]M, vaC, viM, daC, ciM, ...)
" Improved Python folding
" Run multiple code checkers simultaneously (:PymodeLint)
" Autofix PEP8 errors (:PymodeLintAuto)
" Search in python documentation (<leader>K)
" Code refactoring
" Intellisense code-completion
" Go to definition (<C-c>g)
" And more, more ...
" See a screencast here: http://www.youtube.com/watch?v=67OZNp9Z0CQ.
" 
" Another old presentation here: http://www.youtube.com/watch?v=YhqsjUUHj6g.
" 
" To read python-mode documentation in Vim, use :help pymode.
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE makes use of NeoVim and Vim 8 job control functions and timers to run linters on the contents of text buffers and return errors as text is changed in Vim. This allows for displaying warnings and errors in files being edited in Vim before files have been saved back to a filesystem.
" 
" In other words, this plugin allows you to lint while you type.
" 
" ALE offers support for fixing code with command line tools in a non-blocking manner with the :ALEFix feature, supporting tools in many languages, like prettier, eslint, autopep8, and more.
" 
" ALE acts as a "language client" to support a variety of Language Server Protocol features, including:
" 
" Diagnostics (via Language Server Protocol linters)
" Go To Definition (:ALEGoToDefinition)
" Completion (Built in completion support, or with Deoplete)
" Finding references (:ALEFindReferences)
" Hover information (:ALEHover)
" Symbol search (:ALESymbolSearch)
" If you don't care about Language Server Protocol, ALE won't load any of the code for working with it unless needed. One of ALE's general missions is that you won't pay for the features that you don't use.
Plug 'dense-analysis/ale'

" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" " Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


function SubstrWindow(l, r, i, s)
  if a:i <= a:r && a:i + +strlen(a:s) > a:l
    return a:s[max([0, a:l-a:i]):min([strlen(a:s)-1, a:r-a:i])]
  else
    return ''
  endif
endfunction

function StartsWithAndCut(s, prefix)
  if a:s[:strlen(a:prefix)-1] == a:prefix
    return [v:true, a:s[strlen(a:prefix):]]
  else
    return [v:false, a:s]
  endif
endfunction

function ReduceBufname(name)
  let name = a:name
  let home = $HOME . '/'
  let thom = '~/' " Tilde home "
  let root = '/'
  let [is_from_home, name] = StartsWithAndCut(name, home)
  let [is_from_thom, name] = StartsWithAndCut(name, thom)
  let [is_from_root, name] = StartsWithAndCut(name, root)
  let split_name_list = split(name, '/')
  if empty(split_name_list)
    return ''
  elseif len(split_name_list) == 1
    let name = split_name_list[0]
  else
    let name_list_maxlen = 5
    let [dirname, name_list, basename] = [split_name_list[0], split_name_list[1:-2], split_name_list[-1]]
    call map(name_list, {idx, val -> val[0:0] . '/'})
    if len(name_list) > name_list_maxlen + 2 " name_list_too_long "
      let name = dirname. '/../' . join(name_list[-name_list_maxlen:], '') . basename
    else
      let name = dirname . '/' . join(name_list, '') . basename
    endif
  endif
  if is_from_home || is_from_thom
    let name = '~/' . name
  endif
  if is_from_root
    let name = '/' . name
  endif
  return name
endfunction

function MyTabLabel(n)
  let label = string(a:n) . ':'
  let bufnrlist = tabpagebuflist(a:n)

  " Add '+' if one of the buffers in the tab page is modified "
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label .= '+'
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one "
  if len(bufnrlist) > 1
    let label .= len(bufnrlist)
  endif

  " Append the buffer name "
  let l:bufname = bufname(bufnrlist[tabpagewinnr(a:n) - 1])
  let label = label . ' ' . ReduceBufname(l:bufname)

  return label
endfunction

function MyTabLine()
  let g:tlss = range(tabpagenr('$')) " tablabelstrs "
  let term_width = winwidth('%')
  call map(g:tlss, {idx, val -> '_' . MyTabLabel(val+1) . ' '})
  call map(g:tlss, {idx, val -> strlen(val) <= term_width-2 ? val : (val[:term_width/2] . '...' . val[-(term_width-term_width/2-1-5):])})
  let [tab_i, tab_n] = [tabpagenr(), tabpagenr('$')]
  let tabcharpos = [0]
  let li = 0
  for val in g:tlss
    let li += strlen(val)
    let tabcharpos += [li]
  endfor
  let s:tablineoffset = exists('s:tablineoffset') ? s:tablineoffset : 0
  let s:tablineoffset = min([s:tablineoffset, tabcharpos[tab_i-1], tabcharpos[-1] - term_width])
  let s:tablineoffset = max([s:tablineoffset, tabcharpos[tab_i] - term_width, 0])
  let [left_arrow, rigt_arrow, stick_rigt] = [s:tablineoffset > 0, s:tablineoffset < tabcharpos[-1] - term_width, s:tablineoffset == tabcharpos[tab_i] - term_width]
  if rigt_arrow
    let term_width -= 1
    if stick_rigt
      let s:tablineoffset += 1
      let left_arrow = v:true
    endif
  endif
  if left_arrow
    let term_width -= 1
    if stick_rigt
      let s:tablineoffset += 1
    endif
  endif
  echo tabcharpos[0] . '-{' . s:tablineoffset . '-[' . tabcharpos[tab_i-1] . '-' . (tabcharpos[tab_i]-1) . ']-' . (s:tablineoffset+term_width-1) . '}-' . (tabcharpos[-1]-1) . ' ' . (tabcharpos[tab_i]-tabcharpos[tab_i-1]) . '/' . term_width . '/' . (tabcharpos[-1]-tabcharpos[0])
  call map(g:tlss, {i, val -> SubstrWindow(s:tablineoffset, s:tablineoffset+term_width-1, tabcharpos[i], val)})

  let tlex = range(tab_n) " tab_line_expression "
  call map(tlex, {i, val -> (i+1==tab_i ? '%#TabLineSel#' : '%#TabLine#') . '%' . (i+1) . 'T%{tlss[' . i . ']}'})
  let tlex = join (tlex, '')
  if left_arrow
    let tlex = '%#TabLineFill#<' . tlex
  endif
  if rigt_arrow
    let tlex = tlex . '%#TabLineFill#>'
  endif

  " after the last tab fill with TabLineFill and reset tab page nr "
  let tlex .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page "
  " if tabpagenr('$') > 1 && 0 "
  "   let tlex .= '%=%#TabLine#%999Xclose' "
  " endif "

  return tlex
endfunction

set tabline=%!MyTabLine()
