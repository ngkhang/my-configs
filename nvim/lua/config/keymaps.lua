local keymap = vim.keymap.set

-- Clear search highlight
keymap("n", "<esc>", ":noh<cr>", { desc = "Clear search highlight" })
