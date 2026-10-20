SUCHI_BIN ?=
EXAMPLES := $(sort $(wildcard examples/*.huml examples/*.toml))

.PHONY: check
check:
	@test -n "$(SUCHI_BIN)" || { printf '%s\n' 'Set SUCHI_BIN to the completed Suchi binary (absolute path).' >&2; exit 2; }
	@test -x "$(SUCHI_BIN)" || { printf '%s\n' 'SUCHI_BIN must name an executable file.' >&2; exit 2; }
	@set -eu; for file in $(EXAMPLES); do \
		printf 'Validating %s\n' "$$file"; \
		"$(SUCHI_BIN)" taxonomy validate "$$file"; \
	done
