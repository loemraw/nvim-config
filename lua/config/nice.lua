vim.opt.relativenumber = true -- Show line numbers relative to cursor position
vim.opt.number = true -- Show absolute line number on cursor line (hybrid mode with relativenumber)
vim.opt.tabstop = 4 -- Number of spaces a tab character displays as
vim.opt.shiftwidth = 4 -- Number of spaces to use for each indentation level
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the terminal
vim.opt.splitright = true -- Open vertical splits to the right of current window
vim.opt.splitbelow = true -- Open horizontal splits below current window
vim.opt.mouse = "" -- Disable mouse support
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.cmd([[set shortmess=A]]) -- Suppress "ATTENTION" message for existing swap files

vim.g.mapleader = " "

-- <leader>c means put stuff in clipboard register
vim.keymap.set({ "n", "v" }, "<leader>c", '"+', { noremap = true, silent = false })

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = paste,
		["*"] = paste,
	},
}

-- jk escape
vim.keymap.set({ "i" }, "jk", "<esc>", { noremap = true, silent = false })

-- Navigate wildmenu with Ctrl-j and Ctrl-k
vim.keymap.set('c', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true, noremap = true})
vim.keymap.set('c', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true, noremap = true})


-- splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<c-h>", "<c-w>h<CR>")
vim.keymap.set("n", "<c-j>", "<c-w>j<CR>")
vim.keymap.set("n", "<c-k>", "<c-w>k<CR>")
vim.keymap.set("n", "<c-l>", "<c-w>l<CR>")
