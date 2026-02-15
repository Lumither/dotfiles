vim.filetype.add({
    filename = {
        ["Containerfile"] = "dockerfile",
    },
    pattern = {
        [".*%.containerfile"] = "dockerfile",
    },
})
