return {
    {
        "stevearc/conform.nvim",

        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                local disable_filetypes = {}
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang_format" },
                python = { "isort", "black" },
            },
        },
        formatters = {
            clang_format = {
                prepend_args = { "--style=file", "--fallback-style=LLVM" },
            },
        },
    },
}
