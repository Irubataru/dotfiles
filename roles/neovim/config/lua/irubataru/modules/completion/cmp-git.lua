-- Git source for nvim-cmp

local M = {
  "petertriho/cmp-git",
  requires = "nvim-lua/plenary.nvim",
  opts = {
    gitlab = {
      hosts = {
        "gitlab.sintef.no",
      },
    },
    trigger_actions = {
      -- NOTE: To disable the commits action, I need to specify the rest
      -- {
      --     debug_name = "git_commits",
      --     trigger_character = ":",
      --     action = function(sources, trigger_char, callback, params, git_info)
      --         return sources.git:get_commits(callback, params, trigger_char)
      --     end,
      -- },
      {
        debug_name = "gitlab_issues",
        trigger_character = "#",
        action = function(sources, trigger_char, callback, params, git_info)
          return sources.gitlab:get_issues(callback, git_info, trigger_char)
        end,
      },
      {
        debug_name = "gitlab_mentions",
        trigger_character = "@",
        action = function(sources, trigger_char, callback, params, git_info)
          return sources.gitlab:get_mentions(callback, git_info, trigger_char)
        end,
      },
      {
        debug_name = "gitlab_mrs",
        trigger_character = "!",
        action = function(sources, trigger_char, callback, params, git_info)
          return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
        end,
      },
      {
        debug_name = "github_issues_and_pr",
        trigger_character = "#",
        action = function(sources, trigger_char, callback, params, git_info)
          return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
        end,
      },
      {
        debug_name = "github_mentions",
        trigger_character = "@",
        action = function(sources, trigger_char, callback, params, git_info)
          return sources.github:get_mentions(callback, git_info, trigger_char)
        end,
      },
    },
  },
}

return M
