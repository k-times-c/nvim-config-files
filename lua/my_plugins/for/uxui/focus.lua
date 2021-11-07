use { "beauwilliams/focus.nvim", opt = true, 
	cmd = { "FocusNicely", "FocusToggle", "FocusEnable" },
	config = function() 
	      require("focus").setup() 
		local focusmap = function(direction)
	end
end
}
