local M = {}

function M.require(mod)
    local ok, ret = M.try(require, mod)
    return ok and ret
end

function M.try(fn, ...)
    local args = { ... }

    return xpcall(function()
        return fn(unpack(args))
    end, function(err)
            local lines = {}
            table.insert(lines, err)
            table.insert(lines, debug.traceback("", 3))

            M.error(table.concat(lines, "\n"))
            return err
        end)
end

function M.markdown(msg, opts)
    opts = vim.tbl_deep_extend("force", {
        title = "Debug",
        on_open = function(win)
            vim.wo[win].conceallevel = 3
            vim.wo[win].concealcursor = ""
            vim.wo[win].spell = false
            local buf = vim.api.nvim_win_get_buf(win)
            vim.treesitter.start(buf, "markdown")
        end,
    }, opts or {})
    require("notify").notify(msg, vim.log.levels.INFO, opts)
end

function M.exists(fname)
    local stat = vim.loop.fs_stat(fname)
    return (stat and stat.type) or false
end

function M.fqn(fname)
    fname = vim.fn.fnamemodify(fname, ":p")
    return vim.loop.fs_realpath(fname) or fname
end

function M.debounce(ms, fn)
    local timer = vim.loop.new_timer()
    return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
        end)
    end
end

function M.throttle(ms, fn)
    local timer = vim.loop.new_timer()
    local running = false
    return function(...)
        if not running then
            local argv = { ... }
            local argc = select("#", ...)

            timer:start(ms, 0, function()
                running = false
                pcall(vim.schedule_wrap(fn), unpack(argv, 1, argc))
            end)
            running = true
        end
    end
end

---@return string
function M.get_root()
    local path = vim.loop.fs_realpath(vim.api.nvim_buf_get_name(0))
    ---@type string[]
    local roots = {}
    if path ~= "" then
        for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            local workspace = client.config.workspace_folders
            local paths = workspace and vim.tbl_map(function(ws)
                return vim.uri_to_fname(ws.uri)
            end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
            for _, p in ipairs(paths) do
                local r = vim.loop.fs_realpath(p)
                if path:find(r, 1, true) then
                    roots[#roots + 1] = r
                end
            end
        end
    end
    ---@type string?
    local root = roots[1]
    if not root then
        path = path == "" and vim.loop.cwd() or vim.fs.dirname(path)
        ---@type string?
        root = vim.fs.find({ ".git" }, { path = path, upward = true })[1]
        root = root and vim.fs.dirname(root) or vim.loop.cwd()
    end
    ---@cast root string
    return root
end

return M
