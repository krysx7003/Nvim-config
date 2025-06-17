require("config.lazy")
require("config.remap")

vim.opt.tabstop = 4

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffffff'})

vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      vim.lsp.semantic_tokens.start(bufnr,client.id)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function()
    local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    vim.cmd("silent !firefox " .. filename .. " &")
  end
})
