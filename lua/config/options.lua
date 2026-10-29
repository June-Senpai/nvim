-- Basic Vim options
local opt = vim.opt
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.linebreak = true -- Don't wrap in the middle of a word
opt.breakindent = true -- Keep the indentation on the wrapped line
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

-- Mouse Support (For clicking DAP icons/UI)
opt.mouse = "a"

vim.filetype.add({
	extension = {
		mdx = "mdx",
		astro = "astro",
	},
})
