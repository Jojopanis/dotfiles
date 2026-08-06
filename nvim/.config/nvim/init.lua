vim.opt.number					= true
vim.opt.relativenumber	= true
vim.opt.tabstop 				= 8
vim.o.shiftwidth        = 4
vim.o.softtabstop       = -1
vim.opt.expandtab				= true
vim.opt.signcolumn			= 'yes'
vim.opt.clipboard       = 'unnamedplus'
vim.opt.ignorecase      = true
vim.opt.smartcase       = true
vim.opt.undofile        = true

vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim'},
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/catgoose/nvim-colorizer.lua' },
	{ src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/brianhuster/live-preview.nvim'},
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'pyright', 'html', 'cssls', 'ts_ls', 'qmlls', 'emmet_language_server'},
})
require('catppuccin').setup({
	flavour = 'frappe',
})
require('lualine').setup()
require('live-preview').setup()

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
