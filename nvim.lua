-- **************************************
--
-- nvim config! 
-- heavily inspired from nezaj's config 
--
-- **************************************

-------------------
-- Settings
-------------------
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


vim.o.ignorecase = true  -- Make searches case-insensitive
vim.o.smartcase = true   -- But case-sensitive if uppercase is used in the search
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Configure netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Yank/paste to/from system clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Leaders
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-------------------
-- Remaps
-------------------

-- Open nerdtree
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTree)

-- Move code blocks 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Page up / Page down 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Scroll between blocks
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete without copying to buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Format
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Navigation
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Window cycling 
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Save/quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>zz", ":qa!<CR>", { noremap = true })

-- Reload vimrc file
vim.keymap.set("n", "<leader>sv", ":so $MYVIMRC<CR>", { noremap = true, silent = true })

-- Edit useful files
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>et", ":e $MYTMUXCONF<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ez", ":e $MYZSH<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ep", ":e $MYPROFILE<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ed", ":e $MYTODOS<CR>", { noremap = true, silent = true })

-- Clear search
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Begin/end line navigation
vim.keymap.set("n", "H", "0w", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Clipboard copy
vim.keymap.set("v", "<leader>c", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })

-- Clipboard paste
vim.keymap.set("n", "<leader>v", ":r !pbpaste<CR><CR>", { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':0tabnew<CR>', { noremap = true, silent = true })


-------------------
-- Packer
--
-- Once upon a time I used pathogen, which I liked!
-- Then I switched to vim-plug, which I must admit was better
-- Now I'm on Packer. Is it better? I don't know yet...
-- But it looks like I'm already behind? There's something called Lazy now...
--
-- Such is vim life
-------------------

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

vim.cmd.packadd('packer.nvim')

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colors

  use({
	  'folke/tokyonight.nvim',
	  config = function()
		  vim.cmd('colorscheme tokyonight')
	  end
  })


  -- syntax highlighting
  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end
    }

  -- fancy undo
  use("mbbill/undotree")

  -- Git things
  use("tpope/vim-fugitive")

  -- Comments
  use 'tomtom/tcomment_vim'

  -- Nerdtree
  use 'preservim/nerdtree'


  -- LSP Support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  
  -- Prettier
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  
  -- Clojure things
  use 'Olical/conjure'
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
 
  -- Zen mode
  use 'junegunn/goyo.vim'

  -- Copilot

  use 'github/copilot.vim'
end)

-------------------
-- Autocommands
-------------------
-- Markdown writing mode
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.colorcolumn = ""
    vim.opt_local.textwidth = 0
    vim.opt_local.scrolloff = 0
    vim.cmd('Goyo 80x100%')
  end,
})

-- Autoformat
vim.api.nvim_create_augroup('LspFormatting', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'LspFormatting',
  pattern = '*',
  callback = function()
    vim.lsp.buf.format()
  end,
})


-- **************************************
--
-- Plugin settings below. Beware, here be dragons
--
-- **************************************

-------------------
-- LSP
-- For all my intelisense needs
-------------------
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'tailwindcss', 'clojure_lsp' },
  automatic_enable = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('tailwindcss', {
  filetypes = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

vim.lsp.enable({ 'ts_ls', 'tailwindcss', 'clojure_lsp', 'lua_ls' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,
})

-- Completion
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.HINT] = 'H',
      [vim.diagnostic.severity.INFO] = 'I',
    },
  },
})

---- 
-- Prettier 

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
}) 

-------------------
-- NERDTree
-- I couldn't get netrw working the way I like and NERDTree _just works_
-------------------
-- Files and directories I don't want to see
-- Note the use of vim-style regex
vim.g.NERDTreeIgnore = {
    '\\.\\(pyc\\|swp\\|db\\|coverage\\|DS_Store\\)$',
    '\\.\\(git\\|hg\\|svn\\|egg-info\\)$[[dir]]',
    '\\(coverage\\|pytests\\)\\.xml$',
}

-- I do want to see dotfiles (like .gitignore)
vim.g.NERDTreeShowHidden = 1

-- Pretty NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

-------------------
-- Telescope
-- Fuzzy-finder ftw!
-------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', ';', ':Telescope buffers sort_lastused=true<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>a', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-------------------
-- Treesitter
-- Fancy color syntax highlighting. 
-------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-------------------
-- Undotree
-- Fancy undo.
-------------------
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-------------------
-- Tcomment
-- Commenting made easy!
-------------------
vim.api.nvim_set_keymap('n', '//', ':TComment<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '//', ':TComment<CR>', { noremap = true, silent = true })
