return{
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function ()
        require('lint').linters_by_ft = {
            python = {
                'flake8',
                'mypy',
                'pylint'
            }
        }
        vim.api.nvim_create_autocmd({"BufWritePre"}, {
            pattern = "*.py",
            callback = function ()
                require("lint").try_lint()
            end
        })

    end
}
