local jdtls_install_location = os.getenv("jdtls_install_location")
local function getSYSTEM()
    if vim.fn.has('linux') == 1 then
        return 'linux'
    elseif vim.fn.has('mac') == 1 then
        return 'mac'
    else
        return 'win'
    end
end
local SYSTEM = getSYSTEM()
local workspace_root = os.getenv("workspace_root")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_root .. project_name
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)
local config = {
    capabilities = capabilities,
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob(jdtls_install_location .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', jdtls_install_location .. '/config_' .. SYSTEM,
        '-data', workspace_dir,
    },
    root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
    settings = {
        java = {
        }
    },
    init_options = {
        bundles = {}
    },
}
require('jdtls').start_or_attach(config)
