local map = vim.keymap.set

-- Select, delete, yank all
map("n", "vig", "gg<S-v>G", { desc = "Select all" })
map("n", "dig", "ggdG", { desc = "Delete all" })
map("n", "yig", "ggyG", { desc = "Yank all" })

-- Disable arrow keys
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

-- Move to window
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })

-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close all other windows" })
map("n", "<leader>wj", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>wl", "<C-W>v", { desc = "Split window right" })

-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", { desc = "Center when scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Center when scroll down" })

-- Center screen when jumping
map("n", "<C-i>", "<C-i>zz", { desc = "Center when jump forward" })
map("n", "<C-o>", "<C-o>zz", { desc = "Center when jump backward" })

-- Center screen when move to next/prev result
map("n", "*", "*Nzz", { desc = "Center when next result with *" })
map("n", "#", "#Nzz", { desc = "Center when next result with #" })
map("n", "n", "nzz", { desc = "Center when next result" })
map("n", "N", "Nzz", { desc = "Center when prev result" })

-- Clear search with <esc>
map({ "i", "x", "n", "s" }, "<esc>", "<cmd>:silent! noh<cr><esc>", { desc = "Clear search" })

-- Better up/down movement
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate between quickfix list
map("n", "gn", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
map("n", "gp", "<cmd>cprev<cr>", { desc = "Previous quickfix item" })

-- Map space to .* in search command mode
map("c", "<space>", function ()
  local mode = vim.fn.getcmdtype()
  if mode == "?" or mode == "/" then
    return ".*"
  else
    return " "
  end
end, { expr = true })

-- console.log current word (JS only)
map(
  "n",
  "cn",
  function()
    local current_word = vim.fn.expand("<cword>")
    local current_line = vim.api.nvim_get_current_line()
    local indent = string.match(current_line, "^%s*")
    vim.cmd('normal! o')
    local new_line_num = vim.fn.line('.')
    vim.fn.setline(new_line_num, indent .. 'console.log(\'' .. current_word .. '\', '.. current_word ..')')
    vim.cmd('normal! $')
  end,
  { noremap = true, silent = true, desc = "Log current word" }
)

map("n", "<leader>9", function() vim.cmd([[ b# ]]) end, { desc = "Select previous buffer"} )

map("v", "<C-c>", '"*y', { desc = "Copy to clipboard" })

map("n", "<leader>lg", function() vim.cmd("!set-token") end, { desc = "Generate access token"} )

map("n", "<leader>tg", function() vim.cmd("terminal pnpm gen-types-gis") end, { desc = "Generate type gis schema"} )

map("n", "<leader>tm", function() vim.cmd("terminal pnpm gen-types-main") end, { desc = "Generate type main schema"} )
