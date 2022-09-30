local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local bufkeymap = vim.api.nvim_buf_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Change the macro recording bind from q to Alt m 
keymap("n", "<A-m>", "q", opts);
keymap("n", "q", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Copy the entire file using Ctrl - A
keymap("n", "<C-a>", "<Cmd>%y+<CR>", opts)

-- Toggle autosave
keymap("n", "<leader>ast", "<Cmd>ASToggle<CR>", opts)

-- Normal --
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("n", "<C-s>", "<Cmd>w<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Swapping the  window splits
keymap("n", "<leader>th", "<C-w>t<C-w>H", opts)
keymap("n", "<leader>tk", "<C-w>t<C-w>K", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
keymap("i", "<leader>/", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<m-j>", ":m .+1<CR>==", opts)
keymap("v", "<m-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- C++ saving and compiling and running the code key bindings;
-- keymap("i", "<C-g>", "<ESC> :w <CR> :!g++ % && %:p:h/a.out < %:p:h/input.txt", opts)

-- Dart  key bindings
-- keymap( "n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- keymap( "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap( "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap( "n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap( "x", "<leader>ca", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
-- keymap( "n", "F", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Git key bindings
keymap("n", "<leader>ga", ":Git add .<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)

-- Compititest key bindings setup
keymap("n", "<leader>b", "<Esc><Cmd>CompetiTestRun<CR>", opts)
keymap("n", "<leader>bn", "<Esc><Cmd>CompetiTestRunNC<CR>", opts)
keymap("n", "<leader>e", "<Esc><Cmd>CompetiTestEdit<CR>", opts)
keymap("n", "<leader>d", "<Esc><Cmd>CompetiTestDelete<CR>", opts)
keymap("n", "<leader>r", "<Cmd>CompetiTestReceive<CR>", opts)

--cpbooster key bindings
keymap("n", "<leader>cb", ":!cpb test %<CR>", opts)
keymap("n", "<leader>ct", ":!cpb submit %<CR>", opts)
keymap("n", "<leader>cn", ":!cpb clone<CR>", opts)

-- Temporary basis
keymap("n", "<leader>l", "<Cmd>!pdflatex main.tex<CR><Cmd>!mupdf main.pdf<CR>", opts)

-- Generate the compititest testcase version from the cpbooster case
keymap("n", "<leader>gt", "<Cmd>lua require('user.functions.generate_test_cases')()<CR>",
  opts)
