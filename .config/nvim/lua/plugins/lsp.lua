return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/lazydev.nvim',
      ft = 'lua',       -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'saghen/blink.cmp',
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('mason').setup { capabilities = capabilities }
      require('mason-lspconfig').setup({
        ensure_installed = {
          'ts_ls',
          'lua_ls',
          'laravel_ls',
          'gopls',
          'pylsp',
          'svelte',
        }
      })
      require('lspconfig').ts_ls.setup {
        filetypes = { 'typescript', 'typescriptreact' }
      }
      vim.diagnostic.config({
        virtual_text = true,         -- enables inline messages
        signs = true,                -- keep the W/E in the gutter
        severity_sort = true,
        underline = true,            -- optionally underline the code with issues
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
