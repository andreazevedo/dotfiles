return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
	    close_if_last_window = true,
	    window = {
		    mappings = {
          ["o"] = { "open", nowait = true, config = {}},
          ["oc"] = { "open", nowait = true },
          ["od"] = { "open", nowait = true },
          ["og"] = { "open", nowait = true },
          ["om"] = { "open", nowait = true },
          ["on"] = { "open", nowait = true },
          ["os"] = { "open", nowait = true },
          ["ot"] = { "open", nowait = true },
		    },
	    },
    },
    config = function(_, opts)
	require("neo-tree").setup(opts)
        vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })
        vim.keymap.set('n', '<leader>nm', ':Neotree reveal<CR>', { silent = true })
    end
}
