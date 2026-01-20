return {
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		{
			"nvim-mini/mini.comment",
			version = false,
			config = function()
				require("mini.comment").setup()
			end,
		},
	},
}
