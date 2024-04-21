test: 
	@echo $(HOME)

dotfiles: bash tmux nvim
	@echo "dotfiles set up"

bash:
	ln -sfn $(CURDIR)/bashrc $(HOME)/.bashrc;

tmux:
	ln -sfn $(CURDIR)/tmux/ $(HOME)/.config/tmux;

nvim:
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;

