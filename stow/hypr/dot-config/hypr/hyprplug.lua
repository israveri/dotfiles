local M = {}

local default_plugs_directory = os.getenv("HOME") .. "/.config/hypr/plugs"

local function resolve_source(source)
    if source.path then
        return pcall(require, source.path)
    end

    -- Someday maybe source can be github, gitlab, etc

    return false, "Unknown source type"
end

function M.load(plugs_directory)
    plugs_directory = plugs_directory or default_plugs_directory

    local handle = io.popen("ls " .. plugs_directory .. "/*.lua 2>/dev/null")
    if not handle then return end

    for file in handle:lines() do
        local result, spec = pcall(dofile, file)

        if result and spec and spec.source then
            local result, plug = resolve_source(spec.source)

            if result then
                if spec.config then spec.config(plug) end
                if spec.setup then spec.setup(plug) end
            end
        end
    end

    handle:close()
end

return M
