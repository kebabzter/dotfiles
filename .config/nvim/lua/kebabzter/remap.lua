vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--When in Visual mode this lets you move selection with J and K up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--When searching something in normal mode for example /vim.keymap in this file the 
--cursor stays in the middle of the screen

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--greatest remap ever
--When pasting if you do leader p over a highlited section you keep your current 
--clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

--next greatest remap ever
--saves things from vim to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--Deletes without saving highlited content to clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--Much more convenient to exit with Ctrl C tbh
vim.keymap.set("i", "<C-c>", "<Esc>")

--You don't need that shit
vim.keymap.set("n", "Q", "<nop>")

--If you are inside a bash script for example instead of running chmod to make it 
--executable you just do this and it works :)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})
