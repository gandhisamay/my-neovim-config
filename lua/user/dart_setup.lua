local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>fa", ":FlutterRun<CR>", opts)
keymap("n", "<leader>fr", ":FlutterHotReload<CR>", opts)
keymap("n", "<leader>fR", ":FlutterHotRestart<CR>", opts)
keymap("n", "<leader>fq", ":FlutterQuit<CR>", opts)
keymap("n", "<leader>fD", ":FlutterVisualDebug<CR>", opts)

