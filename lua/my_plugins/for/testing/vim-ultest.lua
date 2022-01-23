use { "rcarriga/vim-ultest", opt = true,
  requires = "vim-test/vim-test",
  -- run = ":UpdateRemotePlugins",
  config = function()
    vim.g.ultest_use_pty = 1
    vim.g['test#python#pytest#options'] = "--color=yes"
    require('ultest').setup({
  })
  end
}
