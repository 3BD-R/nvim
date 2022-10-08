require('basic.statusline')
local o = vim.opt
local g = vim.g

o.wildmenu = false
o.mouse = 'a'
o.termguicolors = true
o.wrap = false
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.history = 10000
o.swapfile = false
o.autoindent = true
o.smartindent = true
o.smarttab = true
-- o.expandtab = true
-- o.si = true
o.backspace = 'start,eol,indent'
o.ls = 3
o.ch = 0
o.statusline = "%!luaeval('Status_line()')"
o.spr = true
o.sb = true
o.signcolumn = 'yes'
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.showcmd = true
o.backupskip = '/tmp/*'
o.scrolloff = 10
o.shell = '/bin/zsh'
o.inccommand = 'split'
--o.backup = false -- not sure
o.clipboard = 'unnamedplus'
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
o.path:append { '**' } -- finding files - search down into subfolders

-- transparent wildmenu and popups
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 0

o.background = 'dark'

vim.g.gruvbox_contrast_dark = "hard"

o.shadafile = "NONE"
o.shadafile = ""

o.lazyredraw = true

g.dart_style_guide = 2
-- undercurl
--vim.cmd([[let &t_Cs = "\e[4:3m"]])
--vim.cmd([[let &t_Ce = "\e[4:0m"]])
--g.netrw_browse_split = 2
--g.netrw_banner = 0
--g.netrw_liststyle = 3
--g.netrw_winsize = 20
vim.cmd([[ 	colo night ]])
