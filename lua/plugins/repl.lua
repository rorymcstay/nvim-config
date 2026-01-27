return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          dap_integration = true,
          execute_on_send = true,

          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" },
            },
            python = {
              command = { "ipython" },
              block_dividers = { "# %%", "#%%" },
              format = common.bracketed_paste,

              env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").right(80),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        -- If the highlight is on, y
        -- For the available options, check nvim_set_hl
        keymaps = {
          toggle_repl = "<space>rr", -- toggles the repl open and closed.
          -- If repl_open_command is a table as above, then the following keymaps are
          -- available
          -- toggle_repl_with_cmd_1 = "<space>rv",
          -- toggle_repl_with_cmd_2 = "<space>rh",
          restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_paragraph = "<space>sp",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          send_code_block = "<space>sb",
          send_code_block_and_move = "<space>sn",
          mark_motion = "<space>sm",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },

        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
      vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
      vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true, desc = "Iron REPL" }

      -- Overwrite <leader>s* mappings
      map(
        "n",
        "<leader>sn",
        iron.send_line,
        vim.tbl_extend("force", opts, {
          desc = "Send line to REPL",
        })
      )

      map(
        "v",
        "<leader>sb",
        iron.visual_send,
        vim.tbl_extend("force", opts, {
          desc = "Send selection to REPL",
        })
      )

      map(
        "n",
        "<leader>sl",
        iron.send_file,
        vim.tbl_extend("force", opts, {
          desc = "Send file to REPL",
        })
      )

      map(
        "n",
        "<leader>sm",
        iron.send_mark,
        vim.tbl_extend("force", opts, {
          desc = "Send mark to REPL",
        })
      )
    end,
  },
}
