#!/bin/sh

OS=$(uname -s)

fix_my_prompt() {
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | /bin/sh
	sed -i - "s/robbyrussell/steeef/g" "$HOME/.zshrc"
	rm -f "$HOME/.zshrc-"
	echo 'plugins=(git)' >> "$HOME/.zshrc"
	echo 'source $HOME/.oh-my-zsh/oh-my-zsh.sh' >> "$HOME/.zshrc"
	echo 'export LANG=en_US.UTF-8' >> "$HOME/.zshrc"
	git clone git://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
	echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"
	echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
	echo "Done. Reopen terminal/console."
}

if [ "$OS" = "Darwin" ]; then
	fix_my_prompt
elif [ "$OS" = "FreeBSD" ]; then
	fix_my_prompt
elif [ "$OS" = "Linux" ]; then
	fix_my_prompt
else
	echo "Unknown OS ($OS)"
	exit 1
fi

exit 0