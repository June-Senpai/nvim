return {
  "folke/tokyonight.nvim",

  config = function()
    require("tokyonight").setup({
      style = "moon",          -- or "storm" | "night" | "day"
      transparent = true,      -- ★ main transparency toggle
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },

      on_highlights = function(hl, c)
        hl.Normal = { bg = "none" }
        hl.NormalNC = { bg = "none" }

        hl.NormalFloat = { bg = "none" }
        hl.FloatBorder = { bg = "none" }
        hl.FloatTitle = { bg = "none" }

        hl.SignColumn = { bg = "none" }
        hl.FoldColumn = { bg = "none" }

        hl.Pmenu = { bg = "none" }
        hl.PmenuSel = { bg = "none" }

        -- Neo-tree
        hl.NeoTreeNormal = { bg = "none" }
        hl.NeoTreeNormalNC = { bg = "none" }
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end
}

