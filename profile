if [[ -d "$HOME/.local/bin" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/bin" ]]; then
	export PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.poetry/bin" ]]; then
	export PATH="$PATH:$HOME/.poetry/bin"
fi

if [[ "$OSTYPE" == darwin* ]]; then
	export PATH="$PATH:$HOME/Library/Python/3.8/bin"
fi
