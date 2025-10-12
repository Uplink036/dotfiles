dotfiles: install bash tmux ## Do all the instalations 
	@echo "dotfiles set up"

install: ## Install all 
	./install_code.sh
	./install_gnome_extensions.sh
	./install_tmux.sh
	./install_zoxide.sh

bash: ## Soft link this bash config file to the correct place
	ln -sfn $(CURDIR)/bashrc $(HOME)/.bashrc;
	ln -sfn $(CURDIR)/scripts/git_stats.py $(HOME)/.local/bin/git_stats.py

.PHONY: tmux
tmux: ## Soft link this tmux config file to the correct place
	ln -sfn $(CURDIR)/tmux/ $(HOME)/.config/tmux;

.PHONY: startup
startup:
	ln -sfn $(CURDIR)/autostart/ $(HOME)/.config;

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
