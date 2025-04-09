return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        yamlls = function(_, opts)
          require("lspconfig").yamlls.setup({
            settins = {
              yaml = {
                schemas = {
                  ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
                },
              },
            },
          })
        end,
      },
    },
  },
}
