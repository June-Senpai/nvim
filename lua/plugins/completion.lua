return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				preset = "default",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			signature = { enabled = true },
		},
	},
}
