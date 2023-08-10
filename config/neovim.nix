{ pkgs, ...}:
{
programs.neovim = {
enable = true;
viAlias = true;
vimAlias = true;
vimdiffAlias = true;
defaultEditor = true;
extraConfig = ''
set number
set shiftwidth=2
set tabstop=2
set clipboard+=unnamedplus
set timeoutlen=100

colorscheme tokyonight-night

filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'
 
let g:vimtex_compiler_latexmk = {
        \'build_dir': 'build',
        \'aux_dir': 'aux',
        \'out_dir': 'out'
    \}
'';

extraLuaConfig = ''
  require("nvim-tree").setup()
  require("auto-session").setup()
  require("which-key").setup({
    window = {
      border = 'single',
    }
  })
'';

plugins = with pkgs.vimPlugins; [
  vim-nix
  tokyonight-nvim
  nvim-tree-lua
  vimtex
  auto-session
  vim-airline
  hop-nvim
  which-key-nvim
];

};}
