test: 
	@echo $(HOME)

dotfiles: bash tmux nvim
	@echo "dotfiles set up"

bash:
	ln -sfn $(CURDIR)/bashrc $(HOME)/.bashrc;

.PHONY: tmux
tmux:
	ln -sfn $(CURDIR)/tmux/ $(HOME)/.config/tmux;

.PHONY: nvim
nvim:
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;

