require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("clss", {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          documentationFormat = { "plaintext" },
        },
      },
    },
  },
})

vim.lsp.config("roslyn", {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          documentationFormat = { "markdown", "plaintext" },
        },
      },
      hover = {
        contentFormat = { "markdown", "plaintext" },
      },
    },
  },
})

local servers = { "html", "cssls", "tailwindcss", "vtsls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
