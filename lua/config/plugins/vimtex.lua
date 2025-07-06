return {
    {
        "lervag/vimtex",
        lazy = false,

        init = function()
            local javelin = require("javelin")
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = { "*.tex" },
                callback = function()
                    local filename = vim.api.nvim_buf_get_name(0)
                    local pdffile = filename:gsub("%.tex$", ".pdf")
                    javelin.launch(pdffile)
                end,
            })
            vim.api.nvim_create_autocmd("BufLeave", {
                pattern = { "*.tex" },
                callback = function()
                    javelin.close_tab()
                end,
            })
        end,
    },
}
