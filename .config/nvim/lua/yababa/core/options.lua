vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search,  assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.winblend = 0 -- transparency of window
opt.pumblend = 0 -- transparency of the pop-up menu
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign colum so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- for c++
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.cpp" },
  callback = function()
    vim.api.nvim_buf_set_option(0, 'tabstop', 2)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.cpp" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "*.cpp" },
  callback = function()
    print("Template is being inserted.")
    vim.cmd("0r /home/nakario/.config/nvim/templates/template.cpp")
  end,
})

function _run_cpp_file()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")
  local cmd = string.format("g++ %s -o %s && %s", file, output, output)
  vim.cmd(":TermExec cmd='" .. cmd .. "'")
end

