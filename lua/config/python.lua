vim.api.nvim_create_user_command("VenvCreate", function()
    vim.fn.system({ "mkdir", "venv" })
    vim.fn.system({ "python3", "-m", "venv", "venv" })
end, {})
