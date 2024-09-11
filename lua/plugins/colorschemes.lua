local utils = require("core.utils")

return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("kanagawa")
    --   utils.set_new_hl()
    -- end
  },
  { "sainnhe/gruvbox-material", name = "gruv-material", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight", lazy = false, priority = 1000 },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    --   utils.set_new_hl()
    -- end,
  },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
  { "navarasu/onedark.nvim", name = "onedark", lazy = false, priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false, priority = 1000 },
  { "savq/melange-nvim", name = "melange", lazy = false, priority = 1000 },
  { "AlexvZyl/nordic.nvim", name = "nordic", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", lazy = false, priority = 1000 },
  { "Shatur/neovim-ayu", name = "neovim-ayu", lazy = false, priority = 1000 },
  { "katawful/kat.nvim", name = "kat", lazy = false, priority = 1000 },
  { "JoosepAlviste/palenightfall.nvim", name = "palenightfall", lazy = false, priority = 1000 },
  { "dasupradyumna/midnight.nvim", name = "midnight", lazy = false, priority = 1000 },
  { "neanias/everforest-nvim", name = "everforest", lazy = false, priority = 1000 },
  { "xero/miasma.nvim", name = "miasma", lazy = false, priority = 1000 },
  { "maxmx03/dracula.nvim", name = "dracula", lazy = false, priority = 1000 },
  {
    "2nthony/vitesse.nvim",
    name = "vitesse",
    lazy = false,
    priority = 1000,
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  { "numToStr/Sakura.nvim", name = "sakura", lazy = false, priority = 1000 },
  { "VDuchauffour/neodark.nvim", name = "neodark", lazy = false, priority = 1000 },
  { "lucastrvsn/kikwis", name = "kikwis", lazy = false, priority = 1000 },
  { "lettertwo/laserwave.nvim", name = "laserwave", lazy = false, priority = 1000 },
  { "disrupted/one.nvim", name = "one", lazy = false, priority = 1000 },
  { "Allianaab2m/penumbra.nvim", name = "penumbra", lazy = false, priority = 1000 },
  { "samueljoli/cyberpunk.nvim", name = "cyberpunk", lazy = false, priority = 1000 },
  {
    "clpi/cyu.lua",
    name = "cyu",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("cayu")
      utils.set_new_hl()
    end,
  },
  { "AxelGard/oneokai.nvim", name = "oneokai", lazy = false, priority = 1000 },
  { "fengzhiken/ceon.nvim", name = "ceon", lazy = false, priority = 1000 },
  { "NephIapalucci/onedarker-pro.nvim", name = "onedarker-pro", lazy = false, priority = 1000 },
  { "Everblush/nvim", name = "everblush", lazy = false, priority = 1000 },
  {
    "atelierbram/Base4Tone-nvim",
    name = "base4tone",
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("base4tone_modern_e_dark")
    --   utils.set_new_hl()
    -- end,
  },
  { "hehaowen00/darkest-one", name = "darkest-one", lazy = false, priority = 1000 },
  { "def-SpaceWar/blazing.nvim", name = "blazing", lazy = false, priority = 1000 },
  {
    "uloco/bluloco.nvim",
    name = "bluloco",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },
  { "mikesmithgh/gruvsquirrel.nvim", name = "gruvsquirrel", lazy = false, priority = 1000 },
  { "dotsilas/darcubox-nvim", name = "darcubox", lazy = false, priority = 1000 },
  { "water-sucks/darkrose.nvim", name = "darkrose", lazy = false, priority = 1000 },
  {
    "AntonyZ89/electron-vue.nvim",
    name = "electron-vue",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    -- init = function()
    --   vim.cmd.colorscheme("electron-vue-darker")
    --   utils.set_new_hl()
    -- end,
  },
  { "mrjones2014/lighthaus.nvim", name = "lighthaus", lazy = false, priority = 1000 },
  { "JoosepAlviste/palenightfall.nvim", name = "palenightfall", lazy = false, priority = 1000 },
}
