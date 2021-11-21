local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local nvim_status = require "lsp-status"

--local custom_init = function(client)
  --client.config.flags = client.config.flags or {}
  --client.config.flags.allow_incremental_sync = true
--end

--local filetype_attach = setmetatable({
  --go = function(client)
    --vim.cmd [[
      --augroup lsp_buf_format
        --au! BufWritePre <buffer>
        --autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      --augroup END
    --]]
  --end,

  --rust = function()
    --telescope_mapper("<space>wf", "lsp_workspace_symbols", {
      --ignore_filename = true,
      --query = "#",
    --}, true)

    ---- vim.cmd [[
    ----   autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request {aligned = true, prefix = " » "}
    ---- ]]

    --vim.cmd [[
      --augroup lsp_buf_format
        --au! BufWritePre <buffer>
        --autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      --augroup END
    --]]
  --end,
--}, {
  --__index = function()
    --return function() end
  --end,
--})

local telescope_map = function(key, f)
  buf_keymap(0, 'n', key, string.format("<cmd>lua require('telescope.builtin').%s()<cr>", f), {noremap = true})
end

local on_attach = function(client)
  --local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  nvim_status.on_attach(client)

  buf_keymap(0, 'i', "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {noremap = true})

  buf_keymap(0, 'n', "<space>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", {noremap = true})
  buf_keymap(0, 'n', "<space>cf", "<cmd>lua vim.lsp.buf.formatting()<cr>", {noremap = true})
  telescope_map('<a-cr>', 'lsp_code_actions')
  telescope_map('<leader>ca', 'lsp_code_actions')

  buf_keymap(0, 'n', "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true})
  buf_keymap(0, 'n', "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {noremap = true})
  buf_keymap(0, 'n', "gT", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {noremap = true})
  buf_keymap(0, 'n', "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true})

  --buf_nnoremap { "<space>gI", handlers.implementation }
  --buf_nnoremap { "<space>lr", "<cmd>lua R('tj.lsp.codelens').run()<CR>" }
  --buf_nnoremap { "<space>rr", "LspRestart" }

  telescope_map("gr", "lsp_references")
  telescope_map("gI", "lsp_implementations")
  --telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  --telescope_mapper("<space>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

  --if filetype ~= "lua" then
    --buf_nnoremap { "K", vim.lsp.buf.hover }
  --end

  --vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  --filetype_attach[filetype](client)
end


-- Setup lua LSP

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/home/glesaaen/.local/share/nvim/lsp_servers/sumneko_lua/extension/server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  filetypes = {'lua', 'lua.luapad', 'luapad'},
})

-- Setup C/C++ LSP
lspconfig.clangd.setup({
  on_attach = on_attach,
})

-- Setup C#
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/glesaaen/Downloads/omnisharp-linux-x64/run"
lspconfig.omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    filetypes = { 'cs', 'vb' },
    on_attach = on_attach,
})

--lspconfig.csharp_ls.setup({
    --cmd = { "/home/glesaaen/.dotnet/tools/csharp-ls" },
    --filetypes = { 'cs', 'vb' },
    --on_attach = on_attach,
--})
