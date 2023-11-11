--------------------------------
-- Ensure packer is installed --
--------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

---------------------
-- Install Plugins --
---------------------
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Diagnostics
  use({"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"})

  -- Nvim-tree
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

  -- navigate from .c/.cpp to .h and vice-versa. Command is :A
  use("vim-scripts/a.vim")

  -- better flows and notifications
  use("rcarriga/nvim-notify")
  use("nvim-lua/plenary.nvim")

  -- fuzzy finder
  use {
    "nvim-telescope/telescope.nvim", 
    tag="0.1.4", 
    requires={{"nvim-lua/plenary.nvim"}}
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-------------------
-- General setup --
-------------------
-- change leader character
vim.g.mapleader=","

-- Term colors. Also required by nvim-tree
vim.opt.termguicolors = true

vim.cmd("set hlsearch")
vim.opt.colorcolumn="81"

-- Set color of popup menu
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg=10, ctermfg=15, guibg=ffffff })


---------------------
-- nvim-tree setup --
---------------------
-- disable netrw at the very start of init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
vim.api.nvim_set_keymap('n', '<C-n>', ":NvimTreeToggle<CR>", { noremap = false })

---------------------
-- Telescope setup --
---------------------
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.api.nvim_set_keymap('n', '<C-p>', ":Telescope find_files<CR>", { noremap = false })
