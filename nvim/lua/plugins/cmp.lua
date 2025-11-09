return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Core Sources
    "hrsh7th/cmp-nvim-lsp",    -- LSP source
    "hrsh7th/cmp-buffer",     -- Buffer words source
    "hrsh7th/cmp-path",       -- File path source
    "hrsh7th/cmp-cmdline",    -- Cmdline completion

    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Copilot Integration (as discussed previously)
    "zbirenbaum/copilot.lua",
    "zbirenbaum/cmp-copilot",
  },
  config = function()
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Standard nvim-cmp keymaps
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Esc>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          else
            fallback() -- This passes the keypress on to Neovim's default mapping
          end
        end, { 'i', 's' }),

        -- Note: If you configured Copilot to be accepted with <C-f> in its setup,
        -- it won't conflict with any nvim-cmp keymaps.
      }),
      sources = cmp.config.sources({
        -- 1. High Priority Sources (Copilot and LSP)
        { name = 'copilot' },    -- Copilot LLM completions
        { name = 'nvim_lsp' },   -- LSP (Symbols, function calls, etc.)
        { name = 'luasnip' },    -- Snippets

        -- 2. Lower Priority Sources
      }, {
        { name = 'buffer' },      -- Words from current buffer
        { name = 'path' },        -- File paths
      }),
    })

    -- Cmdline completion setup (for : commands)
    cmp.setup.cmdline('/', {
      sources = cmp.config.sources({ { name = 'buffer' } })
    })

    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
      })
    })

  end,
}
