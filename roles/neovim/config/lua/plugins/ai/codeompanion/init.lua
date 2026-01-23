return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      language = "English",
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            model = "claude-sonnet-4-5",
            schema = {
              extended_thinking = {
                default = false,
              },
            },
          })
        end,
        http = {
          azure_openai = function()
            return require("codecompanion.adapters").extend("azure_openai", {
              env = {
                api_key = "SPN_OPENAI_API_KEY",
                endpoint = "SPN_OPENAI_ENDPOINT",
                deployment = "gpt-5.2",
              },
              schema = {
                model = {
                  default = "gpt-5.2",
                },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "azure_openai",
          opts = {
            system_prompt = require("config.prompts").system_prompt,
          },
        },
        inline = {
          adapter = "azure_openai",
        },
      },
      display = {
        chat = {
          show_settings = false,
        },
        diff = {
          provider = "mini_diff",
        },
      },
      prompt_library = require("config.prompts").library,
      extensions = {
        history = require("config.codecompanion.history"),
      },
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
  },
  {
    optional = true,
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "codecompanion",
        title = "CodeCompanion",
        size = { width = 80 },
      })
    end,
  },
  require("plugins.ai.codeompanion.keys"),
  require("plugins.ai.codeompanion.neo-tree"),
}
