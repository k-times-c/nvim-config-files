use { "rcarriga/vim-ultest", 
	requires = "vim-test/vim-test",
	run = ":UpdateRemotePlugins",
	config = function ()
		require('ultest').setup({
		-- vim.cmd( [[ let test#python#pytest#options = "--color=yes" ]])
		vim.cmd("let g:ultest_use_pty = 1"),
		builders = {
			['python#pytest'] = function(cmd)
				-- The command can start with python command directly or an env manager
				local non_modules = {'python', 'pipenv', 'poetry'}
				-- Index of the python module to run the test.
				local module_index = 1
				if vim.tbl_contains(non_modules, cmd[1]) then
					module_index = 3
				end
				local module = cmd[module_index]

				-- Remaining elements are arguments to the module
				local args = vim.list_slice(cmd, module_index + 1)
				return {
					dap = {
						type = 'python',
						request = 'launch',
						module = module,
						args = args
					}
				}
			end
		}
	})
	end
}
