--<leader>pk to fuzzy check all current keymaps
-- vim.opt.guicursor = ""
vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- Global indentation (default: 4 spaces)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- -- Filetype-specific overrides
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.expandtab = true
--
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
-- highlight ColorColumn=#FF5349 ctermbg=#FF5349 guibg= #FF5349.
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#FF5349" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Higlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.opt.textwidth = 80
-- vim.opt.formatoptions:append("t")
--
-- -- Ensure formatoptions is set on every buffer
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.opt_local.textwidth = 70
--     vim.opt_local.formatoptions:append("t")
--   end
-- })
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#FF5349" })
--   end,
-- })
--

vim.keymap.set("n", "<leader>rr", function()
    print("restarting server")
  for _, client in pairs(vim.lsp.get_clients()) do
    client.stop()
  end
  vim.cmd("edit")
end, { desc = "Restart all LSPs" })

