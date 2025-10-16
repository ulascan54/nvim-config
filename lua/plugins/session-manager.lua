return {
  "Shatur/neovim-session-manager",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local Path = require("plenary.path")
    local sm = require("session_manager")

    sm.setup({
      sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- varsayılan ~/.local/share/nvim/sessions
      autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- mevcut dizin için yükle
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_filetypes = { "gitcommit", "neo-tree", "NvimTree" },
      autosave_only_in_session = false,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SessionSavePre",
      callback = function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("Neotree close")
        end
      end,
    })
  end,
}

