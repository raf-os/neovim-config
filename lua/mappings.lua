require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("n", "<leader>o", "<cmd>Outline<Cr>", { desc = "Toggle outline" })

-- map("n", "]m", "g]f", { desc = "Next method" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
