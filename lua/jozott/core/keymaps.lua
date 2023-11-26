-- set leader key
vim.g.mapleader = ' '


local keymap = vim.keymap

-------------
-- General Keymaps
-- ---------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- normal mode keymaps
keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "Reformat Code" })
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write File" })
keymap.set("n", "<leader>a", "<cmd>Alpha <cr>", { desc = "Alpha" })
keymap.set("n", "<leader>q", "<cmd>wall!<cr>", { desc = "Quit after saving" })
keymap.set("n", "<leader>k", "<cmd>bdelete<cr>", { desc = "Kill buffer (close file)" })


keymap.set("n", "<A-d>", "<cmd>co.<cr>", { desc = "Reformat Code" })


-- search mappings
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
keymap.set("n", "<leader>sm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap.set("n", "<leader>sr", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap.set("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commangs" })


