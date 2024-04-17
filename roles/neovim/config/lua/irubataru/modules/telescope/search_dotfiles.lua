local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim/",
    hidden = true,
  })
end

M.search_dotfiles_grep = function()
  require("telescope.builtin").live_grep({
    require("telescope.themes").get_ivy(),
    cwd = "~/.config/nvim/",
  })
end

return M
