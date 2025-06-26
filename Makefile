all: docs

docs:
	$(MAKE) -C docs man

.PHONY: all docs
