require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview",
})

autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview",
})
