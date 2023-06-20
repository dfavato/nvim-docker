# Unstable for newest features
FROM debian:unstable-slim


# Set image locale
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=America/Sao_Paulo


# Update repositories
RUN apt-get update


# Install neovim build dependencies
RUN apt-get install -y \
    wget \
    curl \
    git

# Use neovim appimage
RUN mkdir -p /nvim
RUN cd /nvim && \
    wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage && \
    chmod u+x nvim.appimage && \
    ./nvim.appimage --appimage-extract
RUN echo "alias nvim='/nvim/squashfs-root/usr/bin/nvim'" >> ~/.bashrc

WORKDIR /root

# Improve Neovim experience
# Vim plug
RUN apt-get install -y \
    nodejs \
    npm
RUN npm install -g neovim
RUN curl -fLo .local/share/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p .config/nvim

# For python
RUN apt-get install -y \
    python3 \
    python3-pip


COPY ./nvim/config/ .config/nvim/
RUN pip3 install pipenv --break-system-packages
RUN cd .config/nvim/ && pipenv sync
# Adjust neovim python3 host
RUN echo "let g:python3_host_prog = '$(pipenv run which python)'" >> .config/nvim/init.vim


# COC extensions
RUN /nvim/squashfs-root/usr/bin/nvim --headless +PlugInstall +qall
RUN /nvim/squashfs-root/usr/bin/nvim --headless \
    +"call coc#util#install_extension(['-sync'] + g:coc_global_extensions) |qa"


# Lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    install lazygit /bin
COPY lazygit/config.yml .config/lazygit/


WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash"]
