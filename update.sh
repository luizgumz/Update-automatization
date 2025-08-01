
#!/bin/bash


echo "=== Iniciando atualizações de sistema ==="
sleep 1

# Atualiza a lista de pacotes
echo "[1/5] Atualizando lista de pacotes..."
sudo apt-get update || {echo "Falha ao atualizar a lista de pacotes!"}

# Faz atualização dos pacotes instalados
echo "[2/5] Atualizando pacotes instalados..."
sudo apt-get upgrade  -y || {echo "Falha ao atualizar pacotes instalados!"}

# Atualiza os pacotes essenciais do sistema
echo "[3/5] Aplicando atualizações mais profundas (dist-upgrades)"
sudo apt-get dist-upgrade -y || {echo "Falha ao realizar atualizações profundas de sistema!"}

# Remove pacotes desnecessarios
echo "[4/5] Removendo pacotes desnecessários..."
sudo apt-get autoremove -y || {echo "Falha ao remover pacotes desnecessários!"}

# Limpa pacotes antigos do cache
echo "[5/5] Limpando pacotes antigos do cache..."
sudo apt-get autoclean || {echo "Falha ao limpar pacotes do cache"}

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Atualizacao concluida!"
