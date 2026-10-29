return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
      callback = function(event)
        -- Keep regular syntax highlighting for files without a parser.
        pcall(vim.treesitter.start, event.buf)
      end,
    })
  end,
}
