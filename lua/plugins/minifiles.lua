return {
	"echasnovski/mini.files",
	opts = {
		windows = {
			preview = false,
		},
		options = {
			use_as_default_explorer = true,
		},
	},
	keys = {
		{
			"<leader>ft",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = "Open mini.files (Directory of Current File)",
		},
		{
			"<leader>fT",
			function()
				require("mini.files").open(vim.uv.cwd(), true)
			end,
			desc = "Open mini.files (cwd)",
		},
	},
}
