require("nvchad.configs.lspconfig").defaults()

local capabilities = require("blink.cmp").get_lsp_capabilities()

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

-- vim.lsp.config("roslyn", {
--   capabilities = {
--     textDocument = {
--       completion = {
--         completionItem = {
--           documentationFormat = { "markdown", "plaintext" },
--         },
--       },
--       hover = {
--         contentFormat = { "markdown", "plaintext" },
--       },
--     },
--   },
-- })

vim.lsp.config("roslyn", { capabilities = capabilities })

local servers = { "html", "cssls", "tailwindcss", "vtsls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
