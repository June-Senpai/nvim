return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true, -- transparency ON
				italic_comments = true,
				hide_fillchars = true,
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
}
