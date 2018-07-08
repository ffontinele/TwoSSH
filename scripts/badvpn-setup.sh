#!/bin/bash

BADVPN="/home/DATABASE/BadVPN"
UDP="/bin/udp"

if [ -f "$UDP" ]; then
  echo ""
  echo -e "\033[01;37;41mVocê já possui o BadVPN instalado!\033[0m"
  sleep 3s
  badvpn-menu
  exit 
else
  clear
  echo -ne "\033[01;37;41m"; echo -e "\033[01;37m        >> ADM FULL <<        "; echo -ne "\033[0m"
  echo -e "$linha" 
  echo ""
  echo -e "\033[01;32mATUALIZANDO REPOSITÓRIOS..."
  apt-get update 1> /dev/null 2> /dev/null
  echo -e "\033[01;32mINSTALANDO DEPENDÊNCIAS..."
  apt-get install build-essential -y 1> /dev/null 2> /dev/null
  apt-get install gcc -y 1> /dev/null 2> /dev/null
  apt-get install g++ -y 1> /dev/null 2> /dev/null
  apt-get install make -y 1> /dev/null 2> /dev/null
  echo -e "\033[01;32mBAIXANDO E EXTRAINDO RECURSOS..."
  mkdir $BADVPN
  cd $BADVPN
  wget -q --no-check-certificate http://www.cmake.org/files/v2.8/cmake-2.8.12.tar.gz 1> /dev/null 2> /dev/null 
  wget -q --no-check-certificate https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/badvpn/badvpn-1.999.128.tar.bz2 1> /dev/null 2> /dev/null 
  tar xvzf cmake-2.8.12.tar.gz 1> /dev/null 2> /dev/null 
  tar xf badvpn-1.999.128.tar.bz2 1> /dev/null 2> /dev/null
  echo -e "\033[01;32mCOMPILANDO E INSTALANDO RECURSOS..."
  cd $BADVPN/cmake-2.8.12
  ./bootstrap --prefix=/usr 1> /dev/null 2> /dev/null
  make 1> /dev/null 2> /dev/null 
  make install 1> /dev/null 2> /dev/null 
  cd $BADVPN/badvpn-1.999.128
  cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 1> /dev/null 2> /dev/null
  make install 1> /dev/null 2> /dev/null 
  echo -e "\033[01;32mCONFIGURANDO BADVPN..."
  echo "#!/bin/bash

badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 8" > $UDP
  chmod a+x $UDP
  clear
  echo -ne "\033[01;37;41m"; echo -e "\033[01;37m        >> ADM FULL <<        "; echo -ne "\033[0m"
  echo -e "$linha" 
  echo ""
  echo -e "\033[01;33m BadVPN instalado com sucesso!"
fi
echo ""
echo -e "\033[01;37m APERTE A TECLA ENTER PARA VOLTAR AO MENU..."
read ENTER
badvpn-menu
exit