return {
	"nvim-tree/nvim-tree.lua",
	depenencies = {
		"nvim-tree/nvim-web-devicons"
    },
    event = 'VimEnter',
	config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup({
          view = {
            width = 35,
            relativenumber = true,
          },
          -- change folder arrow icons
          renderer = {
            indent_markers = {
              enable = true,
            },
            icons = {
              glyphs = {
                folder = {
--                  arrow_closed = "", -- arrow when folder is closed
                  arrow_open = "", -- arrow when folder is open
                },
              },
            },
          },
          -- disable window_picker for
          -- explorer to work well with
          -- window splits
          actions = {
            open_file = {
              window_picker = {
                enable = false,
              },
            },
          },
          filters = {
            custom = { ".DS_Store" },
          },
          git = {
            ignore = false,
          },

          -- projects settings
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
              enable = true,
              update_code = true,
          }
        })


        local keymap = vim.keymap
        keymap.set("n", "<leader>et", "<cmd>NvimTreeToggl<cr>", {desc = "Explorer Toggle"})
        keymap.set("n", "<leader>ee", "<cmd>NvimTreeFocus<cr>", {desc = "Explorer Focus"})
        keymap.set("n", "<leader>es", "<cmd>NvimTreeFindFile<cr>", {desc = "Explorer Search File"})
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", {desc = "Explorer Collapse"})
        keymap.set("n", "<leader>eh", "<cmd>help nvim-tree-commands<cr>", {desc = "Explorer Help"})

    end
}
