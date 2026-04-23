return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    event = "VeryLazy",
    keys = {
        -- Keymaps for fuzzy search of files
        { "<C-p>", function() require("fzf-lua").files() end, desc = "Search and [f]ind [f]ile" },
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Search and [f]ind [f]ile" },

        -- Other useful keymaps
        { "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "Search and find opened buffers" },
        { "<leader>fl", function() require("fzf-lua").live_grep() end, desc = "Search and [f]ind with [l]ive grep" },
        { "<leader>fg", function() require("fzf-lua").grep() end, desc = "Search and [f]ind with [g]rep" },
        { "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Search and [f]ind in [h]elp docs" },
        { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Search and [f]ind in [k]eymaps" },
        { "<leader>fb", function() require("fzf-lua").builtin() end, desc = "Search and [f]ind [b]uiltin finders" },
        { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Search and [f]ind current [w]ord" },
        { "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Search and [f]ind current [W]ORD" },
        { "<leader>fr", function() require("fzf-lua").resume() end, desc = "Search and [f]ind and [r]esume the search again" },
        { "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "Search and [f]ind [o]ld opened files" },
        { "<leader>/", function() require("fzf-lua").lgrep_curbuf() end, desc = "Search and find in current buffer" },
    },
    opts = {
       winopts = {
           height = 0.95,
           width = 0.90,
           backdrop = 50,

           preview = {
               default = "bat",
               layout = "vertical",
               vertical = "down:80%",
               horizontal = "right:70%",
           },
       },
       files = {
           hidden = true,
           formatter = "path.filename_first",
           fd_opts = [[--color=never --type f --type l --exclude .git --exclude .jj --exclude **/submodules/ --exclude node-modules/]],
           rg_opts = [[--color=never --files -g "!.git" -g "!.jj"]],
       },
       grep = {
           hidden = true,
       },
    },
}
