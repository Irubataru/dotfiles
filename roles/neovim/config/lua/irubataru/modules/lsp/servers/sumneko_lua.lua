local M = {}

M.config = {
  settings = {
    single_file_support = true,
    Lua = {
      completion = {

        workspaceWord = true,
        callSnippet = "Both",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          -- neovim
          "vim",

          -- awesome
          "awesome",
          "client",
          "root",
          "screen",
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        maxPreload = 1000,
        preloadFileSize = 1000,
      },
    },
  },
  filetypes = { "lua", "lua.luapad", "luapad" },
}

return M
