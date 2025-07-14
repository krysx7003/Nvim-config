vim.g.mapleader = " "

local function toggle_relative_numbers()
    vim.wo.relativenumber = not vim.wo.relativenumber
end

vim.keymap.set("n", "<leader>rn", toggle_relative_numbers, { desc = "Toggle relative numbers" })


vim.keymap.set("n", "<C-K>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-J>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-H>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-L>", ":wincmd l<CR>")
