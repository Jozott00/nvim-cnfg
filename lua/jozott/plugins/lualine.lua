-- Lualine
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim",
        "f-person/git-blame.nvim",
    },
    opts = function()
        vim.g.gitblame_display_virtual_text = 0;
        local git_blame = require('gitblame');

        return {
            options = {
                theme = "seoul256",
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    { "fancy_mode", width = 3 }
                },
                lualine_b = {
                    { "fancy_branch" },
                    { "fancy_diff" },
                },
                lualine_c = {
                    { "fancy_cwd", substitute_home = true },
                    { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
                    { require('auto-session.lib').current_session_name },
                },
                lualine_x = {
                    { "fancy_macro" },
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                    { "fancy_location" },
                },
                lualine_y = {
                    { "fancy_filetype", ts_icon = "" }
                },
                lualine_z = {
                    { "fancy_lsp_servers" }
                },
            }
        }
    end,
}
