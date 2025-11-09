return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true, -- Start suggestion automatically
        keymap = {
          accept = "<C-f>", -- Use <C-f> (Control + f) to accept the inline suggestion
          next = "<C-]>",  -- Key to cycle next suggestion
          prev = "<M-[>",  -- Key to cycle previous suggestion
          dismiss = "<C-j>",
        },
      },
      panel = {
        enabled = true, -- Enable the Copilot panel (optional)
      },
    })

    -- Optional: If you want to use the official GitHub Copilot plugin instead,
    -- replace the above with:
    -- require("lazy").load { plugins = { "github/copilot.vim" } }
    -- vim.g.copilot_no_tab_map = true -- Use official plugin, but disable its <Tab> map
  end,
}
