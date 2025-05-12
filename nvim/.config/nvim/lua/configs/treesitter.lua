local config = {
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "html",
    "java",
    "javadoc",
    "javascript",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "nginx",
    "nix",
    "passwd",
    "pem",
    "perl",
    "printf",
    "python",
    "regex",
    "rust",
    "sql",
    "ssh_config",
    "tsx",
    "typescript",
    "vim",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

return config
