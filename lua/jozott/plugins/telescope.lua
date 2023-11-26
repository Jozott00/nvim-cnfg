return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                               , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find File" })
        vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = "Colorscheme" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find Text Buffer" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search Buffer" })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent Files" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags" })

        local  f = {
            name = "File Search",
            c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
            f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
            t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        }
    end
}
