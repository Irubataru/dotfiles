local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "plaintex",
  callback = function()
    vim.bo.ft = "tex"
  end,
})

autocmd({ "BufNewFile", "BufRead", "BufWinEnter" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
  desc = "Set filetype to tex",
})

-- Remove line numbering in new terminals
autocmd({"TermOpen"}, {
  pattern = "term://*",
  callback = function ()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

-- autocmd("FileType", {
--     callback = function()
--         vim.opt.formatoptions = vim.opt.formatoptions
--             + "r" -- continue comments after return
--             + "c" -- wrap comments using textwidth
--             + "q" -- allow to format comments w/ gq
--             + "j" -- remove comment leader when joining lines when possible
--             - "t" -- don't autoformat
--             - "a" -- no autoformatting
--             - "o" -- don't continue comments after o/O
--             - "2" -- don't use indent of second line for rest of paragraph
--     end,
--     desc = "Set formatoptions",
-- })

autocmd("BufEnter", {
  pattern = { "*" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

autocmd("BufEnter", {
  pattern = { "*.tex", "*.norg" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Filetype detection
-- {{{

local ftdetect = function(pattern, ft)
    autocmd({ "BufRead", "BufEnter", "BufNewFile" }, {
        pattern = pattern,
        command = [[set ft=]] .. ft,
        once = false,
        desc = "Set filetype to " .. ft,
    })
end

ftdetect("*.BUILD", "bzl")
ftdetect("*.p", "gnuplot")
ftdetect("*.h", "cpp")
ftdetect("*.cpp", "cpp")
ftdetect("*.tpp", "cpp")
ftdetect("*.latex", "tex")
ftdetect("*.md", "markdown")
ftdetect("*.nb", "mma")
ftdetect("*.m", "matlab")
ftdetect("*.top", "make")
ftdetect("*.bas", "vb")
ftdetect("*.cls", "vb")
ftdetect("*.doccls", "vb")
ftdetect("*.frm", "vb")
ftdetect("*.xaml", "xml")

-- }}}
