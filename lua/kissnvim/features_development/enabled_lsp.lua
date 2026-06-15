-- Lists configurations currently enabled by the user
local enabled_configs = vim.lsp._enabled_configs

for name, _ in pairs(enabled_configs) do
	print(name)
end
