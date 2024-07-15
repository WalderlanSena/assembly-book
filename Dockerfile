FROM --platform=linux/amd64 ubuntu:latest

RUN apt-get update && \
    apt-get install -y build-essential gcc gdb nasm vim

# Configurar Vim
RUN echo "syntax on\n\
set number\n\
set tabstop=2\n\
set shiftwidth=2\n\
set expandtab\n\
set autoindent\n\
set smartindent\n\
set background=dark\n\
set showcmd\n\
set cursorline\n\
set wildmenu\n\
set showmatch\n\
set ignorecase\n\
set incsearch\n\
set hlsearch\n\
set clipboard=unnamedplus" > /root/.vimrc

# Definir diretório de trabalho
WORKDIR /workspace

# Manter o container rodando
CMD ["tail", "-f", "/dev/null"]

