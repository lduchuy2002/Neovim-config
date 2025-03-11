return {
  "saghen/blink.cmp",
  version = '*',
  dependencies = {
    "giuxtaposition/blink-cmp-copilot"
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<Tab>"] = { "accept" },
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" }
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true
        }
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      list = {
        selection = {
          auto_insert = false
        }
      },
      ghost_text = {
        enabled = true,
        show_with_menu = true
      },
    },
    cmdline = {
      completion = {
        list = {
          selection = {
            auto_insert = false
          }
        },
        menu = {
          auto_show = true
        }
      },
      keymap = {
        ["<Tab>"] = { "accept" },
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" }
      }
    }
  },
  opts_extend = { "sources.default" }
}
