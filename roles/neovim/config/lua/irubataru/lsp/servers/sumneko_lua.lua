local path = vim.split(package.path, ";")
table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

local function setup_libraries()
  local library = {}
  local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
      p = vim.loop.fs_realpath(p)
      library[p] = true
    end
  end

  local homedir = vim.env.HOME
  local workdir = vim.fn.getcwd()

  local function dev_vim()
    return workdir:find("^" .. homedir .. "/.config/nvim") ~= nil or workdir:find("^" .. homedir .. "/.dotfiles") ~= nil
  end

  local function dev_awesome()
    return workdir:find("^" .. homedir .. "/.config/awesome") ~= nil or workdir:find("^" .. homedir .. "/config/awesome") ~= nil
  end

  if dev_vim() then
    -- add runtime
    add("$VIMRUNTIME")

    -- add your config
    add("~/.config/nvim")

    -- add plugins
    -- if you're not using packer, then you might need to change the paths below
    add("~/.local/share/nvim/site/pack/packer/opt/*")
    add("~/.local/share/nvim/site/pack/packer/start/*")
  elseif dev_awesome() then
    add("$PWD")
    add("/usr/share/awesome/lib")
  else
    add("$PWD")
  end

  return library
end

local M = {}

M.config = {
  on_attach_post = function(client, _)
    client.config.settings.Lua.workspace.library = setup_libraries()
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
        library =setup_libraries(),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
  filetypes = { "lua", "lua.luapad", "luapad" },
}

return M
