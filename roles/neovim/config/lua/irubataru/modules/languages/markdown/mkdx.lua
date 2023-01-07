-- A vim plugin that adds some nice extra's for working with markdown documents

local M = {
  "SidOfc/mkdx",
  ft = { "markdown" },
}

M.config = function()
  vim.g["mkdx#settings"] = {
    highlight = { enable = 1 },
    enter = { shift = 1 },
    map = { enable = 0 },
    links = { external = { enable = 1 } },
    toc = {
      text = "Table of Contents",
      update_on_write = 0,
      details = { enable = 0 },
    },
    fold = {
      enable = 1,
      components = { "toc", "fence" },
    },
  }

--   vim.cmd([[
-- fun! s:MkdxGoToHeader(header)
--     " given a line: '  84: # Header'
--     " this will match the number 84 and move the cursor to the start of that line
--     call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
-- endfun
--
-- fun! s:MkdxFormatHeader(key, val)
--     let text = get(a:val, 'text', '')
--     let lnum = get(a:val, 'lnum', '')
--
--     " if the text is empty or no lnum is present, return the empty string
--     if (empty(text) || empty(lnum)) | return text | endif
--
--     " We can't jump to it if we dont know the line number so that must be present in the outpt line.
--     " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
--     return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
-- endfun
--
-- fun! s:MkdxFzfQuickfixHeaders()
--     " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
--     " this allows you to create a 'source' for fzf.
--     " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
--     " then, we strip out any remaining empty headers.
--     let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')
--
--     " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
--     " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
--     call fzf#run(fzf#wrap(
--             \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
--           \ ))
-- endfun
--
--
-- augroup filetype_markdown
--   autocmd FileType markdown nnoremap <silent> <leader>I :call <SID>MkdxFzfQuickfixHeaders()<Cr>
-- augroup END
-- ]])

end

return M
