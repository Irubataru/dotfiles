local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

local vim_test_status_ok, vim_test = pcall(require, "neotest-vim-test")
if not vim_test_status_ok then
  return
end

local python_status_ok, python = pcall(require, "neotest-python")
if not python_status_ok then
  return
end

neotest.setup({
  adapters = {
    vim_test({
      ignored_filetypes = { "python" },
    }),
    python,
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "✖",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "✔",
    running = "🗘",
    skipped = "ﰸ",
    unknown = "?",
  },
})
