M._git_branch_cache = {}

--- Resolves the git branch for given buffer and stores it in cache
--- @param bufid integer The buffer id
local function update_git_branch_cache(bufid)
    local filepath = vim.api.nvim_buf_get_name(bufid)
    if filepath == "" then
        M._git_branch_cache[bufid] = nil
        return
    end

    local dir = vim.fn.fnamemodify(filepath, ":h")
    local branch = vim.trim(vim.fn.system(string.format(
        "git -C %q branch --show-current 2>/dev/null", dir
    )))

    if branch ~= "" then
        M._git_branch_cache[bufid] = string.format("%s", branch)
    else
        M._git_branch_cache[bufid] = nil
    end
end


--- Returns the current git branch for given buffer
--- @param bufid integer The buffer id
--- @return string|nil
local function gitbranch(bufid)
    local branch = M._git_branch_cache[bufid]

    if branch == nil then
        return "_"
    else
        return M.icon.git.branch .. branch
    end

end

return gitbranch()
