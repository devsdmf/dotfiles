include setup/darwin/Makefile.in
include setup/debian/Makefile.in

.title:
	@echo "devsdmf - dotfiles\n"

default: .title

darwin: .title darwin-setup

debian: .title debian-setup
