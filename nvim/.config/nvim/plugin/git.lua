vim.pack.add({
    "https://github.com/kdheepak/lazygit.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

vim.keymap.set("n", "<leader>gi", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

require("gitsigns").setup({
    on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
            end

            map("n", "<leader>gs", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
            map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
    end,
})
