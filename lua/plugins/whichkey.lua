return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show()
			end,
			desc = "Show all keymaps (which-key)",
		},
	},
	opts = {
		preset = "modern"
	},
}
