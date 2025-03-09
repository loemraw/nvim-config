return {
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		opts = {
			servers = {
				lua_ls = {},
				pyright = {},
				clangd = {},
				rust_analyzer = {},
			},
		},
		config = function(_, opts)
			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local o = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", o)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", o)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", o)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", o)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", o)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", o)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", o)
					vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", o)
					vim.keymap.set({ "n", "v" }, "fb", '<cmd>lua require("conform").format()<cr>', o)
					vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", o)
				end,
			})

			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				require("lspconfig")[server].setup(config)
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
}
