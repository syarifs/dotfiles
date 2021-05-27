LUA_LSP_PATH=~/.dotfiles/config/nvim/lsp/lua-language-server

git clone https://github.com/sumneko/lua-language-server $LUA_LSP_PATH
cd $LUA_LSP_PATH
git submodule update --init --recursive

cd $LUA_LSP_PATH/3rd/luamake
./compile/install.sh
./luamake rebuild
