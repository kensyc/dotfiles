local jdtls = require('jdtls');
local state_dir = os.getenv('XDG_DATA_HOME')
local root_dir = require('jdtls.setup').find_root({'mvnw', 'gradlew', 'pom.xml'})
local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', state_dir .. '/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', state_dir .. '/nvim/mason/packages/jdtls/config_linux',
    '-data', state_dir .. "/java-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  },
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = {},
    extendedClientCapabilities = extendedClientCapabilities
  },
  -- capabilities = require('config.keymaps').capabilities,
  on_attach = require('config.keymaps').on_attach,
}

jdtls.start_or_attach(config);
