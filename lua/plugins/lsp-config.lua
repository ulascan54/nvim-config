return {
  -- Mason core
  { "mason-org/mason.nvim", opts = {} },

  -- Mason <-> LSPConfig bridge (v2+). It can auto-enable servers.
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- Use nvim-lspconfig server names
      ensure_installed = { "lua_ls", "ts_ls" },
      -- automatic_enable = true is the default; leaving as-is lets Mason call :lua vim.lsp.enable()
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)

      -- Per-server tweaks with the *new* API
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        -- add ts/js settings if you need them later
      })

      -- Optional: explicitly enable now (Mason v2 also auto-enables if installed)
      vim.lsp.enable({ "lua_ls", "ts_ls" })

      -- Buffer-local keymaps on attach (modern best practice)
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

