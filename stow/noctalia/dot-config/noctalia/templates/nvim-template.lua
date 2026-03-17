local M = {}

-- Helper function to find if colorschme is "ligh" or "dark" mode
local function bg_mode()
    local hex = '{{colors.surface.default.hex}}'

    local rgb = hex:gsub("#", "")
    local r = tonumber(rgb:sub(1, 2), 16)
    local g = tonumber(rgb:sub(3, 4), 16)
    local b = tonumber(rgb:sub(5, 6), 16)

    -- HSP Perceived Brightness formula
    local brightness = math.sqrt(0.299 * r^2 + 0.587 * g^2 + 0.114 * b^2)
    if brightness > 127 then
	return "light"
    else
	return "dark"
    end
end

function M.setup()
    vim.o.background = bg_mode()

    -- print("Noctalia: Detected " .. bg_mode() .. " mode")

    require('base16-colorscheme').setup {
	-- Background tones
	base00 = '{{colors.surface.default.hex}}',	-- Default Background
	base01 = '{{colors.surface_container.default.hex}}',	-- Lighter Background (status bars)
	base02 = '{{colors.surface_container_high.default.hex}}',	-- Selection Background
	base03 = '{{colors.outline.default.hex}}',	-- Comments, Invisibles

	-- Foreground tones
	base04 = '{{colors.on_surface_variant.default.hex}}',	-- Dark Foreground (status bars)
	base05 = '{{colors.on_surface.default.hex}}',	-- Default Foreground
	base06 = '{{colors.on_surface.default.hex}}',	-- Light Foreground
	base07 = '{{colors.on_background.default.hex}}',	-- Lightest Foreground

	-- Accent colors
	base08 = '{{colors.error.default.hex}}',	-- Variables, XML Tags, Errors
	base09 = '{{colors.tertiary.default.hex}}',	-- Integers, Constants
	base0A = '{{colors.secondary.default.hex}}',	-- Classes, Search Background
	base0B = '{{colors.primary.default.hex}}',	-- Strings, Diff Inserted
	base0C = '{{colors.tertiary_fixed_dim.default.hex}}',	-- Regex, Escape Chars
	base0D = '{{colors.primary_fixed_dim.default.hex}}',	-- Functions, Methods
	base0E = '{{colors.secondary_fixed_dim.default.hex}}',	-- Keywords, Storage
	base0F = '{{colors.error_container.default.hex}}',	-- Deprecated, Embedded Tags
    }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
    'sigusr1',
    vim.schedule_wrap(function()
	package.loaded['colors.noctalia'] = nil
	require('colors.noctalia').setup()
    end)
)

return M
