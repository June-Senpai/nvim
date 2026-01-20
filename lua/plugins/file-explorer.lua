return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.load_extension("file_browser")

			-- vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>")
			vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		end,
	},
}
