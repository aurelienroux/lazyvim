-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Tell conform to use local prettier from node_modules first
    opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
      prettier = {
        command = vim.fn.getcwd() .. "/node_modules/.bin/prettier",
        -- fall back to global prettier if local one doesn’t exist
        fallback = "prettier",
        prepend_args = { "--config-precedence", "prefer-file" },
      },
    })

    -- Explicitly set prettier for JS/TS/React
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
    })
  end,
}
