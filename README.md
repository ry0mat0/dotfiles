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

特定プラグインの設定ファイルは`plugins/PLUGIN.rc.vim`から読みこみ。
これらのファイルは`init.vim`によって自動的に読みこまれるが下記のプラグインを動作させるには
別途ファイルのリンクを貼る。

### vim-vsnip
`hrsh7th/vim-vsnip`のスニペット内容ファイル`dotfiles/vsnip`
を`~/.config/vsnip`として配置する。

### skkeleton
`vim-skk/denpos-skkeleton.vim`の辞書ファイルの置き場所として`~/.cache/skkeleton`を指定してあるので、
`AquaSKK`の辞書ファイル`SKK-JISYO.L`と`skk-jisho.utf8`のリンクを貼る
