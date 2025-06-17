return{
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function ()
        local lint = require('lint')
        lint.linters_by_ft = {
            python = {
                'flake8',
                'mypy',
                'pylint'
            },
            markdown = {
                "markdownlint-cli2"
            }
        }
        lint.linters.pylint.args = {
            '--disable=missing-module-docstring,missing-function-docstring,missing-class-docstring',
            '--module-naming-style=PascalCase',
            '--class-naming-style=PascalCase',
            '--function-naming-style=<style>',
            '--method-naming-style=<style>'
        }
        lint.linters.flake8.args = {
            '--max-line-length=100'
        }
        vim.api.nvim_create_autocmd({"BufWritePre"}, {
            pattern = {"*.py", "*.md" },
            callback = function ()
                lint.try_lint()
            end
        })

    end
}
