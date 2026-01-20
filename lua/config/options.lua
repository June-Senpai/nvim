-- Basic Vim options
local opt = vim.opt
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus" -- Use system clipboard when possible

-- for spell check
opt.spell = true
opt.spelllang = { "en_us" }
-- ]s   " next
-- [s   " previous
-- z= to fix
-- zg for adding to list
-- :set spell! To toggle spell check

-- Enable line numbers in netrw by removing 'nonu' from default buffer settings
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
-- Fix Go format specifier colors (%v, %d, etc.)
-- We create an autocommand so it reapplies even if you change themes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Link the LSP tokens you saw in :Inspect to the 'Special' color (usually orange)
		vim.api.nvim_set_hl(0, "@lsp.mod.format.go", { link = "Special" })
		vim.api.nvim_set_hl(0, "@lsp.typemod.string.format.go", { link = "Special" })
		-- Also link Treesitter tokens as a backup
		vim.api.nvim_set_hl(0, "@string.special.format.go", { link = "Special" })
	end,
})

-- Trigger it immediately for the current session
vim.api.nvim_exec_autocmds("ColorScheme", {})

-- ctrl d for exiting terminal
-- to change tabs press ctrl w then k to go to code j to back to terminal
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

-- float terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal, { desc = "Toggle Floating Terminal" })
