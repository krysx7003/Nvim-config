return{
   'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup{
            options = {
                theme = 'auto',  -- Use a theme that supports icons
                icons_enabled = true,  -- Explicitly enable icons
            },
        }
    end,
}
