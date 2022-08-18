local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-f>", ":NvimTreeFocus<CR>", opts)
