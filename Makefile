.DEFAULT_GOAL := default

include setup/darwin/Makefile.in
include setup/debian/Makefile.in
include setup/amzn/Makefile.in

.PHONY: default darwin debian amzn

.title:
	@echo "devsdmf - dotfiles\n"

default: .title
	@echo "Usage:"
	@echo "  make darwin   set up macOS"
	@echo "  make debian   set up Debian/Ubuntu"
	@echo "  make amzn     set up Amazon Linux (2023, best effort on 2)"

darwin: .title darwin-setup

debian: .title debian-setup

amzn: .title amzn-setup
