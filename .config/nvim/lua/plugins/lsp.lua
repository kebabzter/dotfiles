return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/lazydev.nvim',
            ft = 'lua', -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup {}
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',
                    'lua_ls',
                    'laravel_ls',
                    'gopls',
                }
            })

            vim.diagnostic.config({
                virtual_text = true,  -- enables inline messages
                signs = true,         -- keep the W/E in the gutter
                severity_sort = true,
                underline = true,     -- optionally underline the code with issues
                update_in_insert = false,
                float = {
                    style = 'minimal',
                    border = 'rounded',
                    header = '',
                    prefix = '',
                },
            })
        end,
    }
}

