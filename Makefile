# Run all shell files
all: init link brew iterm2 staship github  wezterm

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

# Set Iterm2 font
iterm2:
	@echo "\033[0;34mRun setup_iterm2.sh\033[0m"
	@.config/iterm2/setup_iterm2.sh
	@echo "\033[0;32mDone.\033[0m"

# Set WezTerm
wezterm:
	@echo "\033[0;34mRun wezterm.sh\033[0m"
	@.config/wezterm/wezterm.sh
	@echo "\033[0;32mDone.\033[0m"

# Set Starship font
staship:
	@echo "\033[0;34mRun nerd-font.sh\033[0m"
	@.config/starship.sh
	@echo "\033[0;32mDone.\033[0m"

# Set GitHub
github:
	@echo "\033[0;34mRun github.sh\033[0m"
	@.bin/github.sh
	@echo "\033[0;32mDone.\033[0m"
