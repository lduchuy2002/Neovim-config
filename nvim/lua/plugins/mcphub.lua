return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
  },
  branch = "nightly",
  -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
  build = "bundled_build.lua",
  config = function()
    require("mcphub").setup({
      -- Required options
      port = 3169,  -- Port for MCP Hub server
      config = vim.fn.expand("~/mcpservers.json"),  -- Absolute path to config file
      use_bundled_binary = true
    })
  end
}
