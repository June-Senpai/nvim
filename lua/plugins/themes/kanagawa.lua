return {
  "rebelot/kanagawa.nvim",

  config = function()
    require("kanagawa").setup({
      compile = true,
      transparent = true,        -- ★ enable global transparency
      dimInactive = false,

      overrides = function(colors)
        local theme = colors.theme
        return {

          -- ★ Normal text background = NONE  
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },

          -- ★ For floating windows  
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- ★ Side columns  
          SignColumn = { bg = "none" },
          FoldColumn = { bg = "none" },

          -- ★ Cursor line  
          CursorLine = { bg = "none" },

          -- ★ Popup menu  
          Pmenu = { bg = "none" },
          PmenuSel = { bg = "none" },

          -- ★ NeoTree  
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },

          -- ★ Telescope  
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none" },
        }
      end,
    })

    require("kanagawa").load("wave")
  end
}

