return {

    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp" },
    init = function()

        vim.g.markdown_fenced_languages = { "ts=typescript" }
        --  Required for 'denols' language server
    end,
    config = function()

        local cmp = require("cmp_nvim_lsp")
        local capabilities = cmp.default_capabilities()

        vim.lsp.config.capabilities = capabilities

        vim.lsp.config.lua_ls = require("lsp.lua")
        vim.lsp.config.bashls = require("lsp.bash")
        vim.lsp.config.rust_analyzer = require("lsp.rust")
        vim.lsp.config.ccls = require("lsp.c")
        vim.lsp.config.pyright = require("lsp.python.pyright")
        vim.lsp.config.ruff = require("lsp.python.ruff")
        vim.lsp.config.denols = require("lsp.javascript")
        vim.lsp.config.marksman = require("lsp.markdown")
        vim.lsp.config.dockerls = require("lsp.docker")

        local servers = {
            "lua_ls", "bashls", "rust_analyzer", "ccls",
            "pyright", "ruff", "denols", "marksman", "dockerls"
        }
        for _, lsp in ipairs(servers) do vim.lsp.enable(lsp) end
    end
}
