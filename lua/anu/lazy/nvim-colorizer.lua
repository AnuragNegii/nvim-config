return{
"NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Enable for all filetypes
      user_default_options = {
        RGB      = true,      -- #RGB
        RRGGBB   = true,      -- #RRGGBB
        names    = true,      -- "red", "blue", etc
        RRGGBBAA = true,      -- #RRGGBBAA
        AARRGGBB = true,      -- 0xAARRGGBB
        rgb_fn   = true,      -- rgb() and rgba()
        hsl_fn   = true,      -- hsl() and hsla()
        css      = true,      -- Enable all CSS features
        css_fn   = true,      -- Enable all CSS functions
        mode     = "background", -- Display color in background
      },
    })
  end
}
