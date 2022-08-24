local vanc = vim.api.nvim_command
local vfn = vim.fn
local gotoid = vfn.win_gotoid
local terminal_window = nil
local terminal_buffer = nil
local terminal_job_id = nil
local function terminal_window_size()
    return tonumber(vim.api.nvim_exec("echo &lines", true)) / 4 -- 10 lines
end

local function TerminalOpen()
    if vfn.bufexists(terminal_buffer) == 0 then
        vanc("new terminal | wincmd J | resize " .. terminal_window_size())
        terminal_job_id = vfn.termopen(os.getenv("SHELL"), { detach = 1 })
        vanc("silent file Terminal 1")
        terminal_window = vfn.win_getid()
        terminal_buffer = vfn.bufnr('%')
        vim.opt.buflisted = false
    else
        if gotoid(terminal_window) == 0 then
            vanc("sp | wincmd J | resize " .. terminal_window_size() .. "| buffer Terminal 1")
            terminal_window = vfn.win_getid()
        end
    end
    vim.cmd("startinsert")
end

local function TerminalClose()
    if gotoid(terminal_window) == 1 then
        vanc("hide")
    end
end

function TerminalToggle()
    if gotoid(terminal_window) == 1 then
        TerminalClose()
    else
        TerminalOpen()
    end
end

function TerminalExec(cmd)
    if gotoid(terminal_window) == 0 then
        TerminalOpen()
    end
    vfn.jobsend(terminal_job_id, 'clear\n')
    vfn.jobsend(terminal_job_id, cmd .. '\n')
    vanc("normal! G")
    vanc("wincmd p")
end