return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- Optional: This makes the floating window look a bit nicer
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- Setting the keymap here ensures it only loads when you need it
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
