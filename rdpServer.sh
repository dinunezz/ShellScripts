#! /bin/bash
# Script de Acesso ao Terminal Service
# Diego Nunes - Fev2020

numb=$((($RANDOM %11) + 1))

case $numb in
1) ipRand="192.168.3.39";;
2) ipRand="192.168.3.40";;
3) ipRand="192.168.3.41";;
4) ipRand="192.168.3.42";;
5) ipRand="192.168.3.45";;
6) ipRand="192.168.3.46";;
7) ipRand="192.168.3.48";;
8) ipRand="192.168.3.51";;
9) ipRand="192.168.3.52";;
10) ipRand="192.168.3.53";;
11) ipRand="192.168.3.54";;
*) ipRand="192.168.3.51";;
esac

userRdp=$(zenity --entry --title="Acesso WinThor" --text "Informe seu usuário:")
passRdp=$(zenity --password --title="Acesso WinThor" --text "Informe seu usuário:")
dataLog=$(date +%d-%m-%Y" "[%H:%M:%S])

if [[ $userRdp == "" ]] || [[ $passRdp == "" ]];
then

	zenity --warning --title "Acesso WinThor" --text="Informe Usuário e Senha"

else
	
	echo $userRdp "->" $dataLog "Terminal $numb:" $ipRand >> ~/rdpClient.log
	rdesktop -5 -a 16 -g 1360x670 $ipRand -u $userRdp -p $passRdp -d retaguarda
	
fi
exit 0
