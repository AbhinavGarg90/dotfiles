local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local function Rg()
    -- Function to split space-separated string into separate arguments
    local function splitArgs(input)
        local args = {}
        for arg in input:gmatch("%S+") do
            table.insert(args, arg)
        end
        return args
    end

    -- Ask user for input
    local userInput = vim.fn.input("Enter args: ")
    -- Split user input into separate arguments
    local args = splitArgs(userInput)
    -- Add 'rg' command as the first argument
    table.insert(args, 1, 'rg')
    -- Insert an empty string as a placeholder
    table.insert(args, '')

    local opts = {
        finder = finders.new_oneshot_job(args),
        sorter = sorters.get_generic_fuzzy_sorter(),
    }

    local picker = pickers.new(opts)
    picker:find()
end

local function RgC()
    local input = {'rg', '-tc', '-tcpp',''}
    local opts = {
        finder = finders.new_oneshot_job(input),
        sorter = sorters.get_generic_fuzzy_sorter(),
    }

    local picker = pickers.new(opts)
    picker:find()
end
vim.keymap.set('n', '<leader>fr', Rg)
vim.keymap.set('n', '<leader>fc', RgC)
