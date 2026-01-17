require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "tailwindcss", "vtsls", "roslyn" }
vim.lsp.enable(servers)

vim.lsp.config("roslyn", {})

-- vim.lsp.config("vtsls", {})

-- read :h vim.lsp.config for changing options of lsp servers
