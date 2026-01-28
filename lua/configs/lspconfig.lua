require("nvchad.configs.lspconfig").defaults()

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("cssls", {
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
  -- capabilities = {
  --   textDocument = {
  --     completion = {
  --       completionItem = {
  --         documentationFormat = { "plaintext" },
  --       },
  --     },
  --     hover = {
  --       contentFormat = { "plaintext" },
  --     },
  --   },
  -- },
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

vim.lsp.config("tailwind-cssls", {
  cmd = {
    "/home/rafael/.nvm/versions/node/v23.6.0/lib/node_modules/@tailwindcss/language-server/bin/css-language-server",
    "--stdio",
  },
  filetypes = { "css" },
  root_markers = { "package.json" },
})

local servers = { "html", "tailwindcss", "vtsls", "tailwind-cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
