return {
    "echasnovski/mini.icons",
    version = "*",
    lazy = false,
    opts = {
        style = "ascii",
    },
    init = function()
        -- mini.icons can replace nvim-web-devicons
        package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
        end
    end,
}
