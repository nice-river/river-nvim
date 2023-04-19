local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- makes some plugins dot-repeatable like leap
	{ "tpope/vim-repeat", event = "VeryLazy" },

	{ "nvim-lua/popup.nvim", lazy = true },

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
		},
	},

	-- snippet
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neoconf.nvim",
			"mfussenegger/nvim-dap",
			{
				"simrat39/rust-tools.nvim",
				-- config = function()
				-- 	require("rust-tools").setup({})
				-- end,
			},
		},
	},
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/playground",
		},
	},

	{ "windwp/nvim-autopairs" },

	{ "numToStr/Comment.nvim" },

	{ "lewis6991/gitsigns.nvim" },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = { "moll/vim-bbye" },
	},

	{ "nvim-lualine/lualine.nvim" },

	{ "ahmedkhalf/project.nvim" },

	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	},

	{ "lukas-reineke/indent-blankline.nvim" },

	{
		"goolord/alpha-nvim",
	},

	{ "folke/which-key.nvim" },

	{ "RRethy/vim-illuminate" },

	{
		"j-hui/fidget.nvim",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
