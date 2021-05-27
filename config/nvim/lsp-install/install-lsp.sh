DIR=~/.dotfiles/config/nvim/lsp-install

yay -S nodejs-vls nodejs-intelephense nodejs-svelte-language-server typescript-language-server-bin python-language-server gopls \
	vscode-html-languageserver vscode-css-languageserver-bin

echo "export PATH=$PATH:$HOME/go/bin" >> ~/.profile

source $DIR/lua_lsp.sh
source $DIR/jdtls.sh
