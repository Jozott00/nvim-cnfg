return {
    "AlexvZyl/nordic.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        require('nordic').load()

        local palette = require("nordic.colors.nordic")
        vim.cmd(string.format("highlight LineNr guifg=%s", palette.gray5))
    end
}
