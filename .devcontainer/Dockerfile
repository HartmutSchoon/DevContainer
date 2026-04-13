FROM archlinux:multilib-devel-20260329.0.507017

ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG PROJECTNAME
WORKDIR /workspaces/${PROJECTNAME}

RUN pacman -Syu --noconfirm sudo zsh git curl wget neovim tmux bc bash unzip \
    yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick \
    eza bat btop tealdeer rust python uv nodejs npm openssh \
    mariadb-libs pkgconf base-devel \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/zsh \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /home/$USERNAME/.config \
    && chown $USERNAME:$USERNAME /home/$USERNAME/.config

# Install Gemini CLI
RUN npm install -g @google/gemini-cli

USER $USERNAME

ENV SHELL=/bin/zsh
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Install Zsh plugins (autosuggestions and syntax-highlighting)
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# P10K Config from host mount (see devcontainer.json/run.sh)
RUN echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# Add yazi shell wrapper
RUN echo "" >> ~/.zshrc
RUN echo "#Yazi shell wrapper" >> ~/.zshrc

RUN <<EOF cat >> ~/.zshrc
function y() {
	local tmp="\$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "\$@" --cwd-file="\$tmp"
	IFS= read -r -d '' cwd < "\$tmp"
	[ "\$cwd" != "\$PWD" ] && [ -d "\$cwd" ] && builtin cd -- "\$cwd"
	rm -f -- "\$tmp"
}

# Aliases
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias cat='bat'
alias mensa='/home/devuser/.scripts/mensa.sh'
alias syncpush='/home/devuser/.scripts/syncpush.sh'
EOF