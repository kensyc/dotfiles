require('catppuccin').setup({
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        }
    }
})
vim.g.catppuccin_flavour = "latte"
vim.cmd[[colorscheme catppuccin]]
