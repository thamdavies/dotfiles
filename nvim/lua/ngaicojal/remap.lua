local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>")
map("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

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
map("n", "bn", "<cmd>bnext<CR>zz")
map("n", "bp", "<cmd>bprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

map("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope Find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>gcm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gst", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>ct", "<cmd>CloakToggle<CR>", { desc = "Cloak toggle" })
map("n", "<C-s>", "ggVG", { desc = "Select all lines" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)

map("n", "<leader>gbl", "<cmd>Git blame<CR>")
map("n", "<leader>ecm", function()
  local message = vim.fn.input('Enter commit message: ')
  vim.cmd('Git commit -m "' .. message .. '"')
end)

vim.api.nvim_set_keymap('n', '<F5>', ":lua require('dap').continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ":lua require('dap').step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ":lua require('dap').step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ":lua require('dap').terminate()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require('dap').repl.open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>du', ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })

