vim.g.mapleader = " "

local function toggle_relative_numbers()
    vim.wo.relativenumber = not vim.wo.relativenumber
end

vim.keymap.set("n", "<leader>rn", toggle_relative_numbers, { desc = "Toggle relative numbers" })
