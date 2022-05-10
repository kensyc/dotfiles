require('telescope').setup {
  defaults = {
    mappings = require('config.keymaps').telescope_mappings,
  },
  extensions = {
      file_browser = {},
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'file_browser'

