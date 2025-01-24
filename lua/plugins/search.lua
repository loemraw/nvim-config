return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	opts = function()
		local fzf = require("fzf-lua")
		local config = fzf.config
		local actions = fzf.actions

		config.defaults.keymap.fzf["ctrl-u"] = "preview-page-up"
		config.defaults.keymap.fzf["ctrl-d"] = "preview-page-down"

		return {
			files = {
				cwd_prompt = false,
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},

		}
	end,
	keys = {
		{ "<leader>fo", "<cmd>FzfLua<cr>",       desc = "FzfLua builtins" },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
		{ "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Search files" },
	},
}
