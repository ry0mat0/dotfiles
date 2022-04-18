# dotfiles

## zsh
`zshrc`を`~/.zshrc`、`zprofile`を`~/.zprofile`として配置する。
## tmux
`tmux.conf`を`~/.tmux.conf`として配置する。
## AquaSKK(OSX)
`AquaSKK/keymap.conf`を`~/Library/Application Support/AquaSKK/keymap.conf`として配置する。
## vim
`init.vim`をVimは`~/.vimrc`、neovimは`~/.config/nvim/init.vim`として配置する。
### ファイル読みこみ構造
`init.vim`から
`plugin.toml`, `plugin_lazy.toml`, `ddc.toml`, `lsp.toml`

特定プラグインの設定ファイルは`plugins/PLUGIN.rc.vim`から読みこみ

