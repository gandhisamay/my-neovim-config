local Terminal = require('toggleterm.terminal').Terminal

local newterm = Terminal:new({

  cmd = "zsh",
  dir = "%:p:h",
  direction = "horizontal",
  -- function to run on opening the terminal
  on_open = function(_)
    vim.cmd("startinsert!")
  end,
  -- function to run on closing the terminal
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})

function NewTermToggle()
  newterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua NewTermToggle()<CR>", { noremap = true, silent = true })
