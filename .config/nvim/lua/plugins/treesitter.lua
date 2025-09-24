return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local configs = require('nvim-treesitter.configs')
        configs.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {enable = true},
            autotage = {enable = true},
            ensure_installed = {
                 "c",
                 "cpp",
                 "html",
                 "php",
                 "blade",
                 "javascript",
                 "typescript",
                 "tsx",
                 "lua",
                 "vim",
                 "vimdoc",
                 "query",
                 "markdown",
                 "markdown_inline",
                 "svelte",
                 "yaml",
            },
            auto_install = false,
        })
    end
}
