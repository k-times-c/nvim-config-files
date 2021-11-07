require('packer').use{"justinmk/vim-dirvish", config = function ()
	vim.cmd([[call dirvish#add_icon_fn({p -> p[-1:]=='/'?'📂':'📄'}]])
end}
