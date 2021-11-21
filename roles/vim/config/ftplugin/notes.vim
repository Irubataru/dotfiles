"Notes specific settings

set textwidth=100
set spell

" Navigate to other notes with the \gt keybinding
vnoremap <Leader>gt :NoteFromSelectedText<CR>
nnoremap <Leader>gt viw:NoteFromSelectedText<CR>
nnoremap <Leader>ff :set foldlevel=0<CR>zA

" Set set a short timeout for mappings
set timeoutlen=300

" Setting up quick mapping of the greek alphabet
inoremap <buffer> \a α
inoremap <buffer> \b β
inoremap <buffer> \c χ
inoremap <buffer> \d δ
inoremap <buffer> \e ε
inoremap <buffer> \f φ
inoremap <buffer> \g γ
inoremap <buffer> \h η
inoremap <buffer> \k κ
inoremap <buffer> \l λ
inoremap <buffer> \m μ
inoremap <buffer> \n ν
inoremap <buffer> \p π
inoremap <buffer> \q θ
inoremap <buffer> \r ρ
inoremap <buffer> \s σ
inoremap <buffer> \t τ
inoremap <buffer> \u υ
inoremap <buffer> \w ω
inoremap <buffer> \x ξ
inoremap <buffer> \y ψ
inoremap <buffer> \z ζ
inoremap <buffer> \D Δ
inoremap <buffer> \E ϵ
inoremap <buffer> \F Φ
inoremap <buffer> \G Γ
inoremap <buffer> \L Λ
inoremap <buffer> \W Ω
inoremap <buffer> \Q Θ
inoremap <buffer> \S Σ
inoremap <buffer> \X Ξ
inoremap <buffer> \Y Ψ
inoremap <buffer> \8 ∞
inoremap <buffer> \! ≠
inoremap <buffer> \< ≤
inoremap <buffer> \> ≥
inoremap <buffer> \. ·
inoremap <buffer> \N ∇
