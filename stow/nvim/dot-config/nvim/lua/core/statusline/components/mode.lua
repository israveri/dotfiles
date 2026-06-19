--- Returns the label and highlight group key for the current editor mode
--- @return { name: string, hl: string }
return function()
    local unknown_mode = { name = "UNKNOWN", hl = "Normal" }
    local modes = {
        -- \19 = ^S (S-BLOCK), \22 = ^V (V-BLOCK)
        ["n"]     = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["no"]    = { name = "OP-PENDING", hl = "StatuslinePending" },
        ["nov"]   = { name = "OP-PENDING", hl = "StatuslinePending" },
        ["noV"]   = { name = "OP-PENDING", hl = "StatuslinePending" },
        ["no\22"] = { name = "OP-PENDING", hl = "StatuslinePending" },
        ["niI"]   = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["niR"]   = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["niV"]   = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["nt"]    = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["ntT"]   = { name = "NORMAL",     hl = "StatuslineNormal" },
        ["v"]     = { name = "VISUAL",     hl = "StatuslineVisual"  },
        ["vs"]    = { name = "VISUAL",     hl = "StatuslineVisual"  },
        ["V"]     = { name = "V-LINE",     hl = "StatuslineVisual"  },
        ["Vs"]    = { name = "V-LINE",     hl = "StatuslineVisual"  },
        ["\22"]   = { name = "V-BLOCK",    hl = "StatuslineVisual"  },
        ["\22s"]  = { name = "V-BLOCK",    hl = "StatuslineVisual"  },
        ["s"]     = { name = "SELECT",     hl = "StatuslineInsert"  },
        ["S"]     = { name = "S-LINE",     hl = "StatuslineNormal"  },
        ["\19"]   = { name = "S-BLOCK",    hl = "StatuslineNormal"  },
        ["i"]     = { name = "INSERT",     hl = "StatuslineInsert"  },
        ["ic"]    = { name = "INSERT",     hl = "StatuslineInsert"  },
        ["ix"]    = { name = "INSERT",     hl = "StatuslineInsert"  },
        ["R"]     = { name = "REPLACE",    hl = "StatuslineReplace" },
        ["Rc"]    = { name = "REPLACE",    hl = "StatuslineReplace" },
        ["Rx"]    = { name = "REPLACE",    hl = "StatuslineReplace" },
        ["Rv"]    = { name = "V-REPLACE",  hl = "StatuslineReplace" },
        ["Rvc"]   = { name = "V-REPLACE",  hl = "StatuslineReplace" },
        ["Rvx"]   = { name = "V-REPLACE",  hl = "StatuslineReplace" },
        ["c"]     = { name = "COMMAND",    hl = "StatuslineCommand" },
        ["cv"]    = { name = "EX",         hl = "StatuslineCommand" },
        ["ce"]    = { name = "EX",         hl = "StatuslineCommand" },
        ["r"]     = { name = "REPLACE",    hl = "StatuslineNormal"  },
        ["rm"]    = { name = "MORE",       hl = "StatuslineNormal"  },
        ["r?"]    = { name = "CONFIRM",    hl = "StatuslineNormal"  },
        ["!"]     = { name = "SHELL",      hl = "StatuslineNormal"  },
        ["t"]     = { name = "TERMINAL",   hl = "StatuslineCommand" },
    }

    return modes[vim.fn.mode()] or unknown_mode
end
