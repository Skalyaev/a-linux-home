return {

    "sbdchd/neoformat",
    lazy = true,
    cmd = "Neoformat",
    init = function()
        vim.cmd([[au BufWrite * :Neoformat]])

        vim.g.neoformat_try_node_exe = 1
        vim.g.neoformat_basic_format_retab = 1
        vim.g.neoformat_basic_format_trim = 1
        vim.g.neoformat_basic_format_trim = 1
    end
}
