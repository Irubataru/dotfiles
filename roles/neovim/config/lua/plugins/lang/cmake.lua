return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "stevearc/overseer.nvim",
    },
    opts = {
      cmake_use_preset = true,
      cmake_executor = {
        name = "overseer",
      },
    },
    keys = function()
      local root = vim.fs.root(0, { "CMakeLists.txt", "CMakePresets.json", "CMakeUserPresets.json" })

      if root == nil then
        return {}
      end

      return {
        { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
        { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
        { "<leader>ct", "<cmd>CMakeRunTest<cr>", desc = "CMake Run Tests" },
      }
    end,
  },
}
