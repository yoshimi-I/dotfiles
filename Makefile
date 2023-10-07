# Run all shell files
all:init link brew staship iterm2 github golang

# run init.sh
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@.bin/init.sh
	@echo "\033[0;34mDone.\033[0m"

# create symbolic links
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	@.bin/link.sh
	@echo "\033[0;34mDone.\033[0m"

# Install macOS applications.
brew:
	@echo "\033[0;34mRun brew.sh\033[0m"
	@.bin/brew.sh
	@echo "\033[0;32mDone.\033[0m"

iterm2:
# Set Iterm2 font
iterm2:
	@echo "\033[0;34mRun setup_iterm2.sh\033[0m"
	@.bin/setup_iterm2.sh
	@echo "\033[0;32mDone.\033[0m"

# Set Starship font
staship:
	@echo "\033[0;34mRun nerd-font.sh\033[0m"
	@.bin/starship.sh
	@echo "\033[0;32mDone.\033[0m"

# Set GitHub
github:
	@echo "\033[0;34mRun github.sh\033[0m"
	@.bin/github.sh
	@echo "\033[0;32mDone.\033[0m"

golang:
	@echo "\033[0;34mRun golang.sh\033[0m"
	@.bin/golang.sh
	@echo "\033[0;32mDone.\033[0m"
