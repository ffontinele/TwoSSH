#!/bin/bash
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "TwoSSH Manager" ; tput sgr0
tput setaf 3 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
tput setaf 3 ; tput bold ; echo "" ; echo "● Instalar e configurar o proxy socks na porta 80 para permitir conexões SSH para este servidor" ; 
tput setaf 3 ; tput bold ; echo "" ; echo "● Configurar o OpenSSH para rodar na porta 22 deixando a porta 443 para o OpenVPN" ; 
tput setaf 3 ; tput bold ; echo "" ; echo "● Instalar um conjunto de scripts com comandos do sistema para o gerenciamento de usuários" ; tput sgr0
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
IP=$(wget -qO- ipv4.icanhazip.com)
read -p "Para continuar confirme o IP deste servidor: " -e -i $IP ipdovps
if [ -z "$ipdovps" ]
then
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
tput setaf 6 ; tput bold ;	echo ""
	echo "Uma base de dados de usuários ('usuarios.db') foi encontrada!"
	echo "Deseja mantê-la (preservando o limite de conexões simultâneas dos usuários)"
	echo "ou criar uma nova base de dados?"
	tput setaf 6 ; tput bold ;	echo ""
	echo "[1] Manter Base de Dados Atual"
	echo "[2] Criar uma Nova Base de Dados"
	echo "" ; tput sgr0
	read -p "Opção?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "Deseja ativar a compressão SSH (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
rm /bin/criarusuario /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/listar /bin/sshmonitor /bin/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install bc screen nano unzip iptables dos2unix wget git htop python -y
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
fi
wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/twossh/TwoSSH-FULL/master/scripts/sshd_config
service ssh restart
banner_config(){ echo "© TwoSSH | 2018 All rights reserved" > /etc/bannerssh
}
banner_config
wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/banner.sh -O /bin/banner
	chmod +x /bin/banner
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/firewall.sh -O /bin/firewall
	chmod +x /bin/firewall
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/firewall2.sh -O /bin/firewall2
	chmod +x /bin/firewall2
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/torrent.sh -O /bin/torrent
	chmod +x /bin/torrent
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/twossh/TwoSSH/master/scripts/socks -O /bin/socks
	chmod +x /bin/socks
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/openvpn.sh -O /bin/openvpn
	chmod +x /bin/openvpn
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/twossh/TwoSSH/master/scripts/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/badvpnsetup2.sh -O /bin/badvpnsetup
	chmod +x /bin/badvpnsetup
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/tcptweaker.sh -O /bin/tcptweaker
	chmod +x /bin/tcptweaker
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/userbackup.sh -O /bin/userbackup
	chmod +x /bin/userbackup
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/otimizar.sh -O /bin/otimizar
	chmod +x /bin/otimizar
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/speedtest.sh -O /bin/speedtest
	chmod +x /bin/speedtest
	wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/speedtest.py -O /bin/speedtest.py
	chmod +x /bin/speedtest.py
    wget https://raw.githubusercontent.com/twossh/vpsmanager/master/scripts/detalhes.sh -O /bin/detalhes
	chmod +x /bin/detalhes
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
clear
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo -e "Proxy Socks Instalado, OpenSSH rodando na porta 22" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Scripts para gerenciamento de usuário instalados" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo -e "Para ver os comandos disponíveis use o comando: \033[1;31majuda\033[0m" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Mod by TwoSSH" ; tput sgr0
rm /root/inst.sh
echo ""
if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit 1
