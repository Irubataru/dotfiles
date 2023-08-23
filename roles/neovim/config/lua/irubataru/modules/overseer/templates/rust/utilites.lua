local M = {}

M.get_cargo_file = function(opts)
  return vim.fs.find("Cargo.toml", { upward = true, type = "file", path = opts.dir })[1]
end

M.is_cargo_project = function(opts)
  if vim.fn.executable("cargo") == 0 then
    return false, 'Command "cargo" not found'
  end
  if not M.get_cargo_file(opts) then
    return false, "No Cargo.toml file found"
  end
end

M.not_cargo_project = function(opts)
  if vim.fn.executable("cargo") == 0 then
    return true
  end

  if M.get_cargo_file(opts) then
    return false, "No Cargo.toml file found"
  end
  return true
end

return M
