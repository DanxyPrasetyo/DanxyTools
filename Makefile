# File : Makefile (DanxyTools V8.3)
# Author : DANXY OFFICIAL 1980!

# Warna ANSI
R  = \033[31m
G  = \033[32m
Y  = \033[33m
B  = \033[34m
M  = \033[35m
C  = \033[36m
W  = \033[37m
RST= \033[0m

.PHONY: all menu help install tutor run

# Default: jika cukup ketik 'make'
all: menu

menu:
	@clear
	@echo "${R}██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗"
	@echo "${R}██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝"
	@echo "${R}██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░"
	@echo "${W}██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░"
	@echo "${W}██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░"
	@echo "${W}╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░"
	@printf "$(RST)"
	@echo
	@echo "┌─[${G}Pilih Perintah${RST}]"
	@echo "│"
	@echo "│ 1) $(G)make install$(RST) – install semua dependensi"
	@echo "│ 2) $(Y)make tutor$(RST)   – buka channel tutorial"
	@echo "│ 3) $(C)make run$(RST)     – jalankan script utama"
	@echo "│"
	@read -p "└─ Masukkan nomor [1/2/3] : " choice; \
	case "$$choice" in \
		1) $(MAKE) install ;; \
		2) $(MAKE) tutor   ;; \
		3) $(MAKE) run     ;; \
		*) echo -e "\n$(R)[✗] Pilihan tidak valid!$(RST)" ;; \
	esac

help: menu   # alias

install:
	@clear
	@echo "${R}██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗"
	@echo "${R}██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝"
	@echo "${R}██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░"
	@echo "${W}██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░"
	@echo "${W}██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░"
	@echo "${W}╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░"
	@printf "$(RST)"
	@echo
	@echo "$(Y)[ ! ]$(Y)MENGINSTAL SEMUA KEBUTUHAN TOOLS!"
	@echo "$(Y)[ ! ]$(R) Memulai instalasi semua dependensi...$(G)"
	@pkg update -y && pkg upgrade -y
	@printf "$(G)[✓]$(RST) Update & upgrade selesai\n"
	@printf "$(C)  ↳ python python3 nala git$(RST)\n"
	@pkg install -y python python3 nala git
	@printf "$(C)  ↳ coreutils ncurses-utils which python-pip nodejs bc ruby$(RST)\n"
	@pkg install -y coreutils ncurses-utils which python-pip nodejs bc ruby
	@printf "$(C)  ↳ openssl-tool xz-utils bzip2 boxes jq cowsay toilet$(RST)\n"
	@pkg install -y openssl-tool xz-utils bzip2 boxes jq cowsay toilet
	@printf "$(C)  ↳ php$(RST)\n"
	@pkg install -y php
	@printf "$(Y)  ↳ ruby-gems (lolcat)$(RST)\n"
	@gem install lolcat > /dev/null 2>&1 || true
	@printf "$(Y)  ↳ npm global (bash-obfuscate)$(RST)\n"
	@npm install -g bash-obfuscate > /dev/null 2>&1 || true
	@printf "$(Y)  ↳ pip packages (rich, yt-dlp, rich-cli)$(RST)\n"
	@pip install --upgrade rich rich-cli yt-dlp > /dev/null 2>&1 || true
	@echo
	@echo "$(G)[ ✔ ] Semua paket berhasil diinstal!$(RST)"
	@printf "\n$(B)[ i ]$(RST) Total ukuran module yang ter-install di Termux:\n"
	@du -sh $$PREFIX 2>/dev/null || du -sh /data/data/com.termux/files/usr

tutor:
	@clear
	@echo "${R}██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗"
	@echo "${R}██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝"
	@echo "${R}██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░"
	@echo "${W}██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░"
	@echo "${W}██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░"
	@echo "${W}╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░"
	@printf "$(RST)"
	@echo
	@termux-open https://www.youtube.com/@DanxyOfficial || echo -e "$(Y)[ INFO ]$(RST) Tutorial ada di: https://www.youtube.com/@DanxyOfficial"

run:
	@clear
	@echo "${R}██████╗░░█████╗░███╗░░██╗██╗░░██╗██╗░░░██╗"
	@echo "${R}██╔══██╗██╔══██╗████╗░██║╚██╗██╔╝╚██╗░██╔╝"
	@echo "${R}██║░░██║███████║██╔██╗██║░╚███╔╝░░╚████╔╝░"
	@echo "${W}██║░░██║██╔══██║██║╚████║░██╔██╗░░░╚██╔╝░░"
	@echo "${W}██████╔╝██║░░██║██║░╚███║██╔╝╚██╗░░░██║░░░"
	@echo "${W}╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░░░╚═╝░░░"
	@printf "$(RST)"
	@echo
	@echo "$(Y)[ ! ]$(G) MENJALANKAN SCRIPT TOOLS V8.3"
	@git pull
	@bash DanxyTools.sh
