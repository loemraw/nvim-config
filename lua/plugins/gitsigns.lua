return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local opts = { buffer = bufnr }

			-- Navigation
			vim.keymap.set("n", "<leader>hn", gitsigns.next_hunk, opts)
			vim.keymap.set("n", "<leader>hp", gitsigns.prev_hunk, opts)

			-- Actions
			vim.keymap.set("n", "<leader>hP", gitsigns.preview_hunk, opts)
			vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, opts)
			vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, opts)
			vim.keymap.set("v", "<leader>hr", function() gitsigns.reset_hunk({vim.fn.line("."), vim.fn.line("v")}) end, opts)
		end,
	},
}
