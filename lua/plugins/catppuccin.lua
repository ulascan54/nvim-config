return { 
  "catppuccin/nvim", 
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", 
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, 
      term_colors = true,
      integrations = {
        treesitter = true,
        telescope = true,
        neotree = true,
        cmp = true,
        gitsigns = true,
        mason = true,
        lsp_trouble = true,
        notify = true,
        mini = true,
      },
      color_overrides = {
        mocha = {
          base = "#0b0f14", 
          mantle = "#0e1217",
          crust = "#080c10",
        },
      },
      highlight_overrides = {
        mocha = function(colors)
          return {
            Normal = { bg = colors.base },
            NormalNC = { bg = colors.mantle },
            VertSplit = { fg = colors.surface0 },
            CursorLine = { bg = colors.surface0 },
            CursorLineNr = { fg = colors.lavender },
            LineNr = { fg = colors.overlay1 },
          }
        end,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
