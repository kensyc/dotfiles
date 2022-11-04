nvim_lsp = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = require("config.keymaps").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities (
    vim.lsp.protocol.make_client_capabilities()
)
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = on_attach,
	}, _config or {})
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("mason-lspconfig").setup_handlers {
    function (server_name)
        nvim_lsp[server_name].setup(config())
    end,
    ["sumneko_lua"] = function ()
        nvim_lsp.sumneko_lua.setup(config({
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = runtime_path,
                    },
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }))
    end,
    ["pyright"] = function ()
        nvim_lsp.pyright.setup(config({
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                },
            },
        }))
    end,
}

local null_ls = require("null-ls")

local sources = {
    -- formatting
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.shfmt,
	null_ls.builtins.formatting.black.with({ extra_args = { "--fast", "--line-length", "79" } }),
	null_ls.builtins.formatting.isort,
	null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.sql_formatter,
    -- null_ls.builtins.formatting.xmlformater,

    -- code actions
    null_ls.builtins.code_actions.gitsigns,

    -- completion
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.completion.spell,

    --diagnostics
-- null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.hadolint,
    -- @todo: add env variable fallback
    null_ls.builtins.diagnostics.mypy.with({ extra_args = { "--cache-dir", os.getenv("XDG_CACHE_HOME") .. "/mypy" } }),
    -- null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.todo_comments,
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "markdown" } }),
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,
    -- null_ls.builtins.diagnostics.twigcs,
    -- null_ls.builtins.diagnostics.curlylint,
    -- null_ls.builtins.diagnostics.luacheck,
    -- null_ls.builtins.diagnostics.php,
    -- null_ls.builtins.diagnostics.psalm,
    -- null_ls.builtins.diagnostics.stylelint,

    -- hover
    -- null_ls.builtins.hover.dictionary,
    null_ls.builtins.hover.printenv,


}

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
