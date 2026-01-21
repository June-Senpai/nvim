-- Load Lazy configuration
require("config.lazy")

vim.keymap.set("n", "<leader>tt", function()
	-- Get the current directory in WSL format
	local dir = vim.fn.expand("%:p:h")

	-- We call 'wezterm.exe' directly.
	-- WSL automatically handles the translation if it's in your Windows Path.
	-- We use 'start-child' or 'cli spawn' to open a new window.
	local cmd = string.format("wezterm.exe cli spawn --cwd '%s' &", dir)

	os.execute(cmd)
end, { desc = "Open WezTerm from WSL" })

vim.filetype.add({
	extension = {
		mdx = "mdx",
		astro = "astro",
	},
})
