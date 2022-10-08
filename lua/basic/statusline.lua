local function modes()
	local getmodes = vim.api.nvim_get_mode().mode
	local modesMap = {
		['n']     = '-- NORMAL --',
		['no']    = '-- O-PENDING --',
		['nov']   = '-- O-PENDING --',
		['noV']   = '-- O-PENDING --',
		['no\22'] = '-- O-PENDING --',
		['niI']   = '-- (insert) --',
		['niR']   = '-- NORMAL --',
		['niV']   = '-- NORMAL --',
		['nt']    = '-- NORMAL --',
		['ntT']   = '-- NORMAL --',
		['v']     = '-- VISUAL --',
		['vs']    = '-- VISUAL --',
		['V']     = '-- V-LINE --',
		['Vs']    = '-- V-LINE --',
		['\22']   = '-- V-BLOCK --',
		['\22s']  = '-- V-BLOCK --',
		['s']     = '-- SELECT --',
		['S']     = '-- S-LINE --',
		['\19']   = '-- S-BLOCK --',
		['i']     = '-- INSERT --',
		['ic']    = '-- INSERT --',
		['ix']    = '-- INSERT --',
		['R']     = '-- REPLACE --',
		['Rc']    = '-- REPLACE --',
		['Rx']    = '-- REPLACE --',
		['Rv']    = '-- V-REPLACE --',
		['Rvc']   = '-- V-REPLACE --',
		['Rvx']   = '-- V-REPLACE --',
		['c']     = '-- COMMAND --',
		['cv']    = '-- EX --',
		['ce']    = '-- EX --',
		['r']     = '-- REPLACE --',
		['rm']    = '-- MORE --',
		['r?']    = '-- CONFIRM --',
		['!']     = '-- SHELL --',
		['t']     = '-- TERMINAL --',
	}

	if modesMap[getmodes] == nil then
		return getmodes
	end

	return modesMap[getmodes]
end

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

	if count["errors"] ~= 0 then errors = " %#DiagnosticError#✘ " .. count["errors"] end
	if count["warnings"] ~= 0 then warnings = " %#DiagnosticWarn#▲ " .. count["warnings"] end
	if count["hints"] ~= 0 then hints = " %#DiagnosticHint#● " .. count["hints"] end
	if count["info"] ~= 0 then info = " %#DiagnosticInfo#▶ " .. count["info"] end

	return errors .. warnings .. hints .. info .. "%#StatusLine#"
end

local function gitstatus()
	-- system("git rev-parse --abbrev-ref HEAD")
	if vim.api.nvim_command("!git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' '") == 0 then
		-- cuse problems
		print("works")
	else
		print("not working")
	end
end

function Status_line()
	return table.concat {
		"%#StatusLine#",
		"  ",
		"%#MoreMsg#",
--		vim.api.nvim_get_mode().mode,
		modes(),
		"%=",
		"%#StatusLine#",
		"  ",
		"%l-%L,%c%V",
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

--vim.o.statusline = "%!luaeval('Status_line()')"
