return {

    -- line/block move plugin
    {
        'booperlv/nvim-gomove',
        config = function()
            require("gomove").setup()
        end
    },

    -- comment handling plugin
    {
        'numToStr/Comment.nvim',
        opts = {

        },
        lazy = false,
        config = function()
            require("Comment").setup()

            -- local api = require('Comment.api')
            -- local km = vim.keymap

            -- km.set("n", "A-/", api.toggle.linewise.current)
            -- km.set("i", "A-/", api.toggle.linewise.current)
            -- km.set("n", "A-c", api.toggle.linewise.current)
        end
    },



}
