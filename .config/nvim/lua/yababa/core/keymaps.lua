vim.g.mapleader = " "

local keymap = vim.keymap -- fore conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Exit terminal mode with ESC" })

-- increment/decrement numbers
keymap.set("n", "<leader>j", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>k", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- open previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab

-- toggleterm
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Open/Close the terminal" }) -- open the terminal

-- cpp run
keymap.set("n", "<leader>r", _run_cpp_file, { desc = "Complie and Run C++ file", noremap = true, silent = true })

