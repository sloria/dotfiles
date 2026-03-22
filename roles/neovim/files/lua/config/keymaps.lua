-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set({ "n", "v" }, "<leader>A", "ggVG", { desc = "Select whole file" })
vim.keymap.set("n", "<BS>", [[:%s/\s\+$//<CR>:let @/=''<CR>]], { desc = "Remove trailing whitespace" })
vim.keymap.set({ "n", "v" }, "<leader>h", "^", { desc = "Go to beginning of line" })
vim.keymap.set({ "n", "v" }, "<leader>l", "$", { desc = "Go to end of line" })
vim.keymap.set({ "n" }, "<leader>v", "<C-W>v", { desc = "Split vertically" })

-- Terminal controls
local term_current = 1
local term_max = 1
vim.keymap.set({ "n", "t" }, "<C-t>", function()
  Snacks.terminal.toggle(nil, { count = term_current })
end, { desc = "Toggle terminal" })

vim.keymap.set({ "n", "t" }, "<C-t>n", function()
  Snacks.terminal.toggle(nil, { count = term_current }) -- hide current
  term_max = term_max + 1
  term_current = term_max
  Snacks.terminal.toggle(nil, { count = term_current }) -- open new
end, { desc = "New terminal" })

vim.keymap.set({ "n", "t" }, "<C-t>j", function()
  Snacks.terminal.toggle(nil, { count = term_current }) -- hide current
  term_current = term_current % term_max + 1
  Snacks.terminal.toggle(nil, { count = term_current }) -- show next
end, { desc = "Next terminal" })

vim.keymap.set({ "n", "t" }, "<C-t>k", function()
  Snacks.terminal.toggle(nil, { count = term_current }) -- hide current
  term_current = (term_current - 2) % term_max + 1
  Snacks.terminal.toggle(nil, { count = term_current }) -- show prev
end, { desc = "Previous terminal" })

-- Quit current terminal without closing the terminal buffer iff there are more terminals left
vim.keymap.set("t", "<C-w>", function()
  local buf = vim.api.nvim_get_current_buf()
  local chan = vim.bo[buf].channel
  if chan then
    -- Send "exit" so the shell exits cleanly (code 0)
    vim.fn.chansend(chan, "exit\n")
  end
  if term_max > 1 then
    term_max = term_max - 1
    term_current = math.min(term_current, term_max)
    vim.defer_fn(function()
      Snacks.terminal.toggle(nil, { count = term_current }) -- show previous
    end, 100)
  end
end, { desc = "Quit terminal" })

vim.keymap.set("t", "<C-t>m", function()
  Snacks.zen.zoom()
end, { desc = "Toggle terminal fullscreen" })

vim.keymap.set("n", "<leader>uH", function()
  ---@diagnostic disable-next-line: undefined-global
  MiniHipatterns.toggle(0)
end, { desc = "Toggle Hipatterns (CSS color highlighting)" })
