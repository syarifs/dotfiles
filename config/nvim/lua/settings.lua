require('cfg.nvim-compe')
require('cfg.statusline')
require('nvim_comment').setup()
require('colorizer').setup({'*'}, {mode='foreground'})
require('lspkind').init({
	with_text = false
})

local cmd = vim.cmd
local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}

local function opt(scope, key, value)
  scopes[scope][key] = value
end

local indent = 2
cmd 'colorscheme onedark'
cmd ':lua Tree = require(\'cfg.tree\')'

opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('o', 'shiftwidth', indent)                        -- Size of an indent
opt('o', 'background', 'dark')                        -- Setup Background to Dark
opt('o', 'smartindent', true)                         -- Insert indents automatically
opt('o', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'lazyredraw', true)													--
opt('o', 'regexpengine', 1)												  	--
opt('o', 'showmode', false)														-- Hide Mode Text
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'mouse', 'a')													      -- Activate Mouse Click
opt('w', 'number', true)                              -- Print line number
opt('w', 'cursorline', true)			      							-- Highlihgt Cursor Line Number

-- nvim tree
opt('g', 'nvim_tree_auto_open', 1)
opt('g', 'nvim_tree_quit_on_open', 1)
opt('g', 'nvim_tree_git_hl', 1)
opt('g', 'nvim_tree_indent_markers', 1)
opt('g', 'nvim_tree_ignore', {'.git', 'node_modules', '.cache', '.github'})
opt('g', 'nvim_tree_show_icons', {git=1, folders=0, files=1})

-- ultisnips
opt('g', 'UltiSnipsExpandTrigger', '<C-Tab>')
opt('g', 'UltiSnipsJumpForwardTrigger', '<C-n>')
opt('g', 'UltiSnipsJumpBackwardTrigger', '<C-b>')

-- CSV Column Highlight
cmd 'hi link CSVColumnOdd MoreMsg'
cmd 'hi link CSVColumnEven Question'
