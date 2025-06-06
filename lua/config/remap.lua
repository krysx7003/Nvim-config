vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":w | Oil<Cr>")

local function toggle_relative_numbers()
  vim.wo.relativenumber = not vim.wo.relativenumber
end

vim.keymap.set('i', '(', '()')

vim.keymap.set('n', '<leader>rn', toggle_relative_numbers, { desc = 'Toggle relative numbers' })
vim.keymap.set('n', '<leader>d', '<cmd>Telecope diagnostics<CR>', { desc = 'Show diagnostics (Telescope)' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostic float' })
