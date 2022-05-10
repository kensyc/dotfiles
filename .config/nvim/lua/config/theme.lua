require('catppuccin').setup({
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        }
    }
})
vim.cmd[[colorscheme catppuccin]]
