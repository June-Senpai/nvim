return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		config = function()
			require("telescope").setup({
				-- pickers = {
				-- 	find_files = {
				-- 		theme = "ivy",
				-- 	},
				-- },
				-- extensions = {
				-- 	fzf = {},
				-- 	["ui-select"] = {
				-- 		require("telescope.themes").get_dropdown({}),
				-- 	},
				-- },
			})

			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			--vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
			require("telescope").load_extension("ui-select")
		end,
	},
}
