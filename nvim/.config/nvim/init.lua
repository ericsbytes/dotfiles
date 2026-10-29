vim.opt.number = true
vim.opt.showmode = false
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s%C%4{v:lnum} %3{v:relnum} "

require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("CommentContinuation", { clear = true }),
  callback = function()
    vim.opt_local.formatoptions:append("r")
    vim.opt_local.formatoptions:remove("o")
  end,
})

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ff9e64",
  bold = true,
})
