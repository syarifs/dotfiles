local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Basic Usage
map('n', '<C-S-Up>', ':resize -2<CR>')
map('n', '<C-S-Down>', ':resize +2<CR>')
map('n', '<C-S-Left>', ':vertical resize -2<CR>')
map('n', '<C-S-Right>', ':vertical resize +2<CR>')
map('', 'u', ':undo<CR>')
map('', 'z', ':redo<CR>')
map('', 's', ':w!<CR>')
map('', 'q', ':bdelete<CR>')
map('', '<A-q>', ':qa<CR>')
map('n', '<A-/>', ':CommentToggle<CR>')
map('v', '<A-/>', ':CommentToggle<CR>')

-- File Manager
map('n', '<C-f>', ':lua Tree.toggle()<CR>')
map('n', '<C-r>', ':NvimTreeRefresh<CR>')
map('n', '<C-F>', ':NvimTreeFindFile<CR>')

-- Copy Pasta (xclip required)
map('v', '<C-c>', '"+y')
map('i', '<C-v>', '<ESC>"+p')
map('v', '<C-v>', '"+p')
map('n', '<C-v>', '"+p')

-- Better Indentation
map('v', '<Tab>', '>', {noremap=false, silent=true})
map('v', '<S-Tab>', '<', {noremap=false, silent=true})

-- Better Window Movement
map('', '<A-Up>', '<C-w>k')
map('', '<A-Down>', '<C-w>j')
map('', '<A-Left>', '<C-w>h')
map('', '<A-Right>', '<C-w>l')

-- Tab Support
map('', '<A-S-Right>', ':bnext<CR>')
map('', '<A-S-Left>', ':bprevious<CR>')

-- Tab Completion
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<CR>', 'compe#confirm(\'<CR>\')', {expr = true, noremap = true})

-- LSP
map('n', '<C-d>', ':LspDiagnosticsAll<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'cb', ':Lspsaga diagnostic_jump_prev<CR>')
map('n', 'cn', ':Lspsaga diagnostic_jump_next<CR>')
map('n', 'ca', ':Lspsaga code_action<CR>')
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'K', ':Lspsaga hover_doc<CR>')
