-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Terminal window navigation without Esc
vim.keymap.set("t", "<C-w><C-w>", [[<C-\><C-n><C-w><C-w>]], {
  noremap = true,
  silent = true,
  desc = "Terminal: switch window",
})
-- Disable Esc in terminal
vim.keymap.set("t", "<E>", "<Nop>", { silent = true })
vim.keymap.set("t", "<Esc>", "<Esc>", {
  noremap = true,
  silent = true,
  nowait = true,
})
