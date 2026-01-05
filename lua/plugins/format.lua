return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			c = { "clang-format" },
			rust = { "rustfmt" }
		},
	},
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
}
