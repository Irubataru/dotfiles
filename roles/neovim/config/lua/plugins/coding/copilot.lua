-- Disable this for now
if true then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      {
        "<leader>at",
        function()
          require("copilot.command").toggle()
        end,
        desc = "Toggle copilot (buffer)",
        mode = { "n", "v" },
      },
      {
        "<leader>aT",
        function()
          local is_disabled = require("copilot.client").is_disabled()

          if is_disabled then
            require("copilot.command").enable()
            LazyVim.info("Enabled Copilot", { title = "Copilot" })
          else
            require("copilot.command").disable()
            LazyVim.warn("Disabled Copilot", { title = "Copilot" })
          end
        end,
        desc = "Toggle copilot (global)",
        mode = { "n", "v" },
      },
    },
  },
}
