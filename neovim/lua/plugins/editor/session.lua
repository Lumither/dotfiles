local neotree_state_dir = vim.fn.stdpath("data") .. "/neotree_state"

local function state_file_for_cwd()
    vim.fn.mkdir(neotree_state_dir, "p")
    local cwd = vim.fn.getcwd()
    local key = cwd:gsub("/", "%%")
    return neotree_state_dir .. "/" .. key .. ".json"
end

local saved_winid = nil

local function save_neotree_state()
    saved_winid = vim.api.nvim_get_current_win()
    pcall(function()
        local manager = require("neo-tree.sources.manager")
        local state = manager.get_state("filesystem")
        if state and state.tree then
            local renderer = require("neo-tree.ui.renderer")
            local expanded = renderer.get_expanded_nodes(state.tree)
            local f = io.open(state_file_for_cwd(), "w")
            if f then
                f:write(vim.fn.json_encode(expanded))
                f:close()
            end
        end
    end)
    pcall(vim.cmd, "Neotree close")
end

local function restore_neotree_state()
    pcall(function()
        local f = io.open(state_file_for_cwd(), "r")
        if f then
            local data = f:read("*a")
            f:close()
            local ok, expanded = pcall(vim.fn.json_decode, data)
            if ok and type(expanded) == "table" then
                local manager = require("neo-tree.sources.manager")
                local state = manager.get_state("filesystem")
                state.force_open_folders = expanded
            end
        end
    end)
    pcall(vim.cmd, "Neotree show")
    if saved_winid and vim.api.nvim_win_is_valid(saved_winid) then
        vim.api.nvim_set_current_win(saved_winid)
    end
    saved_winid = nil
end

return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        auto_restore = true,
        auto_save = true,
        auto_create = false,
        args_allow_files_auto_save = true,
        pre_save_cmds = { save_neotree_state },
        post_save_cmds = { restore_neotree_state },
        post_restore_cmds = { restore_neotree_state },
    },
    keys = {
        { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
        { "<leader>sl", "<cmd>AutoSession restore<cr>", desc = "Load session" },
    },
}
