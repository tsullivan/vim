local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- ESLint for diagnostics (warnings/errors)
        require("none-ls.diagnostics.eslint_d").with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
            prefer_local = "node_modules/.bin",
        }),

        -- ESLint for code actions (including autofix for individual rules)
        require("none-ls.code_actions.eslint_d").with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
            prefer_local = "node_modules/.bin",
        }),

        -- Prettier for formatting, respecting .prettierrc
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "jsonc", -- For tsconfig.json, etc.
                "markdown",
                "yaml",
                "graphql",
                "svelte",
                "astro",
            },
            -- Use local `prettier` executable which will then automatically pick up .prettierrc
            prefer_local = "node_modules/.bin",
            -- If you had specific arguments *not* in .prettierrc you wanted to force, you'd add them here:
            -- args = { "--loglevel", "warn" },
        }),
    },
})
