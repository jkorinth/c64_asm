SUBS=dasm 64tass
.PHONY: clean all $(SUBS)

all: $(SUBS)


$(SUBS):
	@$(MAKE) -C $@


clean:
	@for dir in $(SUBS); do          \
		$(MAKE) - C $$dir clean; \
	done
