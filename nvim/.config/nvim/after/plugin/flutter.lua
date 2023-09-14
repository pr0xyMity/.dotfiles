require("flutter-tools").setup {
    closing_tags = {
    highlight = "", -- highlight for the closing tag
    prefix = "// ", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
} -- use defaults

vim.keymap.set("n", "<leader>d", "<cmd> FlutterDevices<CR>")
vim.keymap.set("n", "<leader>r", "<cmd> FlutterRestart<CR>")
vim.keymap.set("n", "<leader>q", "<cmd> FlutterQuit<CR>")
