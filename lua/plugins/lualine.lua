return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local colors = {
			yellow = "#FFD700", -- Normal
			green = "#00FF7F", -- Insert
			blue = "#80a0ff", -- Visual
			urgentRed = "#ff2c3d", -- O-Pending & Unsaved
			cyan = "#79dac8", -- Filename text
			softViolet = "#a9a1e1", -- Command text
			darkestGrey = "#16161d", -- Bubble Background
			grey = "#303030", -- Mid-section
			black = "#080808",
			white = "#c6c6c6",
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.yellow },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},
			insert = { a = { fg = colors.black, bg = colors.green } },
			visual = { a = { fg = colors.black, bg = colors.blue } },
			replace = { a = { fg = colors.black, bg = colors.urgentRed } },
		}

		local function save_icon()
			return vim.bo.modified and "󰆓" or ""
		end

		local function show_macro_recording()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end
			return "󰑋 @" .. reg
		end

		local function get_typed_commands()
			if package.loaded["noice"] then
				return require("noice").api.status.command.get()
			end
			return ""
		end

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { right = "" },
						color = function()
							local mode = vim.api.nvim_get_mode().mode
							if mode == "no" or mode == "nov" or mode == "noV" then
								return { bg = colors.urgentRed, fg = colors.black, gui = "bold" }
							end
							return nil
						end,
					},
				},
				lualine_b = {
					{
						"filename",
						file_status = false,
						separator = { right = "" },
						color = { fg = colors.cyan, bg = colors.darkestGrey },
					},
					{ "branch", color = { fg = colors.white } },
				},
				lualine_c = {
					"%=",
					{
						save_icon,
						color = { fg = colors.urgentRed },
						padding = { right = 1 },
					},
					{
						show_macro_recording,
						color = { fg = colors.urgentRed, gui = "bold" },
						cond = function()
							return vim.fn.reg_recording() ~= ""
						end,
					},
					"%=",
				},
				lualine_x = {
					{
						get_typed_commands,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.command.has()
						end,
						color = { fg = colors.softViolet, bg = colors.darkestGrey },
						separator = { left = "" },
					},
					{
						"diagnostics",
						color = { bg = colors.darkestGrey },
						separator = { left = "" },
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
						-- FIX: Only show diagnostics if there is something to report
						cond = function()
							local stats = vim.diagnostic.get(0)
							return #stats > 0
						end,
					},
				},
				lualine_y = {
					{
						"filetype",
						color = { fg = colors.white, bg = colors.grey },
						separator = { left = "" },
					},
				},
				lualine_z = {
					{
						function()
							local curr, total, col = vim.fn.line("."), vim.fn.line("$"), vim.fn.col(".")
							local icons = { "󰋙 ", "󰫃 ", "󰫄 ", "󰫅 ", "󰫆 ", "󰫇 ", "󰫈 " }
							local icon = icons[math.ceil((curr / total) * #icons)] or icons[1]
							return string.format("L:%d/%d C:%d %s", curr, total, col, icon)
						end,
						separator = { left = "" },
					},
				},
			},
		})
	end,
}
