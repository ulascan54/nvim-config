return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "                                                     ",
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      "                                                     ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file",        ":Telescope find_files<CR>"),
      dashboard.button("n", "  New file",         ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "  Recent files",     ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Find text",        ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Config",           ":e $MYVIMRC<CR>"),
      dashboard.button("s", "  Restore Session",  ":SessionManager load_last_session<CR>"),
      dashboard.button("l", "󰒲  Lazy",             ":Lazy<CR>"),
      dashboard.button("q", "  Quit",             ":qa<CR>"),
    }

    -- Footer (Atatürk Quote)
    dashboard.section.footer.val = {
      "",
      "",
      "“Empty your mind. Be formless. Shapeless.",
      " Like water. Water Can flow, or it can crash.",
      " Be water, my friend.”",
      "                                  — Bruce Lee",
    }

    -- Layout & Styling
    dashboard.section.buttons.opts.spacing = 1

    alpha.setup(dashboard.opts)
    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end
}
