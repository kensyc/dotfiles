require("nvim-lsp-installer").setup {
    automatic_installation = false
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    intelephense = {},
    bashls = {},
    pyright = {},
    efm = {
        init_options = {documentFormatting = true},
        settings = {
            rootMarkers = {'.git/'},
            languages = {
                python = {
                    {formatCommand = 'black --fast -', formatStdin = true}
                }
            }
        },
        root_dir = require('lspconfig').util.root_pattern {'.git/', '.'},
        filetypes = {'python'},
        single_file_support = true,
    },
    dockerls = {}
}

local on_attach = require('config.keymaps').on_attach
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, settings in pairs(servers) do
    settings.on_attach = on_attach
    settings.capabilities = capabilities

  require('lspconfig')[server].setup(settings)
end

return servers
