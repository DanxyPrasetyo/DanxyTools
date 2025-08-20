# ============================================================
#          D A N X Y  T O O L S  –  M A K E  O V E R
# ============================================================
SHELL      := /bin/bash
RED         := \033[1;31m
GREEN       := \033[1;32m
YELLOW      := \033[1;33m
BLUE        := \033[1;34m
PURPLE      := \033[1;35m
CYAN        := \033[1;36m
GRAY        := \033[1;90m
RESET       := \033[0m
BOLD        := \033[1m
ITALIC      := \033[3m

# ──────────────────────────────────────
#                   Spinner untuk loading
# ──────────────────────────────────────
define SPINNER
	set -e; \
	SPIN='/-\|'; \
	i=0; \
	while kill -0 $$1 2>/dev/null; do \
	  printf "\r${YELLOW}[%s]${RESET} %s" "$${SPIN:i++%$${#SPIN}:1}" "$$2"; \
	  sleep 0.1; \
	done; \
	printf "\r${GREEN}[+]${RESET} %s\n" "$$3"
endef

# ──────────────────────────────────────
#  Banner glow ASCII
# ──────────────────────────────────────
define BANNER
	@printf "\n${CYAN}"
	@printf "██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗\n"
	@printf "██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝\n"
	@printf "██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░\n"
	@printf "██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░\n"
	@printf "██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░\n"
	@printf "╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░\n"
	@printf "${RESET}\n"
	@toilet -f small -F border "D A N X Y   T O O L S V8.3" 2>/dev/null || echo -e "${PURPLE}D A N X Y   T O O L S${RESET}"
	@printf "\n"
endef

# ──────────────────────────────────────
#  Target utama
# ──────────────────────────────────────
.PHONY: help install tutor run

help: ## Tampilkan menu bantuan
	$(BANNER)
	@printf "\n${BOLD}${GREEN}Available commands:${RESET}\n\n"
	@printf "   ${CYAN}make install${RESET}   – Install all dependencies with style.\n"
	@printf "   ${CYAN}make tutor${RESET}     – Open tutorial YouTube channel.\n"
	@printf "   ${CYAN}make run${RESET}       – Launch main script.\n"
	@printf "\n${GRAY}Hint: Run ${YELLOW}make install${GRAY} first, then ${YELLOW}make run${GRAY}.\n\n"

install: ## Install semua dependensi dengan progress bar
	$(BANNER)
	@printf "${YELLOW}[~] Updating & upgrading Termux...${RESET}\n"
	@(pkg update -y && pkg upgrade -y) & spinner=$$!; $(call SPINNER,$$spinner,"Updating repos...","Update complete!")
	@printf "${BLUE}[~] Installing base packages...${RESET}\n"
	@pkg install -y python python3 git nala nodejs ruby bc openssl-tool jq cowsay toilet boxes coreutils ncurses-utils which python-pip xz-utils bzip2 & spinner=$$!; $(call SPINNER,$$spinner,"Installing packages...","All packages installed!")
	@printf "${PURPLE}[~] Installing gems & npm globals...${RESET}\n"
	@gem install lolcat 2>/dev/null & spinner=$$!; $(call SPINNER,$$spinner,"Installing lolcat gem...","lolcat OK!")
	@npm install -g bash-obfuscate 2>/dev/null & spinner=$$!; $(call SPINNER,$$spinner,"Installing bash-obfuscate...","bash-obfuscate OK!")
	@pip install rich rich-cli 2>/dev/null & spinner=$$!; $(call SPINNER,$$spinner,"Installing rich...","rich OK!")
	@printf "\n${GREEN}[+] All dependencies installed successfully!${RESET}\n"
	@cowsay -f tux "Ready to rock!" 2>/dev/null || true

tutor: ## Buka tutorial YouTube
	$(BANNER)
	@printf "${CYAN}[>] Opening browser for tutorial...${RESET}\n"
	@termux-open "https://www.youtube.com/@DanxyOfficial" || xdg-open "https://www.youtube.com/@DanxyOfficial"
	@printf "${YELLOW}[!] Do not forget to subscribe the Danxy channel!${RESET}\n"

run: ## Jalankan script utama
	$(BANNER)
	@printf "${GREEN}[>] Launching DanxyTools...${RESET}\n"
	@git pull --quiet
	@bash DanxyTools.sh
