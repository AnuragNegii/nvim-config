return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
            options = {
                mode = "buffers", -- "tabs" | "buffers"
                -- numbers = "ordinal", -- show buffer numbers
                diagnostics = "nvim_lsp", -- show LSP diagnostics
                separator_style = "thin", -- "slant" | "thick" | "thin" | { 'left', 'right' }
                indicator = {
                    style = "none", -- or "icon" or "none"
                },
                show_buffer_icons = false, -- show file type icons
                show_buffer_close_icons = true,
                show_close_icon = false,
                color_icons = true,
                always_show_bufferline = false,
                sort_by = 'insert_after_current',
            },
            highlights = {
                buffer_selected = {
                    fg = "#FFFFFF",
                    bold = true,
                    italic = true,
                    underline = false,
                },
                indicator_selected = {
                    fg = "#ff5f5f",
                    underline = false,
                },
            },
        }

        -- Keymaps for cycling through buffers
        vim.keymap.set("n", "<A-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
        vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
        vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
        vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Delete buffer" })
    end
}
