return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "configs.mason"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c_sharp",
        "c",
        "query",
        "markdown",
        "markdown_inline",
      },
      treesitter_highlighting = { enabled = true },
      highlight = { enabled = true },
    },
  },

  {
    "seblyng/roslyn.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
      filewatching = "roslyn",
    },
    ft = "cs",
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>sr", "<cmd>AutoSession search<CR>", desc = "Session search" },
      { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>sa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
    },

    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      load_on_setup = true,
      session_lens = {
        picker = "telescope",
      },
      -- log_level = 'debug',
    },
  },

  { "nvim-mini/mini.nvim", version = "*" },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim", "saghen/blink.cmp" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", "saghen/blink.cmp" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "blink-cmp-documentation", "blink-cmp-menu" },
      completions = { blink = { enabled = true } },
      win_options = {
        conceallevel = {
          rendered = 2,
        },
      },
      patterns = { markdown = { disable = false } },
    },
    -- preset = "obsidian",
    -- ft = { "markdown", "blink-cmp-documentation", "blink-cmp-menu" },
    -- completions = { lsp = { enabled = true } },
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
    },
    config = function(_, opts)
      require("ufo").setup(opts)
      -- vim.keymap.set("n", "zR", require("ufo").openallfolds)
      -- vim.keymap.set("n", "zM", require("ufo").closeallfolds)
    end,
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        position = "right",
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "seblyng/roslyn.nvim",
    },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
        -- use_nvim_cmp_as_default = true,
      },

      signature = {
        enabled = true,
        window = {
          treesitter_highlighting = true,
          show_documentation = true,
        },
      },

      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
      },

      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          lsp = {
            enabled = true,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      enable_close = false,
      enable_rename = true,
      enable_close_on_slash = true,
    },
  },
}
