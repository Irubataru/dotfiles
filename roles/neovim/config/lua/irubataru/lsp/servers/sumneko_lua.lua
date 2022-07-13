local path = vim.split(package.path, ";")
table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

local library = {}

local function add(lib)
  for _, p in pairs(vim.fn.expand(lib, false, true)) do
    p = vim.loop.fs_realpath(p)
    library[p] = true
  end
end

-- add runtime
add("$VIMRUNTIME")

-- add awesome-wm
add("/usr/share/awesome/lib")

-- add your config
add("~/.config/nvim")

-- add plugins
-- if you're not using packer, then you might need to change the paths below
add("~/.local/share/nvim/site/pack/packer/opt/*")
add("~/.local/share/nvim/site/pack/packer/start/*")

local M = {}

M.config = {
  -- delete root from workspace to make sure we don't trigger duplicate warnings
  on_new_config = function(config, root)
    local libs = vim.tbl_deep_extend("force", {}, library)
    libs[root] = nil
    config.settings.Lua.workspace.library = libs
    return config
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = path,
      },
      completion = { callSnippet = "Both" },
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
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = library,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
  filetypes = { "lua", "lua.luapad", "luapad" },
}

return M
