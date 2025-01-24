vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = ""

vim.cmd([[set shortmess=A]])

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

-- splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<c-h>", "<c-w>h<CR>")
vim.keymap.set("n", "<c-j>", "<c-w>j<CR>")
vim.keymap.set("n", "<c-k>", "<c-w>k<CR>")
vim.keymap.set("n", "<c-l>", "<c-w>l<CR>")
