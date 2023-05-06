local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "enter normal mode", opts = { nowait = true }},
  },
  n = {
    ["<leader>H"] = { ":noh<cr>", "remove highlights"}
  },
}

return M
