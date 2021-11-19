use {'mhartington/formatter.nvim', config = function() 
	 require('formatter').setup {
		 -- TODO: use formatprg program
		 -- vim.g.formatexpr = Format
		 filetype = {
			 lua = {
				 -- luafmt
				 function()
					 return {
						 exe = "luafmt",
						 args = {"--indent-count", 2, "--stdin"},
						 stdin = true
					 }
				 end
			 },
			 terraform = {
				 function()
					 return {
						 exe = "terraform",
						 args = { "fmt", "-" },
						 stdin = true
					 }
				 end
			 },
			 python = {
				 function()
					 return {
						 exe = "python3 -m autopep8",
						 args = {
							 "--in-place --aggressive --aggressive",
							 vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
						 },
						 stdin = false
					 }
				 end
			 }
		 }
	 }
	 vim.api.nvim_set_keymap('n', 'gq', ':Format<CR>', { noremap = true } )
 end
 }
