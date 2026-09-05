return {
   -- {
   --     'rose-pine/nvim',
   --     config = function()
   --         vim.cmd.colorscheme "rose-pine"
   --     end
   -- },
   {
      "uhs-robert/oasis.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("oasis").setup({
      style = "mirage",})      -- (see Configuration below for all customization options)
        vim.cmd.colorscheme("oasis")  -- After setup, apply theme (or any style like "oasis-night")
      end
   },
   -- {
   --    "ellisonleao/gruvbox.nvim",
   --    priority = 1000 ,
   --     config = function()
   --         vim.cmd.colorscheme "gruvbox"
   --     end
   -- },
   {
       'nvim-lualine/lualine.nvim',
       dependencies = {
           "nvim-tree/nvim-web-devicons",
       },
       opts = {
           theme = 'oasis',
       }
   }
}
