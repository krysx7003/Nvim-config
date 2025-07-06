vim.g.mapleader = " "

local function toggle_relative_numbers()
    vim.wo.relativenumber = not vim.wo.relativenumber
end

-- Oil
vim.keymap.set("n", "<leader>pv", ":w | Oil<Cr>")

-- Telescope
vim.keymap.set("n", "<leader>rn", toggle_relative_numbers, { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<leader>d", "<cmd>Telecope diagnostics<CR>", { desc = "Show diagnostics (Telescope)" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostic float" })

-- Comment
local commentapi = require("Comment.api")

vim.keymap.set("n", "<C-_>", function()
    commentapi.toggle.linewise.current()
end)

vim.keymap.set("v", "<C-_>", function()
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(esc, "nx", false) -- Exit visual mode first
    commentapi.toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment selection" })

-- Dap
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>bb", function()
    dap.toggle_breakpoint()
    vim.cmd("redraw!")
end, { desc = "Toggle breakpoint" })

vim.keymap.set("n", "<leader>bc", function()
    dap.toggle_breakpoint(vim.fn.input("Breakpoint condition: "))
    vim.cmd("redraw!")
end, { desc = "Set conditional breakpoint" })

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue debugging" })

vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F2>", dap.step_out, { desc = "Step into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Step into" })

vim.keymap.set("n", "<leader>dt", function()
    dap.close()
    dapui.close()
end, { desc = "End debug session" })

vim.keymap.set("n", "<leader>de", function()
    dapui.eval()
    dapui.eval()
end, { desc = "Eval and focus float" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

-- Move
require("move").setup()

vim.keymap.set("n", "<C-Up>", ":MoveLine(-1)<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":MoveLine(1)<CR>", { silent = true })

vim.keymap.set("v", "<C-Up>", ":MoveBlock(-1)<CR>", { silent = true })
vim.keymap.set("v", "<C-Down>", ":MoveBlock(1)<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>ps", function()
    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep > "),
    })
end)

-- UndooTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
