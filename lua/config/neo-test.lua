local test = require("neotest")

test.setup({
  adapters = {
    require("neotest-python")({
      runner = "pytest",
    }),
  },
})
