local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui   = require("harpoon.ui")

-- add file and toggle menu
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon file" })
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon UI" })

-- loop for slots 1–9
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        ui.nav_file(i)
    end, { desc = "Harpoon to file " .. i })
end
