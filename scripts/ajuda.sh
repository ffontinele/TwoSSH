#!/bin/bash
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Comandos disponíveis:" ; tput sgr0 ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "criarusuario " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Criar usuário SSH sem acesso ao terminal e com data de expiração" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "alterarlimite " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Alterar o número máximo de conexões simultâneas permitidas para um usuário" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "alterarsenha " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Alterar a senha de um usuário" ; echo "" ;
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "mudardata " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Mudar a data de expiração de um usuário" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "socks " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Ativa o proxy Socks5 nas portas 80 e 443" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "remover " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Remover um usuário SSH" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "userbackup " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Cria uma cópia de todos os usuários e senhas" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "expcleaner " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Remover usuários SSH expirados" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "sshlimiter " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Limitador de conexões SSH simultâneas (deve ser executado em uma sessão screen)" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "sshmonitor " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Verifica o número de conexão simutânea de cada usuário" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "badvpnsetup " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Instala automaticamente o programa BadVPN" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "banner " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Criar um banner em seu vps" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "tcptweaker " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Altera algumas configurações de rede no sistema para reduzir a latência e melhorar a velocidade" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "speedtest " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Teste de conexão interna do servidor" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "otimizar " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Atualizar pacotes, limpar memória RAM e cache" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "firewall " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Ant Torrent e DDoS" ; echo ""
tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "detalhes " ; tput setaf 7 ; printf '%s' "- " ; tput setaf 3 ; echo "Informações do servidor (Uptime, RAM etc)" ; echo ""
tput sgr0
