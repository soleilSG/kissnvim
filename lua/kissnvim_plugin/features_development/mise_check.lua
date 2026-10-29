--[[
local obj = vim.system({ "mise", "ls" }, { text = false }):wait()
print(obj.code)
print(obj.stdout)
--]]

--[[
local dog = {
	name = "Rex",
	bark = function(self)
		print("Woof! My name is " .. self.name)
	end,
}

local dog1 = {
	name = "Bizar",
}

dog.bark(dog1)
--]]

function check_mise_tools()
	local obj = vim.system({ "mise", "ls" }, { text = true }):wait()

	if obj.code ~= 0 then
		vim.notify("Failed to run 'mise ls'. Is mise installed and in your PATH?", vim.log.levels.ERROR)
		return
	end

	local has_bun = false
	local has_stylua = false

	for line in string.gmatch(obj.stdout, "[^\r\n]+") do
		if string.match(line, "^bun%s") then
			has_bun = true
		elseif string.match(line, "^stylua%s") then
			has_stylua = true
		end
	end

	local results = {}
	table.insert(results, "Mise Tool Check:")
	table.insert(results, (has_bun and "  [✓] bun is installed" or "  [ ] bun is MISSING"))
	table.insert(results, (has_stylua and "  [✓] stylua is installed" or "  [ ] stylua is MISSING"))

	vim.notify(table.concat(results, "\n"), vim.log.levels.INFO)
end
