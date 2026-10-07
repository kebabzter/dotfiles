return {
    { -- Git plugin
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },
    -- {
    --     'richwomanbtc/overleaf.nvim',
    --       config = function()
    --           require('overleaf').setup({
    --         env_file = '.env',
    --         sync_dir = '~/.overleaf',
    --       })
    --       end,
    --       build = 'cd node && npm install',
    -- },
    {
      'brenoprata10/nvim-highlight-colors',
      config = function()
        require('nvim-highlight-colors').setup({})
      end
    },
    {
        'ThePrimeagen/vim-be-good',
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    {
        "jalvesaq/zotcite",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            require("zotcite").setup({
                -- your options here (see doc/zotcite.txt)
            })
        end
    },
    {
          "lervag/vimtex",
          lazy = false,     -- we don't want to lazy load VimTeX
          -- tag = "v2.15", -- uncomment to pin to a specific release
          init = function()
            -- VimTeX configuration goes here, e.g.
              vim.g.vimtex_view_method = "zathura"
          end
    }
}
