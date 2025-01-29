return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
			-- C/C++
      c = { "clang_format" },
      cpp = { "clang_format" },

      -- Javascript
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
    },
    format_on_save = false,
  },
  keys = {
    {
      "<leader>fc",
      function()
        require("conform").format()
      end,
      desc = "Format with clang-format",
    },
  },
}
