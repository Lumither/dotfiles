return {
    -- VCS
    "**/.git/**",

    -- JS/TS
    "**/node_modules/**",
    "**/jspm_packages/**",
    "**/bower_components/**",
    "**/.next/**",
    "**/.nuxt/**",
    "**/.svelte-kit/**",
    "**/.vite/**",
    "**/.parcel-cache/**",
    "**/.cache/**",
    "**/.webpack/**",

    -- Python
    "**/venv/**",
    "**/.venv/**",
    "**/__pycache__/**",
    "**/.tox/**",
    "**/.nox/**",
    "**/.mypy_cache/**",
    "**/.ruff_cache/**",
    "**/.pytest_cache/**",
    "**/.eggs/**",

    -- Rust / Java / C++
    "**/target/**",

    -- Build output
    "**/build/**",
    "**/dist/**",
    "**/debug/**",
    "**/_build/**",
    "**/out/**",

    -- Misc
    "**/.serverless/**",
    "**/coverage/**",
}
