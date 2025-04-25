vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vim.keymap.set("i", "jj", "<Esc>")


vim.keymap.set("n", "<leader>w",":w<CR>")
vim.keymap.set("n", "<leader>c",":bw<CR>")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-a>", "gg<S-v><S-g>")
vim.keymap.set("n", "<C-n>", "cNext<CR>")

--quickfix nav
vim.keymap.set("n", "<A-n>", ":cnext<CR>")
vim.keymap.set("n", "<A-p>", ":cprevious<CR>")

