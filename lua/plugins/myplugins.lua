return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "sindrets/diffview.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  { "mini.pairs", enabled = false },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "alfaix/neotest-gtest",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      adapters = {
        -- require("neotest-gtest").setup({}),
        require("neotest-python")({
          -- Here you can specify the settings for the adapter, i.e.
          dap_enabled = true,
          dap = { stopOnEntry = true, justMyCode = false },
          runner = "uv run pytest",
        }),
      },
    },
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
        },
      })
    end,
  },
}
