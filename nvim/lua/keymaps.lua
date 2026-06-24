-- Remap navigation keys to be in same physical place on the keyboard when using Colemak
vim.keymap.set({ "n", "x", "o" }, "n", "j", { desc = "move down" })
vim.keymap.set({ "n", "x", "o" }, "e", "k", { desc = "move up" })
vim.keymap.set({ "n", "x" },      "i", "l", { desc = "move right" })
vim.keymap.set({ "n" },           "l", "i", { desc = "insert before cursor" })
vim.keymap.set({ "n", "x", "o" }, "j", "e", { desc = "end of word fwd" })
vim.keymap.set({ "n", "x", "o" }, "k", "n", { desc = "repeat search" })
