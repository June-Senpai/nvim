return {
  "catppuccin/nvim",
  name = "catppuccin",

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",               -- ← darkest dark theme
      transparent_background = false,  -- ← solid background
      term_colors = true,

      integrations = {
        treesitter = true,
        neotree = true,
        telescope = true,
        cmp = true,
        gitsigns = true,
        notify = true,
      },

      custom_highlights = function(colors)
        return {
          Normal = { bg = colors.base },
          NormalNC = { bg = colors.mantle },

          NormalFloat = { bg = colors.mantle },
          FloatBorder = { bg = colors.mantle },
          FloatTitle = { bg = colors.mantle },

          Pmenu = { bg = colors.mantle },
          PmenuSel = { bg = colors.surface2 },

          SignColumn = { bg = colors.base },

          NeoTreeNormal = { bg = colors.base },
          NeoTreeNormalNC = { bg = colors.base },
        }
      end,
    })

    vim.cmd("colorscheme catppuccin")
  end,
}

