local utils = require("core.utils")

return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    event = "ColorSchemePre",
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("kanagawa")
    --   utils.set_new_hl()
    -- end
  },
  { "sainnhe/gruvbox-material", name = "gruv-material", event = "ColorSchemePre", priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight", event = "ColorSchemePre", priority = 1000 },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "ColorSchemePre",
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    --   utils.set_new_hl()
    -- end,
  },
  { "EdenEast/nightfox.nvim", name = "nightfox", event = "ColorSchemePre", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", event = "ColorSchemePre", priority = 1000 },
  { "navarasu/onedark.nvim", name = "onedark", event = "ColorSchemePre", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", event = "ColorSchemePre", priority = 1000 },
  { "savq/melange-nvim", name = "melange", event = "ColorSchemePre", priority = 1000 },
  { "AlexvZyl/nordic.nvim", name = "nordic", event = "ColorSchemePre", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", event = "ColorSchemePre", priority = 1000 },
  { "Shatur/neovim-ayu", name = "neovim-ayu", event = "ColorSchemePre", priority = 1000 },
  { "katawful/kat.nvim", name = "kat", event = "ColorSchemePre", priority = 1000 },
  { "JoosepAlviste/palenightfall.nvim", name = "palenightfall", event = "ColorSchemePre", priority = 1000 },
  { "dasupradyumna/midnight.nvim", name = "midnight", event = "ColorSchemePre", priority = 1000 },
  { "neanias/everforest-nvim", name = "everforest", event = "ColorSchemePre", priority = 1000 },
  { "xero/miasma.nvim", name = "miasma", event = "ColorSchemePre", priority = 1000 },
  { "maxmx03/dracula.nvim", name = "dracula", event = "ColorSchemePre", priority = 1000 },
  {
    "2nthony/vitesse.nvim",
    name = "vitesse",
    event = "ColorSchemePre",
    priority = 1000,
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  { "numToStr/Sakura.nvim", name = "sakura", event = "ColorSchemePre", priority = 1000 },
  { "VDuchauffour/neodark.nvim", name = "neodark", event = "ColorSchemePre", priority = 1000 },
  { "lucastrvsn/kikwis", name = "kikwis", event = "ColorSchemePre", priority = 1000 },
  { "lettertwo/laserwave.nvim", name = "laserwave", event = "ColorSchemePre", priority = 1000 },
  { "disrupted/one.nvim", name = "one", event = "ColorSchemePre", priority = 1000 },
  { "Allianaab2m/penumbra.nvim", name = "penumbra", event = "ColorSchemePre", priority = 1000 },
  { "samueljoli/cyberpunk.nvim", name = "cyberpunk", event = "ColorSchemePre", priority = 1000 },
  {
    "clpi/cyu.lua",
    name = "cyu",
    event = "ColorSchemePre",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("cayu")
      utils.set_new_hl()
    end,
  },
  { "AxelGard/oneokai.nvim", name = "oneokai", event = "ColorSchemePre", priority = 1000 },
  { "fengzhiken/ceon.nvim", name = "ceon", event = "ColorSchemePre", priority = 1000 },
  { "NephIapalucci/onedarker-pro.nvim", name = "onedarker-pro", event = "ColorSchemePre", priority = 1000 },
  { "Everblush/nvim", name = "everblush", event = "ColorSchemePre", priority = 1000 },
  {
    "atelierbram/Base4Tone-nvim",
    name = "base4tone",
    event = "ColorSchemePre",
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("base4tone_modern_e_dark")
    --   utils.set_new_hl()
    -- end,
  },
  { "hehaowen00/darkest-one", name = "darkest-one", event = "ColorSchemePre", priority = 1000 },
  { "def-SpaceWar/blazing.nvim", name = "blazing", event = "ColorSchemePre", priority = 1000 },
  {
    "uloco/bluloco.nvim",
    name = "bluloco",
    event = "ColorSchemePre",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },
  { "mikesmithgh/gruvsquirrel.nvim", name = "gruvsquirrel", event = "ColorSchemePre", priority = 1000 },
  { "dotsilas/darcubox-nvim", name = "darcubox", event = "ColorSchemePre", priority = 1000 },
  { "water-sucks/darkrose.nvim", name = "darkrose", event = "ColorSchemePre", priority = 1000 },
  {
    "AntonyZ89/electron-vue.nvim",
    name = "electron-vue",
    event = "ColorSchemePre",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    -- init = function()
    --   vim.cmd.colorscheme("electron-vue-darker")
    --   utils.set_new_hl()
    -- end,
  },
  { "mrjones2014/lighthaus.nvim", name = "lighthaus", event = "ColorSchemePre", priority = 1000 },
  { "JoosepAlviste/palenightfall.nvim", name = "palenightfall", event = "ColorSchemePre", priority = 1000 },
}
