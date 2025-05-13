return
  {
    "alvan/vim-closetag",
    ft = { "html", "xhtml", "xml", "jsx", "tsx", "javascriptreact", "typescriptreact" },
    config = function()
      vim.g.closetag_filenames = "*.html,*.xhtml,*.xml,*.js,*.jsx,*.ts,*.tsx"
      vim.g.closetag_filetypes = "html,xhtml,xml,jsx,tsx,javascriptreact,typescriptreact"
    end,
  }
