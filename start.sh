#!/bin/bash
g="${b}\033[1;30m"
b="\033[0m"
b1="$b\033[1;37m"
r="${b}\033[1;31m"
r1="${b}\033[31m"
A="${b}\033[1;34m"
A1="${b}\033[34m"
ac="${b}\e[1;36m"
ac1="${b}\e[36m"
v="${b}\033[1;32m"
v1="${b}\033[32m"
m="$b\033[1;35m"
m1="$b\033[35m"
a="$b\033[1;33m"
a1="$b\033[33m"
cy="$b\033[38;2;23;147;209m"
data="$(pwd)/data"
trap finished INT
finished() {
	sleep 0.2
	echo -e "\n"
	printf "${v1}[${b}+${v1}]${b} Finished\n"
	printf "${v1}[${b}+${v1}]${b} Created by Jose Zpt\n"
	printf "${v1}[${b}+${v1}]${b} Gracias por utilizar mi herramienta\n"
	printf "${v1}[${b}+${v1}]${b} servicio de ayuda https://t.me/JoseZpt${b}\n"
	printf "\n"
	exit
}
if [[ "$(pwd)" == "${HOME}/T-banner3"  ]]; then
	ruta="${HOME}/T-banner3"
else
	ruta="$(pwd)"
fi
if [[ -e ${data} && -e "${data}/layout" && -e "${data}/motd" && -e "${data}/bash.bashrc" ]]; then
	true
else
	echo "\n${b}[${r1}*${b}] Error, reinstalando herramienta...\n"
	cd ${ruta}/..
	rm -rf T-banner3
	git clone https://github.com/JoseZpt/T-banner3
        if [[ ! -e "T-banner3" ]]; then
		echo -e "\n${b}[${r1}*${b}] Revisa tu conexion a internet\n"
		exit
	else
		cd T-banner3
		bash start.sh
	fi
fi
command -v toilet > /dev/null 2>&1 || { sleep 0.5; echo >&2 -e "\n$v1[$b1*$v1]$b Instalando toilet..."; pkg install toilet -y &>> /dev/null;sleep 0.5;}
T-banner() {
	clear
	echo -e "${v1}"
	echo -e "__ __|     |"
	echo -e "   |       __ \   _' | __ \  __ \   _ \  __|"
	echo -e "   |_____| |   | (   | |   | |   |  __/ |"
	echo -e "  _|      _.__/ \__,_|_|  _|_|  _|\___|_|"
	echo -e "${b}"
	sleep 0.0
}
banner() {
	T-banner
	printf "${v1}Digite un${r1} nombre${v1}\n└═>${b} "
	read name
	echo
	printf "${v1}Digite un${r1} subnombre${v1}\n└═>$b "
	read subname
	echo
	rm -rf $PREFIX/etc/bash.bashrc
	rm -rf $PREFIX/etc/motd
	if [[ ${name} == "" ]]; then
		name="Name Defaul"
	fi
	if [[ ${subname} == "" ]]; then
		subname="SubName Defaul"
	fi
	echo -e "${b}[${v1}+${b}]${r1} Iniciando${b} banner personalizado"
	sleep 6
	name2=$(echo -e "$name" |sed 's/ /___/g')
	subname2=$(echo -e "$subname" |sed 's/ /___/g')
	sed 's/sub_name/'${name2}'/g' ${ruta}/data/layout | sed 's/name/'${subname2}'/g' >> $PREFIX/etc/bash.bashrc
	sed -i 's/___/ /g' $PREFIX/etc/bash.bashrc
	echo -e "\n${b}[${v1}++${b}] Hecho\n"
	sleep 1
	bash $PREFIX/etc/bash.bashrc
}
delete() {
	T-banner
	echo -e "${b}[${v1}+${b}]${r1} Eliminando${b} banner personalizado"
	sleep 5
	rm -rf $PREFIX/etc/motd
	cp ${ruta}/data/motd $PREFIX/etc
	rm -rf $PREFIX/etc/bash.bashrc
	cp ${ruta}/data/bash.bashrc $PREFIX/etc
	clear
	cat ${ruta}/data/motd

}
menu() {
	T-banner
	echo -e "${v1} Menu de ayuda"
	printf "\n"
	printf "${A1} [${b}01${A1}]${b} Configurar banner\n"
	printf "\n"
	printf "${A1} [${b}02${A1}]${b} Eliminar banner\n"
	printf "\n"
	printf "${A1} [${b}03${A1}]${b} Contacto${cy}(Telegram)\n"
	printf "\n"
	printf "${A1} [${b}04${A1}]${b} Salir\n"
	printf "\n"
	start
}
start() {
	printf "${v1}[${b}++${v1}]${v} T-banner3${b}: "
	read opcion
	case $opcion in
	01|1)
		banner
	;;
	02|2)
		delete
	;;
	03|3)
		am start -a android.intent.action.VIEW https://t.me/JoseZpt &>> /dev/null
		echo -e "\n${b}[${v1}++${b}] Hecho\n"
	;;
	04|4)
		finished
	;;
	*)
		echo -e "${v1}Comando: '"${r1}${opcion}${v1}"' invalido."
		echo ""
		start
	esac
}
menu
