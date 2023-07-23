# Neovim config

## Packages
- LSP-zero
- Harpoon
- Telescope
- Treesitter
- Undotree
- Vim-fugitive
- Packer 

## Install before using
- neovim 0.9.1
- ripgrep
- lsp language server
  
## ToDo
- Comments
- Vertical split navigation or TMUX
- Projects to eaisly pick
- Split management or TMUX

## Install to use

```
# LSPs
npm i -g vscode-langservers-extracted
npm i -g @kozer/emmet-language-server
npm i -g prettier

# Ripgrep
brew install ripgrep
# or
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
