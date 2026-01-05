-- LSP configuration using Neovim 0.11 built-in features

-- Enable sign column for diagnostics
vim.opt.signcolumn = "yes"

-- LSP servers to enable (must be installed manually)
local servers = {
	"lua_ls",
	"clangd",
	"bashls",
	"pyrefly",
	"rust_analyzer",
}

-- Set up keybinds when LSP attaches to buffer
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- LSP actions
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "gL", "<cmd>FzfLua lsp_document_diagnostics<cr>", opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
	end,
})

-- Function to set up LSP servers (called after blink.cmp is loaded)
local function setup_lsp()
	-- Get completion capabilities from blink.cmp
	local ok, blink = pcall(require, "blink.cmp")
	local capabilities = ok and blink.get_lsp_capabilities() or nil

	-- Enable and configure each language server
	for _, server in ipairs(servers) do
		vim.lsp.enable(server)
		vim.lsp.config(server, {
			capabilities = capabilities,
		})
	end
end

-- Set up LSP after plugins are loaded
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyDone",
	callback = setup_lsp,
	once = true,
})
