return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({ "lua", "vim", "vimdoc", "javascript", "python", "c", "cpp", "rust" })

        -- Enable highlighting for every filetype with a parser, installing
        -- missing parsers on demand (replaces master's auto_install).
        local available = {}
        for _, lang in ipairs(ts.get_available()) do
            available[lang] = true
        end

        -- vim.treesitter.start() turns off regex syntax highlighting, so only
        -- call it when highlight queries exist; otherwise keep regex syntax.
        local function start(buf, lang)
            local ok, query = pcall(vim.treesitter.query.get, lang, "highlights")
            return ok and query ~= nil and pcall(vim.treesitter.start, buf, lang)
        end

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang or start(args.buf, lang) then
                    return
                end
                if available[lang] then
                    ts.install({ lang }):await(vim.schedule_wrap(function()
                        if vim.api.nvim_buf_is_valid(args.buf) then
                            start(args.buf, lang)
                        end
                    end))
                end
            end,
        })
    end
}
