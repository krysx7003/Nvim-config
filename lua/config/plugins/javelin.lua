return{
    {
        dir = vim.fn.expand("~/plugins/javelin.nvim"),
        config = function ()
            require('javelin').setup()
        end
    }
}
