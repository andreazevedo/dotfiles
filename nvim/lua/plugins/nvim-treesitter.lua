return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({ "lua", "vim", "vimdoc", "javascript", "python", "c", "rust" })

        -- Enable highlighting for every filetype with a parser, installing
        -- missing parsers on demand (replaces master's auto_install).
        local available = {}
        for _, lang in ipairs(ts.get_available()) do
            available[lang] = true
        end

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then
                    return
                end
                if pcall(vim.treesitter.start, args.buf, lang) then
                    return
                end
                if available[lang] then
                    ts.install({ lang }):await(vim.schedule_wrap(function()
                        if vim.api.nvim_buf_is_valid(args.buf) then
                            pcall(vim.treesitter.start, args.buf, lang)
                        end
                    end))
                end
            end,
        })
    end
}
