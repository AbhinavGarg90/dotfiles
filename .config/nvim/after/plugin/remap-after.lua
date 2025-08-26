vim.keymap.set("n", "<leader>e", ":vsplit | wincmd H | vertical resize 35<CR>")

local function is_terminal_buffer(bufnr)
    local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
    return buftype == 'terminal'
end

vim.keymap.set("n", "<leader>q", function()
        if is_terminal_buffer(vim.api.nvim_get_current_buf())
            then vim.cmd("bd!")
            else vim.cmd("bd")
        end
        end)
vim.keymap.set("n", "<leader>t", ":split | wincmd J | horizontal resize 15 <CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap = true})
