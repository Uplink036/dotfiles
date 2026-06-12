dotfiles: install bash tmux ## Do all the instalations 
	@echo "dotfiles set up"

install: ## Install all 
	./apps/install_code.sh
	./apps/install_gnome_extensions.sh
	./apps/install_tmux.sh
	./apps/install_zoxide.sh
	./apps/install_focus_terminal.sh
	./apps/install_devcontainer_cli.sh

bash: ## Soft link this bash config file to the correct place
	ln -sfn $(CURDIR)/bashrc $(HOME)/.bashrc;
	ln -sfn $(CURDIR)/scripts/git_stats.py $(HOME)/.local/bin/git_stats.py

.PHONY: tmux
tmux: ## Soft link this tmux config file to the correct place
	ln -sfn $(CURDIR)/tmux/ $(HOME)/.config/tmux;

.PHONY: terminal
terminal: ## Fixes a script to raise the terminal instead of creating a new one
	chmod +x  $(CURDIR)/scripts/raise_terminal.sh
	ln -sfn $(CURDIR)/scripts/raise_terminal.sh $(HOME)/.local/bin/raise_terminal.sh 

.PHONY: startup
startup:
	ln -sfn $(CURDIR)/autostart/ $(HOME)/.config;

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
