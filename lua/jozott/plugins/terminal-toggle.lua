return {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- keys = {
    --     { "<leader>td", "<cmd>ToggleTerm size=40 dir=~/ direction=horizontal<cr>", desc = "Open horizontal at ~/" },
    -- },
    -- open_mapping = [[<c-\>]],
    init = function()
        require("toggleterm").setup({
            function(term)
                if term.direction == "horizontal" then
                    return 15
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
            direction = vertical,
            close_on_exit = true,
            shell = zsh,
            float_opts = {
                border = 'curved',
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        })
    end,
}

