return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "mason-org/mason.nvim" },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
    vim.lsp.enable("clangd")
  end,
}
