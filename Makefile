all: fmt localcheck

# The last regexp in find matches bash and zsh files
fmt:
	@shfmt --version
	@find . -type f -maxdepth 3 -name '*.sh' | while read -r src; do shfmt -w -p "$$src"; done
	@find . -type f -maxdepth 3 -name '*.[z|b]**sh' | while read -r src; do shfmt -w "$$src"; done;

localcheck:
	@shellcheck --version
	@find . -type f -maxdepth 3 -name '*.sh' | while read -r src; do shellcheck -s sh -e SC1071 "$$src"; done
	@find . -type f -maxdepth 3 -name '*.[z|b]**sh' | while read -r src; do shellcheck -s bash -e SC1071,SC1117 "$$src"; done;

check:
	@curl -sL https://git.io/shcheck | bash -f -s -- \
		--ignore='./vim/vim.symlink/**/*' \
		--shellcheck-exclude=SC1071,SC1117,SC2039

ci: check
	./script/test
