return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (supported parsers)
            ensure_installed = { "lua", "vim", "vimdoc", "javascript", "python", "c" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                enable = true,

                -- Or use a function for more flexibility
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
