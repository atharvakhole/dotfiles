-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.opt.smoothscroll = false
vim.o.showtabline = 2
vim.opt.showmode = true -- Shows "recording @q" in command area
vim.opt.showcmd = true -- Shows command being typed
-- Force fzf-lua as default picker
vim.g.lazyvim_picker = "fzf"

-- Python debugging
vim.g.python3_host_prog = "~/.virtualenvs/debugpy/bin/python"
