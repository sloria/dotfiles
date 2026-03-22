return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  -- Explicitly use ruff for formatting Python.
  -- Otherwise, pylsp's formatters get used
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
    },
  },
}
