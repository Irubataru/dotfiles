"" - Key mappings for vim -

let mapleader=" "

" Navigation
" {{{

" Fold movement
"" Replace the zj zk calls to move to next closed fold
nnoremap <silent> zj :call NextClosedFold('j')<CR>
nnoremap <silent> zk :call NextClosedFold('k')<CR>

" Buffer movement
nnoremap <silent> <C-l> :CtrlSpaceGoDown<CR>
nnoremap <silent> <C-h> :CtrlSpaceGoUp<CR>

" Tab movement
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>

"" File navigation
"" {{{

" Start a :e with the dir of the current buffer already filled in
nnoremap ,e :e <C-R>=Get_Relative_Cwd() <CR>

"" }}}

" }}}

" UI Related
" {{{

nnoremap <Leader><Leader> zz
nnoremap <Leader>zz :let &scrolloff=810-&scrolloff<CR>
nnoremap <Leader>rf :set foldlevel=0<CR>

" Toggles for quickfix consistent with vim-unimpaired
" Toggle-command from the vim-togglelist plugin
nnoremap <script> <silent> coq :call ToggleQuickfixList()<cr>
nnoremap [oq :copen<cr>
nnoremap ]oq :cclose<cr>

" Disable EX mode
nnoremap Q <NOP>

" Replace yank with flashy-yank that highlights yanked area
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Use incsearch.vim as default search function
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" let incsearch manage hlsearch
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}

" Terminal related
" {{{

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" }}}

" Plugin keymaps
" {{{

"" coc.nvim
"" {{{

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" }}}

"" vim-easy-align
"" {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"" }}}

"" Vim-CtrlSpace
"" {{{
let g:CtrlSpaceDefaultMappingKey = "<C-b>"
"" }}}

"" vim-clang-format
"" {{{

"autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
"autocmd FileType c,cpp vnoremap <buffer><Leader>ca :ClangFormatAutoToggle<CR>

"" }}}

"" NERDCommenter
"" {{{
let NERDComInsertMap='<C-C>'
"" }}}

"" NERDTree
"" {{{
map <C-N> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" }}}

"" fzf
"" {{{

" Access to fzf functionality
nnoremap <c-p> :Files<cr>
nnoremap <leader>fh :Helptags<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fL :BLines<cr>
nnoremap <leader>fg :Commits<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" More easily accessible file completion
imap <c-f> <plug>(fzf-complete-path)

"" }}}

"" Gundo
"" {{{
nnoremap <silent> <Leader>uu :GundoToggle<CR>
"" }}}

"" fugitive.vim
"" {{{
nnoremap <silent> <Leader>gg :aboveleft 16split\|0Git<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
"" }}}

"" vim-easymotion
"" {{{
"<Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"" }}}

"" signify
"" {{{
nnoremap <silent> <Leader>ss :SignifyToggle<CR>
"" }}}

"" Goyo
"" {{{
nnoremap <silent> <C-g> :Goyo<CR>
"" }}}

"" Limelight
"" {{{
nnoremap <silent> <C-y> :Limelight!!<CR>
"" }}}

"" Linediff
"" {{{
vnoremap <silent> <leader>da :Linediff<CR>
nnoremap <silent> <leader>dr :LinediffReset<CR>
"" }}}

"" Commands for compiling and running C++ programs
"" {{{
:command C :exec ":!${CXX} -g ${CFLAGS} " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command C11 :exec ":!${CXX} -g ${CFLAGS} -std=c++11 " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command C1y :exec ":!${CXX} -g ${CFLAGS} -std=c++1y " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command R :exec "!./" .substitute(expand("%"),".cpp",".out","g")
"" }}}

" }}}

" Accompanying functions
" {{{

" Returns the path to the current buffer relative to your current working
" directory
function Get_Relative_Cwd()
  if expand("%:p:h") == getcwd()
    return ""
  else
    return substitute(expand("%:p:h"), "^" . getcwd() . "/", "", "") . "/"
  endif
endfunction

"Simple wrapper: do quickfix cmd, center line and if taglist.vim's window is
"open, sync, from vim.wikia.com/wiki/Search_using_quickfix_to_list_occurences
function s:Fancy_Quickfix_Cmd(Cmd)
	try
		execute a:Cmd
	catch /^Vim(\a\*):E553:/
		echohl ErrorMsg | echo v:exception | echohl None
	endtry
	norm! zz
	"If the laglist window is open then :TlistSync
	if bufwinnr('__Tag_List__') != -1
		TlistSync
	endif
endfunction

" Move to next closed fold, skipping open opnes
" Code from: http://stackoverflow.com/questions/9403098/is-it-possible-to-jump-to-closed-folds-in-vim/9407015#9407015
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" }}}
