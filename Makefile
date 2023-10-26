test: 
	@echo $(HOME)

dotfiles:
	ln -sfn $(CURDIR)/bashrc $(HOME)/.bashrc;
	ln -sfn $(CURDIR)/tmux/ $(HOME)/.config/tmux;
	ln -sfn $(CURDIR)/nvim $(HOME)/.config/nvim;




