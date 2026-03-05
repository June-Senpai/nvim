return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- This plugin shows the variable values next to the code lines
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")

			-- Initialize Virtual Text
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				clear_on_continue = false,
				virt_text_pos = "eol", -- at the end of the line
			})

			-- KEYMAPS
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue" })
			vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over (Stay in file)" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into (Go inside)" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out (Go back up)" })

			-- Inspect value under cursor (Hover)
			vim.keymap.set("n", "K", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Debug Hover" })

			vim.keymap.set("n", "<leader>dx", function()
				dap.terminate()
			end, { desc = "Terminate Session" })

			vim.keymap.set("n", "<leader>dr", function()
				dap.restart()
			end, { desc = "Restart Session" })

			vim.keymap.set("n", "<leader>du", function()
				require("dapui").toggle()
			end, { desc = "DAP UI Toggle" })

			vim.keymap.set("n", "<leader>dl", dap.repl.open, { desc = "Open REPL" })
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			-- Auto open/close UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup({
				delve = {
					path = "dlv",
				},
			})
		end,
	},
}
