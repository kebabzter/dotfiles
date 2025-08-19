return {
    {
       'rose-pine/nvim',
       config = function()
           vim.cmd.colorscheme "rose-pine"
       end
   },
   {
       'nvim-lualine/lualine.nvim',
       dependencies = {
           "nvim-tree/nvim-web-devicons",
       },
       opts = {
           theme = 'rose-pine',
       }
   }
}
