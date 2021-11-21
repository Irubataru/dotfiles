"
"" - Plugin settings/options for vim -
"

"CtrlSpace
"{{{

"let g:CtrlSpaceIgnoredFiles = '\v(doc|devel)[\/]'
let g:CtrlSpaceIgnoredFiles = '\v(data|doc)[\/]'

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"}}}

"UltiSnips
"{{{

let g:UltiSnipsExpandTrigger = "<Leader>ue"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"}}}

"vim-cpp-enhanced-highlight
"{{{

let g:cpp_experimental_template_highlight = 1

"}}}

"vim-template
"{{{

let g:templates_no_autocmd = 1
let g:templates_directory = "$HOME/.vim/templates"

"}}}

"vimtex
"{{{

let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = "zathura"
let g:tex_conceal="abdgm"

"}}}

"lightline
"{{{

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Disable the tabline for CtrlSpace
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }

"}}}

"vim-fugitive
"{{{

if has("autocmd")
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

"}}}

"vim-session
"{{{

let g:session_autosave = 'no'

"}}}

"localvimrc
"{{{

let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

"}}}

"operator-flashy
"{{{

" Need this for Base16 colours
"let g:operator#flashy#group = 'Base16Flashy'

"}}}

"vim-clang-format
"{{{

let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakBeforeBraces" : "Allman",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "Standard" : "C++11"}

"}}}

"indentLine
"{{{

let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0

"}}}

"GoYo / Limelight
"{{{

let g:goyo_width=100

function! s:goyo_enter()
  " Disable tmux to get a clean window
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z

  " No vim info either
  set noshowmode
  set noshowcmd
  set signcolumn=no
  "set scrolloff=999

  " Also enable Limelight
  Limelight

  " For some reason I have to disable lightline manually
  call lightline#disable()
endfunction

function! s:goyo_leave()
  " Enable tmux again
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z

  " Re-enable vim info
  set showmode
  set showcmd
  set signcolumn=yes
  "set scrolloff=5

  " Re-compute the CtrlSpace tabline
  set tabline=%!ctrlspace#api#Tabline()

  " Turn off Limelight
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"}}}

" SimpylFold
" {{{
let g:SimpylFold_docstring_preview = 1
" }}}
