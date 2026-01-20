return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },

					javascript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },

					typescript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },

					json = { "prettierd", "prettier" },
					markdown = { "prettier" },

					go = { "goimports", "gofmt" },
				},

				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			-- ctrl+s shortcut
			vim.keymap.set("n", "<leader>w", function()
				require("conform").format({
					async = false, -- wait for format
					lsp_format = "fallback",
				})
				vim.cmd("write")
				-- print("✔ Formatted and Saved")
			end)
		end,
	},
}
