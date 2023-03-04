# Run all shell files

# run init.sh
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@.bin/init.sh
	@echo "\033[0;34mDone.\033[0m"

# next create symbolic links
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	@.bin/link.sh && eval "$(/opt/homebrew/bin/brew shellenv)"
	@echo "\033[0;34mDone.\033[0m"



# Install macOS applications.
brew:
	@echo "\033[0;34mRun brew.sh\033[0m"
	@.bin/brew.sh
	@echo "\033[0;32mDone.\033[0m"

# Set GitHub
github:
	@echo "\033[0;34mRun github.sh\033[0m"
	@.bin/github.sh
	@echo "\033[0;32mDone.\033[0m"
