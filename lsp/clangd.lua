return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=google",
		-- "--query-driver=/opt/homebrew/opt/llvm/bin/clang++",
	},
	filetypes = { "c", "cpp" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		".git",
	},
	single_file_support = true,
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
}
