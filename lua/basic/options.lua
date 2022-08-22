local o = vim.opt

o.wildmenu = false
o.completeopt = 'menu,menuone,noselect' -- better autocompletion experience
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
o.expandtab = true
o.laststatus = 3
o.spr = true
o.sb = true
o.signcolumn = 'yes'
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.showcmd = true
--o.backup = false -- not sure
o.shell = 'zsh' -- not sure
o.inccommand = 'split'
o.smarttab = true
o.ai = true
o.si = true
o.clipboard = 'unnamedplus'
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
o.backspace = 'start,eol,indent'
o.path:append { '**' } -- finding files - search down into subfolders

-- transparent wildmenu and popups
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 0

o.background = 'dark'

-- undercurl
--vim.cmd([[let &t_Cs = "\e[4:3m"]])
--vim.cmd([[let &t_Ce = "\e[4:0m"]])
