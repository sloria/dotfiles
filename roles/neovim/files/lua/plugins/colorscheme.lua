return {
  -- NOTE: use priority=1000 to ensure colorschemes load before other plugins that depend on highlight groups being set
  {
    "oxfist/night-owl.nvim",
    priority = 1000,
  },
  {
    "rmehri01/onenord.nvim",
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 5000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd.colorscheme("night-owl")
        -- Clear NormalNC to prevent unfocused splits from being dimmed
        -- (night-owl doesn't set it, but tokyonight's stale highlight persists)
        vim.api.nvim_set_hl(0, "NormalNC", {})
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd.colorscheme("onenord")
      end,
    },
  },
}
