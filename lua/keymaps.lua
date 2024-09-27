-- keymaps.lua

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

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
vim.keymap.set('n', '<leader>gs', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute word under cursor' })

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
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format current buffer' })

-- Project view
vim.keymap.set('n', '<leader>pv', '<cmd>Ex <CR>', { desc = 'Show project view' })

-- Telescope keymaps
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = '[?] Search Help' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- keymaps.lua

-- [[ Basic Keymaps ]]
-- ...

-- [[ LSP Keymaps ]]
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

-- [[ .NET Keymaps ]]
vim.keymap.set('n', '<leader>db', function()
  vim.fn.jobstart('dotnet build', {
    cwd = vim.fn.expand '%:p:h', -- Execute in the directory of the current file
    on_exit = function(_, _, _)
      print 'dotnet build completed'
    end,
  })
end, { desc = 'Run dotnet build' })

vim.keymap.set('n', '<leader>dr', function()
  vim.fn.jobstart('dotnet run', {
    cwd = vim.fn.expand '%:p:h', -- Execute in the directory of the current file
    on_exit = function(_, _, _)
      print 'dotnet run completed'
    end,
  })
end, { desc = 'Run dotnet run' })
