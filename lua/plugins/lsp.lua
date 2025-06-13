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
				clangd = {},
				bashls = {},
				pyrefly = {},
				rust_analyzer = {},
			},
		},
		config = function(_, opts)
			require("meta.lsp")
			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local o = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", o)
					vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", o)
					vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", o)
					vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", o)
					vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", o)
					vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", o)
					vim.keymap.set("n", "gL", "<cmd>FzfLua lsp_document_diagnostics<cr>", o)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", o)
					vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", o)
					vim.keymap.set({ "n", "v" }, "<leader>fb", '<cmd>lua require("conform").format()<cr>', o)
					vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", o)
				end,
			})

			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.enable(server);
				vim.lsp.config(server, config);
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua-language-server",
				"shellcheck",
				"pyrefly",
				"stylua"
			}
		}
	}
}
