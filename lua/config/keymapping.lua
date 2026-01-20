-- quit all (save all)
vim.keymap.set("n", "<C-S-q>", "<cmd>wqa<CR>", { desc = "Save & Quit All" })

-- quit file
vim.keymap.set("n", "<C-S-w>", "<cmd>wq<CR>", { desc = "Save & Quit File" })
