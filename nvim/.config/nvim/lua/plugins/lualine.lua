return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/tokyonight.nvim" },
  lazy = false,
  opts = {
    options = {
      theme = "tokyonight",
      globalstatus = true,
      icons_enabled = false,
      component_separators = "|",
      section_separators = "",
    },
  },
}
