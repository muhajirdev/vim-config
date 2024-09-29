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
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<cr>")

vim.keymap.set("n", "<leader>wz", ":ZenMode<cr>")

-- vim.keymap.set("n", "<leader>of", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")

vim.keymap.set("n", "<leader>oo", ":ObsidianToday<cr>")
vim.keymap.set("n", "<leader>fo", ":Neotree focus<cr>", { noremap = true, remap = false })

vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

vim.keymap.set("n", "<leader>gn", ":Neogit<cr>")

-- shift tab
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
