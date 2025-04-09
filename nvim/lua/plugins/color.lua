return {
  {
    "glepnir/zephyr-nvim",
    lazy = false, -- load immediately or set `event = "VeryLazy"` if preferred
    priority = 1000, -- load before other plugins (important for colorschemes)
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    },
    config = function()
      vim.cmd("colorscheme zephyr")
      -- Optionally, get zephyr color
      -- local zephyr = require('zephyr').zephyr
      -- print(zephyr.yellow)
    end,
  },
}
