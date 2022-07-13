local status_ok, template = pcall(require, "template")
if not status_ok then
  return
end

template.author = "Aleksandra R. Glesaaen"
template.email = "aleksandra@glesaaen.com"
template.temp_dir = vim.fn.stdpath("config") .. "/templates"
