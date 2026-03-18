#!/bin/bash

# Definicao de cores
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' #sem cor

echo -e "${GREEN}=== Iniciando atualizações de sistema ===${NC}"
sleep 1

# Atualiza a lista de pacotes
echo "[1/8] Atualizando lista de pacotes..."
sleep 1
sudo apt-get update || { echo -e "${RED}Falha ao atualizar a lista de pacotes!${NC}"; exit 1; }
echo -e "${GREEN}Atualizacao de pacotes realizada com sucesso!${NC}"
sleep 1

# Faz atualização dos pacotes instalados
echo "[2/8] Atualizando pacotes instalados..."
sleep 1
sudo apt-get upgrade -y || { echo -e "${RED}Falha ao atualizar pacotes instalados!${NC}"; exit 1; }
echo -e "${GREEN}Instalacao de pacotes realizada com sucesso!${NC}"
sleep 1

# Atualiza os pacotes essenciais do sistema
echo "[3/8] Aplicando atualizações mais profundas (full-upgrade)"
sleep 1
sudo apt-get full-upgrade -y || { echo -e "${RED}Falha ao realizar atualizações profundas de sistema!${NC}"; exit 1; }
echo -e "${GREEN}Atualizacao de kernel realizada com sucesso!${NC}"
sleep 1

# Remove pacotes desnecessarios
echo "[4/8] Removendo pacotes desnecessários..."
sleep 1
sudo apt-get autoremove -y || { echo -e "${RED}Falha ao remover pacotes desnecessários!${NC}"; exit 1; }
echo -e "${GREEN}Remocao de pacotes realizada com sucesso!${NC}"
sleep 1

# Limpa pacotes antigos do cache
echo "[5/8] Limpando pacotes antigos do cache..."
sleep 1
sudo apt-get autoclean || { echo -e "${RED}Falha ao limpar pacotes do cache!${NC}"; exit 1; }
echo -e "${GREEN}Limpeza de pacotes antigos do cache realizada com sucesso!${NC}"
sleep 1

# Atualizacao do snap
echo "[6/8] Atualizando pacotes do SNAP..."
sleep 1
sudo snap refresh || { echo -e "${RED}Falha ao atualizar pacotes snap!${NC}"; exit 1; }
echo -e "${GREEN}Atualizacao de SNAP realizada com sucesso!${NC}"
sleep 1

# Gera uma nova imagem de boot e grava no GRUB
echo "[7/8] Gerando nova imagem de boot..."
sleep 1
sudo update-initramfs -u || { echo -e "${RED}Falha ao gravar imagem de boot!${NC}"; exit 1; }
echo -e "${GREEN}Nova imagem de boot gerada com sucesso!${NC}"
sleep 1

echo "[8/8] Atualizando GRUB..."
sleep 1
sudo update-grub || { echo -e "${RED}Falha ao atualizar o GRUB!${NC}"; exit 1; }
echo -e "${GREEN}Atualizacao do GRUB realizada com sucesso!${NC}"
sleep 1

#Finalizacao
echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] ${GREEN}Atualizacao concluida!${NC}"
