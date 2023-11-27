return { {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { [[<leader>\d]], "<cmd>ToggleTerm size=40 dir=~/ direction=horizontal<cr>", desc = "Open horizontal at ~/" },
    },
    init = function()
        require("toggleterm").setup({
            function(term)
                if term.direction == "horizontal" then
                    return 40
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[\\]],
            hide_numbers = false,
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            direction = 'horizontal',
            close_on_exit = true,
            shell = 'zsh',
            float_opts = {
                border = 'curved',
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        })


        -- some keymaps
        local km = vim.keymap
        km.set("n", [[\h]], "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Toggle Horizontal Term" })
        km.set("n", [[\f]], "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Term" })

        local Terminal = require('toggleterm.terminal').Terminal

        local lazygit = Terminal:new({cmd = "lazygit", direction = "float", hidden = true})
        km.set("n", [[\g]], function() lazygit:toggle() end, { desc = "Lazygit" })


        function _NEW_HORIZ_TERM()
            Terminal:new({ direction = "horizontal" }):toggle()
        end

        km.set("t", "<C-d>", _NEW_HORIZ_TERM)
    end,
},


}
