-- Space is my Leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Go to Vim Explorer
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true }) 
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true }) 

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking the visual selection.
-- https://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")

-- Disable command history or alleast remap
vim.keymap.set("v", "q:", ":q")

-- Paste replace visual selection without copying it.
-- vim.keymap.set("v", "p", "_dP")
--
-- The Prime way
vim.keymap.set("x", "<Leader>p", "\"_dP")

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;")
vim.keymap.set("i", ",,", "<Esc>A,")

-- Quickly clear search highlighting.
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>")

-- Open the current file in the default program (For Mac just `open`)
vim.keymap.set("n", "<Leader>x", ":!xdg-open %<CR><CR>")

-- Move lines up and down
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- ThePrime
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")
vim.keymap.set("n", "<Leader>Y", "\"+Y")

vim.keymap.set("n", "<Leader>d", "\"_d")
vim.keymap.set("v", "<Leader>d", "\"_d")

-- No Q
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux popup -E tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux popup -E tmux-windowizer<CR>")

