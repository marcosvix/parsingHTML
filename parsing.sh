
#!/bin/bash
if [ "$1" == "" ]
then
	echo -e  "\033[00;32mPARSING-HTML\e[00m"
	echo -e "\033[00;32mMANUAL $0\e[00m"
	echo -e "\033[00;32Exemplo: $0 www.google.com\e[00m"
else
	wget --quiet $1
	echo -e "\033[00;33m=================================================================================\e[00m"
	echo -e "\0033[00;33m  [+] Buscando subdominios em: $1                                         \e[00m "
        echo -e "\033[00;33m=================================================================================\e[00m"
	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v " <l" | sort | uniq >lista
for url in $(cat lista);
do
	host $url|grep "has address"| cut -d " " -f 4 | sort |uniq >> ip;

done

	echo -e "\033[00;33m=================================================================================\e[00m"
	echo -e "\033[00;33m               IP                              ADDRESS                                  \e[00m " 
	echo -e "\033[00;33m=================================================================================\e[00m"

	while read line2;
	do
	while read line1;
	do
		echo -e "\033[01;32m     $line1                                    $line2                     \e[00m ";
	done < ip;
	done < lista;
	
	echo -e "\033[00;33m=================================================================================\e[00m"

rm index.html lista ip
fi
