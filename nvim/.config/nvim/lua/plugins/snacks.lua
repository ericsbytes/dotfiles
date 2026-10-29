return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
    explorer = { enabled = true, replace_netrw = false },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Search Project" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Switch Buffer" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
