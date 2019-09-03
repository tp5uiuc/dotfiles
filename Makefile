# The last regexp in find matches bash and zsh files
fmt:
	@shfmt --version
	@find . -maxdepth 3 -name '*.sh' | while read -r src; do shfmt -w -p "$$src"; done
	@find . -maxdepth 3 -name '*.[z|b]**sh' | while read -r src; do shfmt -w "$$src"; done;

check:
	@curl -sL https://git.io/shcheck | bash -f -s -- \
		--ignore='./vim/vim.symlink/**/*' \
		--shellcheck-exclude=SC1071

ci: check
	./script/test
