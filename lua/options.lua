require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:]]

o.viewoptions = "cursor,folds,slash,unix"
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.relativenumber = true

o.clipboard = "unnamedplus"
