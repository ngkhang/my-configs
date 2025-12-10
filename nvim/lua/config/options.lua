-- Ref: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- LazyVim auto format
vim.g.autoformat = true

local  opt = vim.opt

opt.mouse = "a"       -- allow the mouse to be used in neovim
opt.tabstop = 2       -- Number of spaces tabs count for
opt.confirm = true    -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true  -- Use spaces instead of tabs
opt.number = true     -- set numbered lines
opt.laststatus = 3    -- global statusline
