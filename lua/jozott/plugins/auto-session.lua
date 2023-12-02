return {
    {
        'rmagatti/auto-session',
        opt = {
            log_level = "error",
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_enable_last_session = true,
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
            cwd_change_handling = {
                restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
                pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
                post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
                    require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
                end,
            },
        },
    },
    {
        'rmagatti/session-lens',
        dependencies = {
            'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'
        },
        opt = {},
        init = function()
            require('telescope').load_extension("session-lens");
        end
    }
}
