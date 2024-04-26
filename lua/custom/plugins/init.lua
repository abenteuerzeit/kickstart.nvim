-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Color scheme
  { 'rose-pine/neovim', name = 'rose-pine' },

  -- CSS color preview
  'ap/vim-css-color',

  -- Lua
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Git
  --
  'tpope/vim-fugitive',

  -- PostgreSQL
  'lifepillar/pgsql.vim',

  -- Text Manipulation & Utilities
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'mbbill/undotree',
  'laytan/cloak.nvim', -- Secret management

  'HerringtonDarkholme/yats.vim',

  -- ERROR: github issue
  -- 'vim-airline/vim-airline',
}
