-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable ex mode' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without spaces' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen after page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen after page up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep search results centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep search results centered' })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste and delete original text' })

-- Toggle highlight search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })

-- Navigate quickfix/location lists
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Go to next quickfix entry' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Go to previous quickfix entry' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Go to next location entry' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Go to previous location entry' })

-- Substitute word under cursor
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute word under cursor' })

-- Make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })

-- Reload configuration
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Reload configuration' })

-- Toggle concealing chars
vim.keymap.set('n', '<leader>l', function()
  local conceallevel = vim.opt.conceallevel:get()
  vim.opt.conceallevel = conceallevel == 0 and 1 or 0
end, { desc = 'Toggle concealing chars' })

-- Reveal/hide help bars and stars
local conceal_level_enabled = true
local function toggle_conceal_level_and_highlight()
  if conceal_level_enabled then
    vim.opt.conceallevel = 0
    vim.cmd 'hi link HelpBar Normal'
    vim.cmd 'hi link HelpStar Normal'
    conceal_level_enabled = false
  else
    vim.opt.conceallevel = 2
    vim.cmd 'hi link HelpBar Ignore'
    vim.cmd 'hi link HelpStar Ignore'
    conceal_level_enabled = true
  end
end
vim.keymap.set('n', '<leader>h', toggle_conceal_level_and_highlight, { desc = 'Toggle help bar/star visibility', silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Terminal keymaps
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

-- Visual mode mappings for moving blocks of text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Format current buffer
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format current buffer' })

-- Project view
vim.keymap.set('n', '<leader>pv', '<cmd>Ex <CR>', { desc = 'Show project view' })
