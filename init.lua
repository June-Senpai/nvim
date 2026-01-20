-- Load Lazy configuration
require("config.lazy")

vim.filetype.add({
	extension = {
		mdx = "mdx",
		astro = "astro",
	},
})
