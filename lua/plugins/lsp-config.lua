return {
  -- Mason core
  { "mason-org/mason.nvim", opts = {} },

  -- Mason <-> LSPConfig bridge
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Lua LSP 
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- TypeScript / JavaScript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- HTML LSP
      vim.lsp.config("html", {
        capabilities = capabilities,
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
          provideFormatter = true,
        },
      })

      -- CSS LSP
      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "html", "cssls" })

      -- Buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local b = { buffer = ev.buf }
          vim.keymap.set("n", "K",  vim.lsp.buf.hover,        b)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,   b)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,   b)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, b)
        end,
      })
    end,
  },
}

