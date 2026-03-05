return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"kristijanhusak/vim-dadbod-completion", -- Add this as a dependency
		},
		opts = {
			keymap = {
				preset = "default",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			signature = { enabled = true },

			-- --- ADDED FOR SQL AUTOCOMPLETE ---
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "dadbod" },
				providers = {
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
					},
				},
			},
		},
	},
}
