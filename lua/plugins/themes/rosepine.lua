return {
  "rose-pine/neovim",
  name = "rose-pine",

  config = function()
    require("rose-pine").setup({
      dark_variant = "moon",     -- or "main" | "dawn"
      disable_background = true, -- ★ removes all backgrounds
      disable_float_background = true,

      highlight_groups = {
        Normal = { bg = "none" },
        NormalNC = { bg = "none" },

        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        SignColumn = { bg = "none" },
        FoldColumn = { bg = "none" },

        Pmenu = { bg = "none" },
        PmenuSel = { bg = "none" },

        -- Neo-tree
        NeoTreeNormal = { bg = "none" },
        NeoTreeNormalNC = { bg = "none" },
      },
    })

    vim.cmd("colorscheme rose-pine")
  end
}

