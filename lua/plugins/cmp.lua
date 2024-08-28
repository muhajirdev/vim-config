return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local compare = require("cmp.config.compare")

      opts.sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          priority = 1000,
        },
        {
          name = "path",
        },
        {
          name = "buffer",
        },
        -- {
        --   name = "snippets",
        --   priority = 0,
        -- },
        {
          name = "lazydev",
        },
      })

      -- opts.sorting = {
      --   priority_weight = 100,
      --   comparators = {
      --     compare.offset,
      --     compare.exact,
      --     -- compare.scopes,
      --     compare.score,
      --     compare.recently_used,
      --     compare.locality,
      --     compare.kind,
      --     -- compare.sort_text,
      --     compare.length,
      --     compare.order,
      --   },
      -- }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-e>"] = cmp.mapping.abort(),
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          local suggestion = require("supermaven-nvim.completion_preview")
          if suggestion.has_suggestion() then
            suggestion.on_accept_suggestion()
          elseif cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
