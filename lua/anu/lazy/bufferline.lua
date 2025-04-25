return {
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup{
            options = {
                separator_style = "slant",
                indicator = {
                    style = "underline",
                },
            },
            highlights = {
                buffer_selected = {
                    guifg = "red",  -- foreground color
                    guibg = "blue",   -- background color
                    gui = "underline",-- apply underline
                    guisp = "red",    -- set underline color
                },
            }
        }
         --Keymaps for Bufferline
            vim.keymap.set("n", "<A-Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    end
}

