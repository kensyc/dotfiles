vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

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
