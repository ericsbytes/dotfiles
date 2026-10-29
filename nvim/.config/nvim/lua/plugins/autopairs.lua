return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
  keys = {
    {
      "<leader>up",
      function()
        require("nvim-autopairs").toggle()
      end,
      desc = "Toggle Auto Pairs",
    },
  },
}
