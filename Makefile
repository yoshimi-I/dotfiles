# Run all shell files
all: init link brew iterm2 staship github ghostty

# run init.sh
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	chmod +x .bin/init.sh
	@.bin/init.sh
	@echo "\033[0;34mDone.\033[0m"

# create symbolic links
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	chmod +x .bin/link.sh
	@.bin/link.sh
	@echo "\033[0;34mDone.\033[0m"

# Install macOS applications.
brew:
	@echo "\033[0;34mRun brew.sh\033[0m"
	chmod +x .bin/brew.sh
	@.bin/brew.sh
	@echo "\033[0;32mDone.\033[0m"

hammerspoon:
	@echo "\033[0;34mRun hammerspoon.sh\033[0m"
	chmod +x .config/hammerspoon/hammerspoon.sh
	@.config/hammerspoon/hammerspoon.sh
	@echo "\033[0;32mDone.\033[0m"

# Set iTerm2 font
iterm2:
	@echo "\033[0;34mRun setup_iterm2.sh\033[0m"
	chmod +x .config/iterm2/iterm2.sh
	@.config/iterm2/iterm2.sh
	@echo "\033[0;32mDone.\033[0m"

# Set Starship font (nerd-font.sh)
staship:
	@echo "\033[0;34mRun nerd-font.sh\033[0m"
	chmod +x .config/staship/starship.sh
	@.config/staship/starship.sh
	@echo "\033[0;32mDone.\033[0m"

# Set GitHub
github:
	@echo "\033[0;34mRun github.sh\033[0m"
	chmod +x .bin/github.sh
	@.bin/github.sh
	@echo "\033[0;32mDone.\033[0m"

# Set ghostty
ghostty:
	@echo "\033[0;34mRun ghostty.sh\033[0m"
	chmod +x .config/ghostty/ghostty.sh
	@.config/ghostty/ghostty.sh
	@echo "\033[0;32mDone.\033[0m"
