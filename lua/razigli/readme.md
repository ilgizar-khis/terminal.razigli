# my simple plugin for working with the terminal in neovim

## commands
- Terminal - command to toggle terminal.

## functions
- toggle() -- function to toggle terminal.

## params
- width: number = 160,
- height: number = 40,
- border: string = "single"

## usage example: vim.pack
```lua
vim.pack.add({
	{
		src = "https://github.com/ilgizar-khis/terminal.razigli.git",
		version = "master"
	}
})

local terminal = require("razigli.terminal")
terminal.setup()

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.keymap.set("n", "tt", terminal.toggle, {noremap = true, silent = true})
```
