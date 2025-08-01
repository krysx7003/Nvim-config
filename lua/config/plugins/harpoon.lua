return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            ------------------- REMAP --------------------------
            vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
        end
    }
}
