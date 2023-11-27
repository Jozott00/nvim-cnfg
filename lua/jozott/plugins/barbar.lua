return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false

        local km = vim.keymap
        km.set("n", "<A-,>", "<cmd>BufferPrevious<cr>", { desc = "Previous Buffer" })
        km.set("n", "<A-.>", "<cmd>BufferNext<cr>", { desc = "Next Buffer" })
        km.set("n", "<A-<>", "<cmd>BufferMovePrevious<cr>", { desc = "Move Buffer Left" })
        km.set("n", "<A->>", "<cmd>BufferMoveNext<cr>", { desc = "Move Buffer Right" })

        km.set("n", "<A-1>", "<cmd>BufferGoto 1<cr>", { desc = "Go to buffer 1" })
        km.set("n", "<A-2>", "<cmd>BufferGoto 2<cr>", { desc = "Go to buffer 2" })
        km.set("n", "<A-3>", "<cmd>BufferGoto 3<cr>", { desc = "Go to buffer 3" })
        km.set("n", "<A-4>", "<cmd>BufferGoto 4<cr>", { desc = "Go to buffer 4" })
        km.set("n", "<A-5>", "<cmd>BufferGoto 5<cr>", { desc = "Go to buffer 5" })
        km.set("n", "<A-0>", "<cmd>BufferLast<cr>", { desc = "Go to last buffer" })
        
        km.set("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin current buffer" })


        km.set("n", "<leader>bc", "<cmd>BufferClose<cr>", { desc = "Close current buffer" })
        km.set("n", "<leader>br", "<cmd>BufferRestore<cr>", { desc = "Restore last buffer" })
        km.set("n", "<leader>boc", "<cmd>BufferCloseAllButCurrent<cr>", { desc = "Close all but current" })
        km.set("n", "<leader>bov", "<cmd>BufferCloseAllButVisible<cr>", { desc = "Close all but visible" })
        km.set("n", "<leader>bop", "<cmd>BufferCloseAllButPinned<cr>", { desc = "Close all but pinned" })
        km.set("n", "<leader>bol", "<cmd>BufferCloseBuffersLeft<cr>", { desc = "Close all left" })
        km.set("n", "<leader>bor", "<cmd>BufferCloseBuffersRight<cr>", { desc = "Close all right" })



        -- buffer sorting
        km.set("n", "<leader>bsn", "<cmd>BufferOrderByBufferNumber<cr>", { desc = "Sort buffers by number" })
        km.set("n", "<leader>bsn", "<cmd>BufferOrderByDirectory<cr>", { desc = "Sort buffers by directory" })
        km.set("n", "<leader>bsn", "<cmd>BufferOrderByLanguage<cr>", { desc = "Sort buffers by language" })
        km.set("n", "<leader>bsn", "<cmd>BufferOrderByWindowNumber<cr>", { desc = "Sort buffers by window number" })
    end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
