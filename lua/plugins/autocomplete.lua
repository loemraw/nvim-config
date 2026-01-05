return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-d>"] = { "scroll_documentation_down" },
			["<C-u>"] = { "scroll_documentation_up" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			list = {
				selection = {
					preselect = false,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
