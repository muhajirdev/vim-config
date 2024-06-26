-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

vim.keymap.set("i", "<M-BS>", "<C-w>")
-- TOOD: figure out why cmd backspace is not working
vim.keymap.set("i", "<D-BS>", "<C-u>")

vim.keymap.set("n", "<leader>ov", ":cd /Users/muhajir/vaults/muhajir<cr>")
vim.keymap.set("n", "<leader>os", ':Telescope find_files search_dirs={"/Users/muhajir/vaults/muhajir"}<cr>')
vim.keymap.set("n", "<leader>oz", ':Telescope live_grep search_dirs={"/Users/muhajir/vaults/muhajir"}<cr>')
vim.keymap.set("n", "<leader>ol", ":ObsidianTemplate")
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

-- vim.keymap.set("n", "<leader>of", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
