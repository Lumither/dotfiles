local state_dir = vim.fn.stdpath("data") .. "/nvimtree_state"
local saved_winid = nil

local function state_file_for_cwd()
    vim.fn.mkdir(state_dir, "p")
    local key = vim.fn.getcwd():gsub("/", "%%")
    return state_dir .. "/" .. key .. ".json"
end

local function collect_expanded(nodes, paths)
    for _, node in ipairs(nodes) do
        if node.type == "directory" and node.open then
            table.insert(paths, node.absolute_path)
            if node.nodes then
                collect_expanded(node.nodes, paths)
            end
        end
    end
end

local function save_tree_state()
    saved_winid = vim.api.nvim_get_current_win()
    pcall(function()
        local core = require("nvim-tree.core")
        local explorer = core.get_explorer()
        if explorer and explorer.nodes then
            local paths = {}
            collect_expanded(explorer.nodes, paths)
            local f = io.open(state_file_for_cwd(), "w")
            if f then
                f:write(vim.fn.json_encode(paths))
                f:close()
            end
        end
    end)
    pcall(function()
        require("nvim-tree.api").tree.close()
    end)
end

local function restore_tree_state()
    pcall(function()
        local api = require("nvim-tree.api")
        api.tree.open()

        local f = io.open(state_file_for_cwd(), "r")
        if f then
            local data = f:read("*a")
            f:close()
            local ok, paths = pcall(vim.fn.json_decode, data)
            if ok and type(paths) == "table" then
                for _, path in ipairs(paths) do
                    api.tree.find_file({ buf = path, open = false, focus = false })
                end
            end
        end
    end)
    if saved_winid and vim.api.nvim_win_is_valid(saved_winid) then
        vim.api.nvim_set_current_win(saved_winid)
    end
    saved_winid = nil
end

return {
    "rmagatti/auto-session",
    lazy = false,
    cond = vim.env.NVIM_NO_SESSION ~= "1",
    opts = {
        auto_restore = true,
        auto_save = true,
        auto_create = false,
        args_allow_files_auto_save = true,
        pre_save_cmds = { save_tree_state },
        post_save_cmds = { restore_tree_state },
        post_restore_cmds = { restore_tree_state },
    },
    keys = {
        { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
        { "<leader>sl", "<cmd>AutoSession restore<cr>", desc = "Load session" },
    },
}
