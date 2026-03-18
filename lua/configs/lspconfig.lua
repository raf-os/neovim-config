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
    "/usr/lib/node_modules/@tailwindcss/language-server/bin/css-language-server",
    "--stdio",
  },
  filetypes = { "css" },
  root_markers = { "package.json" },
})

vim.lsp.config("neocmake", {})

vim.lsp.config("clangd", {})

local servers = { "lua_ls", "html", "tailwindcss", "vtsls", "tailwind-cssls", "jsonls", "qmlls", "neocmake", "clangd" }
vim.lsp.enable(servers)

vim.lsp.config("qmlls", {
  cmd = { "qmlls6" },
})

-- read :h vim.lsp.config for changing options of lsp servers
