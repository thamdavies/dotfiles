local map = vim.keymap.set

vim.g.mapleader = " "

-- A function to move selected lines down in visual mode
function move_lines_down_visual()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local last_line = vim.api.nvim_buf_line_count(0)

	local selected_lines_count = vim.fn.line("'>") - vim.fn.line("'<")

	if current_line + selected_lines_count < last_line then
		vim.api.nvim_command("'<, '>m '>+1")
		vim.api.nvim_command("normal! gv=gv")
	-- When we hit the bottom we just reselect the lines
	else
		vim.api.nvim_command("normal! gv")
	end
end

-- A function to move selected lines up in visual mode
function move_lines_up_visual()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]

	if current_line > 1 then
		vim.api.nvim_command("'<, '>m '<-2")
		vim.api.nvim_command("normal! gv=gv")
	-- When we hit the top we just reselect the lines
	else
		vim.api.nvim_command("normal! gv")
	end
end

map("v", "K", ":lua move_lines_up_visual()<CR>")
map("v", "J", ":lua move_lines_down_visual()<CR>")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("i", "jk", "<Esc>")

map("n", "<leader>bf", vim.lsp.buf.format)

map("n", "[k", "<cmd>cnext<CR>zz")
map("n", "[j", "<cmd>cprev<CR>zz")
map("n", "[n", "<cmd>bnext<CR>zz")
map("n", "[p", "<cmd>bprev<CR>zz")
map("n", "<C-h>", "<C-w>h<CR>zz")
map("n", "<C-l>", "<C-w>l<CR>zz")
map("n", "<C-j>", "<C-w>j<CR>zz")
map("n", "<C-k>", "<C-w>k<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace a selected word
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

map("n", "<C-s>", "ggVG", { desc = "Select all lines" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope Find all files" }
)
