local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  print("can't require nvim-treesitter")
  return
end
configs.setup {
  ensure_installed = {-- A list of parser names, or "all"
    "javascript","html","css","yaml","json","json5", --web basics
    "typescript","tsx","svelte","graphql","vue", --web addons
    "c","cpp","rust","go","haskell","ocaml",--backend
    "git_rebase","gitattributes","gitignore",--vcs
    "lua","fish","bash","vim", --conf, terminals, scripting etc...
  },
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing (for "all")
  auto_install = true, -- Automatically install missing parsers when entering buffer. Set to false if no tree-sitter cli is installed
  highlight = {
    enable = true,
    -- disable = { "" }, -- use parser names here, not filetypes
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" }},
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, -- use parser names here, not filetypes
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
