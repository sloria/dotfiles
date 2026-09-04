-- Toggle autocompletion per buffer with <leader>uk
-- https://github.com/LazyVim/LazyVim/discussions/5186
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion ~= false
      end,
      set = function(state)
        vim.b.completion = state
      end,
    }):map("<leader>uk")

    opts.enabled = function()
      return vim.b.completion ~= false
    end
    return opts
  end,
}
