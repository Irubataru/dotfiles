-- Disabled as I am trying to use mini.git for this
if true then
  return {}
end

return {
  {
    "tpope/vim-fugitive",
    cmd = { "Gedit", "Git", "Gsplit" },
    config = true,
  },
}
