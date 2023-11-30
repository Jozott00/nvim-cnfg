return {
  'stevearc/aerial.nvim',
  keys = {
      {"<leader>aa", "<cmd>AerialToggle right<cr>", desc = "Toggle Aerial right" },
      {"<CS-J>", "<cmd>1AerialNext<cr>", desc = "Next Aerial entry" },
      {"<CS-K>", "<cmd>1AerialPrev<cr>", desc = "Prev Aerial entry" },
  },
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
}
