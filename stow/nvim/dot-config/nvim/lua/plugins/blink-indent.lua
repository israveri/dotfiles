return {
    "saghen/blink.indent",
    opts = {
        static = {
            enabled = true,
            char = '▎',
            whitespace_char = nil,
            priority = 1,
            highlights = { 'BlinkIndent' },
        },

        scope = {
            enabled = true,
            indent_at_cursor = true,
            char = '▎',
            priority = 1000,
            highlights = { 'BlinkIndentViolet', 'BlinkIndentCyan', 'BlinkIndentBlue', 'BlinkIndentGreen', 'BlinkIndentYellow', 'BlinkIndentOrange', 'BlinkIndentRed' },

            underline = {
                enabled = true,
                highlights = { 'BlinkIndentVioletUnderline', 'BlinkIndentCyanUnderline', 'BlinkIndentBlueUnderline', 'BlinkIndentGreenUnderline', 'BlinkIndentYellowUnderline', 'BlinkIndentOrangeUnderline', 'BlinkIndentRedUnderline' }
            },
        },
    },
}
