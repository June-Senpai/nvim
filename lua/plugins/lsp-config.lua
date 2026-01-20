return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "astro", "mdx_analyzer" },
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						semanticTokens = true,
					},
				},
			})
			vim.lsp.config("astro", {})
			vim.lsp.config("mdx_analyzer", {})

			-- ========= Diagnostics Config =========
			-- vim.diagnostic.config({
			-- 	virtual_text = { prefix = "●" },
			-- 	signs = true,
			-- 	underline = true,
			-- 	update_in_insert = false,
			-- 	severity_sort = true,
			-- 	float = {
			-- 		border = "rounded",
			-- 		source = "always",
			-- 		focusable = true, -- Changed to true so you can jump into the window
			-- 	},
			-- })

			-- Show diagnostic popup on hover (like VS Code)
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false })
				end,
			})

			-- ========= Keymaps =========

			-- 1. SMART HOVER: Prevents overlapping windows
			vim.keymap.set("n", "gh", function()
				-- Get diagnostics for the current line
				local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })

				if #line_diagnostics > 0 then
					-- If there's an error, show the diagnostic float
					vim.diagnostic.open_float()
				else
					-- If no error, show the LSP hover info
					vim.lsp.buf.hover()
				end
			end, { desc = "Smart Hover: Diagnostic or Documentation" })

			-- 2. If you specifically want the other one, use leader
			vim.keymap.set("n", "gK", vim.lsp.buf.hover, { desc = "Force LSP Hover" })

			-- 3. Navigation
			vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Prev Error" })
			vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next Error" })

			-- 4. Code Actions
			vim.keymap.set("n", "<leader>ll", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
