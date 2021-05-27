local M = {}
local buf_state = require('bufferline.state')
local tree = require('nvim-tree')
local tree_view = require('nvim-tree.view')

function M.open()
   buf_state.set_offset(31)
   tree.find_file(true)
end

function M.close()
   buf_state.set_offset(0)
   tree.close()
end

function M.toggle()
	if tree_view.win_open() then
		M.close()
	else
		M.open()
	end
end

return M
