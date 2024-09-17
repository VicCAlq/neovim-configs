# A Basic (but well-featured) NeoVim Config

## Intro

This is a simple and modular config which I made to share between my laptop and my phone (using Termux).

It has plugins setup for navigating files, using autocompletion, LSPs, plugin management, quick-search and many more. For the things I require it's only lacking an integrated debugger, but since it's one of the more complext plugins to configure it'll be setup at a later point.

## Installed plugins

This is a comprehensive list to showcase what's available from the get-go:

#### LSPs, completion and formatting

- [nvim-cmp](github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [luasnip](github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [cmp-luasnip](github.com/saadparwaiz1/cmp_luasnip) - Integration of LuaSnip with nvim-cmp
- [friendly-snippets](github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages
- [cmp-nvim-lsp](github.com/hrsh7th/cmp-nvim-lsp) - Nvim-cmp source for neovim builtin LSP client
- [cmp-buffer](github.com/hrsh7th/cmp-buffer) - Nvim-cmp source for buffer words
- [cmp-path](github.com/hrsh7th/cmp-path) - Nvim-cmp source for filesystem paths
- [nvim-lspconfig](github.com/nvim-lspconfig) - Quickstart configs for Nvim LSP
- [mason](github.com/williamboman/mason.nvim) - Easily install and manage LSP servers, DAP servers, linters, and formatters.
- [mason-lspconfig](github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.
- [mason-tool-installer](github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Install and upgrade third party tools automatically.
- [fidget](github.com/j-hui/fidget.nvim) - Extensible UI for Neovim notifications and LSP progress messages.
- [cmp-nvim-lsp](github.com/hrsh7th/cmp-nvim-lsp) - Nvim-cmp source for neovim builtin LSP client.
- [lspsaga](github.com/glepnir/lspsaga.nvim) - Improve neovim lsp experience.
- [treesitter](github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer.
- [treesitter-context](github.com/nvim-treesitter/nvim-treesitter-context) - Lightweight alternative to context.vim.
- [treesitter-textobjects](github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support.
- [none-ls](github.com/nvimtools/none-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- [none-ls-extras](github.com/nvimtools/none-ls-extras.nvim) - Extra sources for none-ls.nvim.
- [mason-null-ls](github.com/jayp0521/mason-null-ls.nvim) - Mason-null-ls.nvim closes some gaps that exist between mason.nvim and null-ls.

#### Visuals and layout

- [web-devicons](github.com/nvim-tree/nvim-web-devicons) - Lua fork of vim-web-devicons for neovim.
- [mini.icons](github.com/echasnovski/mini.icons) - Icon provider. Part of 'mini.nvim' library.
- [netrw](github.com/prichrd/netrw.nvim) - Adds modern features and visuals to NetRW.
- [alpha](github.com/goolord/alpha-nvim) - A fast and fully programmable greeter for neovim.
- [headlines](github.com/lukas-reineke/headlines.nvim) - A
- [lualine ](github.com/nvim-lualine/lualine.nvim) - A
- [markdown](github.com/tadmccorkle/markdown.nvim) - A
- [notify](github.com/rcarriga/nvim-notify) - Better visuals for notifications.
- [scrollview](github.com/dstein64/nvim-scrollview) - Shows an actual scrollbar.

#### Functionality

- [ ](github.com/nvim-telescope/telescope.nvim) - A fuzzy finder for all your needs.
- [whichkey](github.com/folke/which-key.nvim) - Easily remember your keybindings.
- [aerial](github.com/stevearc/aerial.nvim) - A code outline window for skimming and quick navigation.
- [autopairs](github.com/windwp/nvim-autopairs) - Autopairs for neovim written in lua.
- [better-escape](github.com/max397574/better-escape.nvim) - Map keys without delay when typing
- [colorizer](github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter for Neovim.
- [fugitive](github.com/tpope/vim-fugitive) - A git wrapper.
- [rhubarb](github.com/tpope/vim-rhubarb) - Extension for Fugitive.
- [git-blame](github.com/f-person/git-blame.nvim) - Git blame plugin.
- [gitsigns](github.com/lewis6991/gitsigns.nvim) - A
- [indent-blankline](github.com/lukas-reineke/indent-blankline.nvim) - A
- [markdown-preview](github.com/iamcco/markdown-preview.nvim) - A
- [markdown-toc](github.com/hedyhli/markdown-toc.nvim) - Generates and manages tables of contents.
- [neo-tree](github.com/nvim-neo-tree/neo-tree.nvim) - Explorer for files, git repos and buffers.
- [session-manager](github.com/Shatur/neovim-session-manager) - Manages sessions for easy project navigation.
- [sleuth](github.com/tpope/vim-sleuth) - Adjusts vim options based on filetype.
- [spectre](github.com/nvim-pack/nvim-spectre) - Enhanced search and replace for easier refactors.
- [suda](github.com/lambdalisue/suda.vim) - Create and modify files as super-user.
- [toggleterm](github.com/akinsho/toggleterm.nvim) - A more convenient terminal.
- [ufo](github.com/kevinhwang91/nvim-ufo) - More folding functionality.

#### Themes

Too many to list. Please check `lua/plugins/colorschemes` for that.

#### Others / Extra

- [love2d](github.com/S1M0N38/love2d.nvim) - Love2d bindings.
- [plenary](github.com/nvim-lua/plenary.nvim) - Extra functionality for many plugins.
- [tmux-navigator](github.com/christoomey/vim-tmux-navigator) - Better integration with tmux.

## Future integrations

[ ]- [Dooku](github.com/Zeioth/dooku.nvim): Code documentation generator (HTML) for neovim.
[ ]- [VimDoge](github.com/kkoomen/vim-doge): (Do)cumentation (Ge)nerator (as docstrings) for nearly 20 languages.
[ ]- [Compiler](github.com/Zeioth/compiler.nvim): Neovim compiler for building and running your code without having to configure anything.
[ ]- [DAP](github.com/mfussenegger/nvim-dap): Debug Adapter Protocol client implementation for NeoVim.
[ ]- [NeoTest](github.com/nvim-neotest/neotest): A framework for interacting with tests within NeoVim.
[ ]- [DadBod](https://github.com/tpope/vim-dadbod): Modern database interface for Vim.

## Credits

- The folks from [kickstart.nvim](github.com/nvim-lua/kickstart.nvim) for the great base (from which I took the configs for LSPs, autocompletion and related things)
- [hendrikmi](github.com/hendrikmi/neovim-kickstart-config/) for the very helpful video guide and for some of the configs I took.
