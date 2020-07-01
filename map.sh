#! /bin/bash
# Script Para Mapeamento de Pastas de Rede
# Diego Nunes - 11/06/2020

userMap=$(zenity --entry --title="Mapear Pasta de Rede" --text "Informe usuário:" --width="230")
pasta=$(zenity --entry --title="Mapear Pasta de Rede" --text "Informe diretório:" --width="230")
pastaUpper=$(echo "$pasta" | tr 'a-z' 'A-Z')
pastaUpper=$(echo $pastaUpper"_REDE")
pastaLow=$(echo "$pasta" | tr 'A-Z' 'a-z')
pastaLowPass=$(echo $pastaLow"****")
userId=$(id -u $userMap)

if [[ $userMap == "" ]] || [[ $pasta == "" ]];
then
	zenity --warning --title "Mapear Pasta de Rede" --text="Informe Usuário e a Pasta para mapear"
	exit 0
else
	mkdir -p /home/$userMap/$pastaUpper
	chmod 777 /home/$userMap/$pastaUpper
	echo //192.168.0.0/$pastaLow /home/$userMap/$pastaUpper cifs username=$pastaLow,password=$pastaLowPass,uid=$userId,iocharset=utf8,file_mode=0777,dir_mode=0777,rsize=262144,wsize=262144,vers=1.0 >> /etc/fstab
fi

echo ""
echo "====================================================="
echo "Mapeamento para pasta $pastaLow adicionado no fstab:"
echo "====================================================="
sleep 2
grep $pastaLow /etc/fstab
echo ""
echo "================="
echo "Rodando mount -a"
echo "================="
sleep 1
mount -a
exit 0

