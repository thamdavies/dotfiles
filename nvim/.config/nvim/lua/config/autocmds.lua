vim.cmd([[autocmd BufEnter * set formatoptions-=o]])
vim.cmd("autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd ColorScheme * highlight NormalFloat guibg=NONE ctermbg=NONE") -- for floating windows
vim.cmd [[set completeopt+=menuone,noselect,popup]]

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'svelte', 'markdown', 'lua', 'rust', 'typst', 'typescript', 'javascript', 'c', 'cpp', 'glsl', 'zig', 'python', 'ruby' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.jsx,*.tsx",
  group = vim.api.nvim_create_augroup("TS", { clear = true }),
  callback = function()
    vim.cmd([[set filetype=typescriptreact]])
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
