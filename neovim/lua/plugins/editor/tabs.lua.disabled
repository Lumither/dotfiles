return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {},
    event = "VeryLazy",
    opts = {
        highlights = {
            fill = {
                link = "Normal",
            },
        },
        options = {
            get_element_icon = function(element)
                if element.filetype == "NvimTree" or vim.fn.isdirectory(element.path) == 1 then
                    return "+", "Directory"
                end
                local stat = element.path and vim.uv.fs_lstat(element.path)
                if stat and stat.type == "link" then
                    return "&", "Directory"
                end
            end,
            buffer_close_icon = "x",
            modified_icon = "*",
            close_icon = "x",
            left_trunc_marker = "<",
            right_trunc_marker = ">",
            indicator = {
                icon = "|",
                style = "icon",
            },
            -- offsets = {
            --     {
            --         filetype = "NvimTree",
            --         text = "File Explorer",
            --         text_align = "left",
            --         separator = true,
            --     },
            -- },
            close_command = function(bufnr)
                local bufs = vim.fn.getbufinfo({ buflisted = 1 })
                if #bufs > 1 then
                    vim.cmd("BufferLineCyclePrev")
                end
                vim.cmd("bdelete! " .. bufnr)
            end,
        },
    },
    keys = {
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<leader>x", function()
            local bufnr = vim.api.nvim_get_current_buf()
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })
            if #bufs > 1 then
                vim.cmd("BufferLineCyclePrev")
            end
            vim.cmd("bdelete! " .. bufnr)
        end, desc = "Close buffer" },
    },
}
