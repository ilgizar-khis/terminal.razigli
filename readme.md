# my simple plugin for working with the terminal in neovim

## commands
- Terminal -- command to toggle terminal.

## functions
- toggle() -- function to toggle terminal.

## params
- width: number = 160,
- height: number = 40,
- border: string = "single"

## variables
- win: number -- terminal window id.
    - if not nil -> terminal is open.
- buf: number -- terminal buffer id.
    - if not nil -> the terminal has been opened at least once
```lua
vim.api.nvim_create_user_command("TermInfo", function()
	local buf = terminal.buf or "does't exist"
	local win = terminal.win or "does't exist"

	vim.notify("buf: " .. buf .. ", win: " .. win)
end, {})
```


## usage example: vim.pack
```lua
vim.pack.add({
	{
		src = "https://github.com/ilgizar-khis/terminal.razigli.git",
		version = "master"
	}
})

local terminal = require("razigli.terminal")
terminal.setup({
	width = 160,
})

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.keymap.set("n", "tt", terminal.toggle, {noremap = true, silent = true})
```
