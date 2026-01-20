return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"astro",
					"typescript",
					"css",
					"tsx",
					"c",
					"go",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"printf",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },

				-- --- SCOPE SELECTION (Incremental Selection) ---
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Tab>", -- Start selecting the word under cursor
						node_incremental = "<Tab>", -- Expand to the next scope (line, block, function)
						scope_incremental = false, -- Set to false or a different key if you want
						node_decremental = "<S-Tab>", -- Shrink the selection back down
					},
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
