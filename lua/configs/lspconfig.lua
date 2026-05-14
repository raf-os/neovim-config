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

vim.lsp.config("neocmake", {
  cmd = { "neocmakelsp", "stdio" },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--function-arg-placeholders=0",
  },
})

vim.lsp.config("qmlls", {
  cmd = { "qmlls6" },
})

-- vim.lsp.config("qml-language-server", {
--   cmd = { "qml-language-server" },
--   filetypes = { "qml" },
--   root_markers = { { "qmldir", "shell.qml" }, ".git" },
-- })

local servers = {
  "lua_ls",
  "html",
  "tailwindcss",
  "vtsls",
  "tailwind-cssls",
  "jsonls",
  "qmlls",
  -- "qml-language-server",
  "neocmake",
  "clangd",
  "basedpyright",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
