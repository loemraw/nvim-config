return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {
		terminal_colors = true,
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.cmd [[colorscheme gruvbox]]
	end
}
