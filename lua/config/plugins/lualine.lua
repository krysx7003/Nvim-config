local timer = vim.uv.new_timer()
local chronos = require("chronos")
local timer_count = chronos.load_timer()
local current_time = "00:00"

local function update_time()
    local hours = timer_count / 60
    local minutes = timer_count % 60
    current_time = string.format("%02d:%02d", hours, minutes)
    chronos.timer = timer_count
    timer_count = timer_count + 1
    require("lualine").refresh()
end

if timer then
    timer:start(0, 60000, vim.schedule_wrap(update_time))
end

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true,
            },
            sections = {
                lualine_x = {
                    function()
                        return "Time: " .. current_time
                    end,
                    "fileformat",
                    "filetype",
                },
            },
        })
    end,
}
