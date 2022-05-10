-- vim.g.gutentags_cache_dir = "~/.cache/gutentags"
vim.g.gutentags_cache_dir = os.getenv('XDG_CACHE_HOME') .. '/gutentags'

vim.g.gutentags_add_default_project_roots = false
vim.g.gutentags_project_root = {'package.json', '.git', 'composer.json'}

vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true

vim.g.gutentags_ctags_extra_args = {
    '--tag-relative=yes',
    '--fields=+ailmnS',
}

vim.api.nvim_create_user_command(
    'GutenTagsClearCache',
    function ()
        if os.remove(os.getenv('XDG_CACHE_HOME') .. '/gutentags/*') == 0 then
            print('Cleared cache')
        else
            print('Could not clear cache')
        end
    end,
    { nargs = 0 }
)

vim.g.gutentags_ctags_exclude = {
    '*.git', '*.svg', '*.hg',
    '*/tests/*',
    'build',
    'dist',
    '*sites/*/files/*',
    'bin',
    'node_modules',
    'bower_components',
    'cache',
    'compiled',
    'docs',
    'example',
    'bundle',
    'vendor',
    '*.md',
    '*-lock.json',
    '*.lock',
    '*bundle*.js',
    '*build*.js',
    '.*rc*',
    '*.json',
    '*.min.*',
    '*.map',
    '*.bak',
    '*.zip',
    '*.pyc',
    '*.class',
    '*.sln',
    '*.Master',
    '*.csproj',
    '*.tmp',
    '*.csproj.user',
    '*.cache',
    '*.pdb',
    'tags*',
    'cscope.*',
    '*.css',
    '*.less',
    '*.scss',
    '*.exe', '*.dll',
    '*.mp3', '*.ogg', '*.flac',
    '*.swp', '*.swo',
    '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
    '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
    '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
}
