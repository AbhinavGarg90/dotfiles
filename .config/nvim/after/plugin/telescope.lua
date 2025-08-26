local builtin = require('telescope.builtin')
local enable_telescope_hidden = false
local _, telescope = pcall(require, "telescope")


telescope.setup({
    defaults = {
        path_display = {"truncate"}
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = true,
            initial_mode = "normal",
            mappings = {
                n = {
                  ["d"] = "delete_buffer",
                }
            }
        },
        find_files = {
            hidden = false
        }
    }
})

vim.api.nvim_create_user_command('TelescopeHiddenToggle', function()
    enable_telescope_hidden = not enable_telescope_hidden
    telescope.setup({
        pickers = {
            find_files = {
                hidden = enable_telescope_hidden
            }
        }
    })
end
, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('v', '<leader>ff', "y:Telescope find_files<CR><C-r>\"", {noremap = true})
vim.keymap.set('v', '<leader>fg', "y:Telescope live_grep<CR><C-r>\"", {noremap = true})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fe', builtin.loclist, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>m', builtin.marks)
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

