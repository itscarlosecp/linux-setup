require"nvim-treesitter.configs".setup {
  ensure_installed = {
	  "bash",
	  "c",
	  "clojure",
	  "cpp",
	  "css",
	  "go",
	  "graphql",
	  "html",
	  "javascript",
	  "json",
	  "jsonc",
	  "julia",
	  "latex",
	  "lua",
	  "python",
	  "regex",
	  "ruby",
	  "rust",
	  "svelte",
	  "tsx",
	  "typescript",
	  "vue",
	  "yaml"
  },
  highlight = {
    enable = true,
  },
}

vim.api.nvim_exec([[
	au BufRead,BufNewFile *.jl set filetype=julia
]], false)
