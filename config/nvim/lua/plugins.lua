local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/savq/paq-nvim.git', install_path})
end
execute 'packadd paq-nvim'

local paq = require('paq-nvim').paq

paq {'savq/paq-nvim', opt=true}

-- lsp
paq {'neovim/nvim-lspconfig'}
paq {'hrsh7th/nvim-compe'}
paq {'glepnir/lspsaga.nvim'}
paq {'onsails/lspkind-nvim'}
paq {'tpope/vim-dadbod'}
paq {'kristijanhusak/vim-dadbod-ui'}
paq {'kristijanhusak/vim-dadbod-completion'}

-- file manager
paq {'kyazdani42/nvim-tree.lua'}
paq {'kyazdani42/nvim-web-devicons'}

-- pair
paq {'jiangmiao/auto-pairs'}
paq {'alvan/vim-closetag'}

-- theme
paq {'joshdick/onedark.vim'}
paq {'romgrk/barbar.nvim'}

-- Status Line
paq {'glepnir/galaxyline.nvim'}

-- code editor
paq {'nvim-treesitter/nvim-treesitter'}
paq {'terrortylor/nvim-comment'}
paq {'norcalli/nvim-colorizer.lua'}
paq {'evanleck/vim-svelte'}
paq {'prettier/vim-prettier'}

-- snippet pack
paq {'SirVer/ultisnips'}
paq {'honza/vim-snippets'}

paq {'chrisbra/csv.vim'} -- CSV Support
