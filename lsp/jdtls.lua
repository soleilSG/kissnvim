local workspace_dir = vim.fn.getcwd() .. "/.jdtls"

return {
	cmd = {
		"jdtls",
		"-data",
		workspace_dir,
	},
	filetypes = { "java" },
	root_markers = {
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		".git",
		"mvnw",
		"gradlew",
	},
}
