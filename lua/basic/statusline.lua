local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = " %#CocErrorSign#✘ " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = " %#DiagnosticWarn#▲ " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = " %#DiagnosticHint#◈ " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = " %#DiagnosticInfo#▶ " .. count["info"]
	end

	return errors .. warnings .. hints .. info .. "%#Normal#"
end

function Status_line()
	return table.concat {
		"%=",
		"%l:%L,%c%V",
		"  ",
		"%h",
		"%#DiagnosticWarn#",
		"%m",
		"%#StatusLine#",
		"%r%w%q ",
		"%F ",
		lsp(),
		"  ",
	}
end

vim.o.statusline = "%!luaeval('Status_line()')"
