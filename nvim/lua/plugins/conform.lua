return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" }
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
