require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("n", "<leader>o", "<cmd>Outline<Cr>", { desc = "Toggle outline" })

-- map("n", "]m", "g]f", { desc = "Next method" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n" }, "<C-S-h>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "move buffer to the left" })

map({ "n" }, "<C-S-l>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "move buffer to the right" })
