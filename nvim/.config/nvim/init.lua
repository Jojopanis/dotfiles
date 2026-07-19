vim.opt.number					= true
vim.opt.relativenumber	= true
vim.opt.tabstop 				= 2
vim.opt.shiftwidth			= 2
vim.opt.expandtab				= true
vim.opt.signcolumn			= 'yes'
vim.opt.clipboard       = 'unnamedplus'
vim.opt.ignorecase      = true
vim.opt.smartcase       = true

vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim'},
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/catgoose/nvim-colorizer.lua' },
	{ src = 'https://github.com/catppuccin/nvim' },
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'pyright', 'html', 'cssls', 'ts_ls', 'qmlls'},
})
require('catppuccin').setup({
	flavour = 'frappe',
})
require('lualine').setup()

vim.cmd.colorscheme "catppuccin"

---autocompletion shit
vim.o.autocomplete = true
vim.o.complete = 'o,.,w,b,u'
vim.o.completeopt = 'fuzzy,menuone,noselect,popup'
vim.o.pumheight = 7
vim.o.pummaxwidth = 80

vim.diagnostic.config({
  virtual_lines = {current_line = true},
})
