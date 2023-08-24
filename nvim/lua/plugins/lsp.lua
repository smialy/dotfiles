return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
    config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			"lua_ls",
			"tsserver",
			"jsonls",
			"html",
			"cssls",
			"pyright",
			"yamlls",
		}

		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = servers,
		})

		for _, server in pairs(servers) do
			lspconfig[server].setup({
				autostart = true,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
		end

		local signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "none" })
		end

		local virtual_text_on = {
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
		}

		vim.diagnostic.config({
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			virtual_text = virtual_text_on.virtual_text,
		})

		local diagnostics_active = true
		local diagnostics_virtual_text = true

		local virtual_text_off = {
			virtual_text = false,
		}

		function _G.toggle_diagnostics()
			diagnostics_active = not diagnostics_active
			if diagnostics_active then
				vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
				vim.diagnostic.enable()
			else
				vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
				vim.diagnostic.disable()
			end
		end

		function _G.toggle_diagnostics_virtual_text()
			diagnostics_virtual_text = not diagnostics_virtual_text
			if diagnostics_virtual_text then
				vim.api.nvim_echo({ { "Virtual text ON" } }, false, {})
				vim.diagnostic.config(virtual_text_on)
			else
				vim.api.nvim_echo({ { "Virtual text OFF" } }, false, {})
				vim.diagnostic.config(virtual_text_off)
			end
		end
	end,
}
