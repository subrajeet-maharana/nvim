vim.cmd("set guifont=JetBrainsMono\\ Nerd\\ Font\\ Mono:h11")

require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"


-- Added by Subrajeet Maharana
-- Define a function to get the current file name without extension
function get_current_filename()
  local path = vim.fn.expand('%:p') -- Get full path of current file
  local filename = vim.fn.fnamemodify(path, ':t:r') -- Extract filename without extension
  return filename
end

-- Map F5 key to execute the desired command
vim.api.nvim_set_keymap('n', '<F5>', ':!g++ %:p -o %:t:r && %:t:r.exe<CR>', { noremap = true, silent = true })

-- Overriding tab to 4 spaces instead of 3
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
