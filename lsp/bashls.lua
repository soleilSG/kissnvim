return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	-- Optional: Define root markers to help the server identify project roots
	root_markers = { ".git" },
	-- Optional: Add specific settings for the server
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
}
