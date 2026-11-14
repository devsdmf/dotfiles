.DEFAULT_GOAL := default

include setup/darwin/Makefile.in
include setup/debian/Makefile.in

.PHONY: default darwin debian

.title:
	@echo "devsdmf - dotfiles\n"

default: .title
	@echo "Usage:"
	@echo "  make darwin   set up macOS"
	@echo "  make debian   set up Debian/Ubuntu"

darwin: .title darwin-setup

debian: .title debian-setup
