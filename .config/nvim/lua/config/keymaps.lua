-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Paste without yanking
vim.keymap.set('v', '<leader>p', '"_dP')

-- TODO: nohl keymap
--

-- Files tree keymaps
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>')
vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFile<CR>')

-- Switch buffers
vim.keymap.set('n', '<leader>j', '<C-W><C-J>')
vim.keymap.set('n', '<leader>k', '<C-W><C-K>')
vim.keymap.set('n', '<leader>l', '<C-W><C-L>')
vim.keymap.set('n', '<leader>h', '<C-W><C-H>')

vim.keymap.set('n', '<C-H>', '<cmd>tabprev<CR>')
vim.keymap.set('n', '<C-L>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>tabclose<CR>')
vim.keymap.set('n', '<C-K>', '<cmd>+tabm<CR>') -- todo: add ability to position (tabm +{i})
vim.keymap.set('n', '<C-J>', '<cmd>-tabm<CR>')

-- Treesitter keymaps
local treesitter_keymaps = {
    init_selection = 'gnn',
    node_incremental = 'grn',
    scope_incremental = 'grc',
    node_decremental = 'grm',
}

local telescope_mappings = {
    i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
    },
}

-- Telescope
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
    require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
    require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>f', '<cmd>Telescope file_browser<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- LSP
local on_attach = function(_, bufnr)
    local buffopts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', buffopts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', buffopts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', buffopts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', buffopts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', buffopts)
    vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', buffopts)
    vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', buffopts)
    vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', buffopts)
    vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', buffopts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', buffopts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', buffopts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', buffopts)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, buffopts)
    vim.keymap.set('n', '<leader>sl', require('telescope.builtin').diagnostics, buffopts)
    vim.keymap.set('n', '<leader>t', '<cmd>lua vim.lsp.buf.formatting()<CR>', buffopts)
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_keys = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-j>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' })
}

return {
    on_attach = on_attach,
    cmp_keys = cmp_keys,
    telescope_mappings = telescope_mappings,
    treesitter_keymaps = treesitter_keymaps
}
