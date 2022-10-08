require('basic.term')

local k = vim.keymap.set
local opts = { noremap = true, silent = true }

-- switch buffer
k("n", "bb", ":bp<CR>", opts) -- next buf
k("n", "bn", ":bn<CR>", opts) -- prev buf

-- move between panes
-- k('n', "<C-h>", "<C-w>h")
-- k('n', "<C-j>", "<C-w>j")
-- k('n', "<C-k>", "<C-w>k")
-- k('n', "<C-l>", "<C-w>l")

-- pair
-- k('i', '(<space>', '()<left>')
-- k('i', '{<space>', '{}<left>')
-- k('i', '[<space>', '[]<left>')
-- k('i', '<<space>', '<><left>')
-- k('i', '"<space>', '""<left>')
-- k('i', "'<space>", "''<left>")

-- auotpair
k('i', '(', '()<left>')
k('i', '{', '{}<left>')
k('i', '[', '[]<left>')
k('i', '<', '<><left>')
k('i', '"', '""<left>')
k('i', "'", "''<left>")

-- disable keybind
k('i', '<C-n>', '<nop>')
k('i', '<C-p>', '<nop>')

-- no x yank
k("n", "x", '"_x')

-- buffers
k("n", "bd", "<C-w>c") -- close window
k("n", "bdd", ":bd<CR>", opts) -- buffer delete
k("n", "bddd", ":q<CR>", opts) -- quit

-- resize w/ hjkl
-- k("n", "<A-h>", ":vertical resize +5<cr>", opts)
-- k("n", "<A-l>", ":vertical resize -5<cr>", opts)
-- k("n", "<A-k>", ":resize +5<cr>", opts)
-- k("n", "<A-j>", ":resize -5<cr>", opts)
k("n", "<A-h>", "5<C-w>>") -- inc width
k("n", "<A-l>", "5<C-w><") -- dec width
k("n", "<A-k>", "5<C-w>+") -- inc height
k("n", "<A-j>", "5<C-w>-") -- dec height

-- replace K w/ gt
k('', 'gt', 'K')

-- move line of code
--k("n", "<S-J>", ":m+1<CR>", opts)
--k("n", "<S-K>", ":m-2<CR>", opts)

-- move block of code
k("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)
k("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)

-- indent line 'move right/left'
k("v", "<S-l>", ">gv")
k("v", "<S-h>", "<gv")

-- terminal
k("t", "<Esc>", "<C-\\><C-n>")
k({ 'n', 't' }, "<S-Tab>", ToggleTerminal)

-- split
k('n', 'ss', ':sp<CR>', opts)
k('n', 'sv', ':vs<CR>', opts)

--k('', '<space>t', ':Lexplore<CR>')
-- cut/cp/paste - disabled cuz i use clipboard unnamedb option
--k("n", "<C-x>", '"+dd')
--k("v", "<C-c>", '"+y')
--k("n", "<C-S-v>", '"+p')
