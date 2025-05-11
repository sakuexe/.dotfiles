return {
    "mbbill/undotree",

    config = function() 
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
      -- backup files / persistent undo tree
      vim.opt.swapfile = false
      vim.opt.backup = false
      vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/vim/undodir"
      vim.opt.undofile = true
    end
}
