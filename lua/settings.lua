-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time, displays which-key popup sooner
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

vim.g.typescript_conceal_function = 'ƒ'
vim.g.typescript_conceal_null = 'ø'
vim.g.typescript_conceal_undefined = '¿'
vim.g.typescript_conceal_this = '@'
vim.g.typescript_conceal_return = '⇚'
vim.g.typescript_conceal_prototype = '¶'
vim.g.typescript_conceal_super = 'Ω'

local augroup = vim.api.nvim_create_augroup
local AdventureTimeGroup = augroup('AdventureTimeGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require('plenary.reload').reload_module(name)
end

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 40,
    }
  end,
})

autocmd({ 'BufWritePre' }, {
  group = AdventureTimeGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Set options
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.encoding = 'UTF-8'
vim.opt.completeopt:remove 'preview' -- Adjusting based on existing settings
vim.opt.guicursor = '' -- Hide the GUI cursor when typing
vim.opt.tabstop = 5 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- See 'tabstop' when inserting tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.wrap = false -- Disable text wrapping
vim.opt.swapfile = false
vim.opt.backup = false -- Disable creating swap and backup files
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- Set the directory for undo files
vim.opt.hlsearch = false -- Do not highlight all search matches
vim.opt.incsearch = true -- Show incremental search matches
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.scrolloff = 8 -- Set the number of lines to keep above and below the cursor
vim.opt.isfname:append '@-@' -- Ensure certain characters are treated as part of a file name
vim.opt.updatetime = 50 -- Reduce the time it takes for NeoVim to respond to certain events
vim.opt.colorcolumn = '80' -- Display a vertical line at the 80th character for guiding code formatting
vim.opt.shell = 'cmd.exe' -- Set the shell to cmd.exe, useful in Windows environments
