#!/bin/sh

curl -fLo /tmp/jdtls.tar.gz --create-dirs https://download.eclipse.org/jdtls/milestones/1.1.2/jdt-language-server-1.1.2-202105191944.tar.gz
mkdir ~/.dotfiles/config/nvim/lsp/jdtls
tar -xf /tmp/jdtls.tar.gz --directory=$HOME/.dotfiles/config/nvim/lsp/jdtls

echo "
export JAR=$HOME/.dotfiles/config/nvim/lsp/jdtls/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar
export GRADLE_HOME=$HOME/.gradle
export JAVA_HOME=/usr/lib/jvm/default
export JDTLS_CONFIG=$HOME/.dotfiles/config/nvim/lsp/jdtls/config_linux
export WORKSPACE=$HOME/Documents/Java/workspace
" >> ~/.profile
