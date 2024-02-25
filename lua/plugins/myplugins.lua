return {
  { "mini.pairs", enabled = false },
  { "codeium.nvim", enabled = true },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
      dap_enabled = true,
      path = "/home/rory/dev/",
      search_venv_managers = false,
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    --[[ opts = {
      adapters = {
        require("neotest-python")({
          -- Here you can specify the settings for the adapter, i.e.
          dap_enabled = true,
          dap = { stopOnEntry = true, justMyCode = false },
          runner = "pytest",
          args = { "--debug" },
          python = "venv/bin/python",
        }),
      },
    },
    --]]
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
