
#################################################################
#								#
#			NTP					#
#								#
#################################################################

# =================================================================
# =============================Linux===============================
# =================================================================

service ntpd stop
echo �server x.x.x.x� >> /etc/ntp.conf
ntpdate x.x.x.x
service ntpd start
chkconfig ntpd on

# =================================================================
# ========================Linux (hardened)=========================
# =================================================================

service ntpd stop
chkconfig ntpd off
echo -e '15 * * * * root /usr/bin/ntpdate <server>' >> /etc/cron.d/ntp

# =================================================================
# ============================Windows==============================
# =================================================================

Open cmd as administrator

net stop w32time
w32tm /unregister
w32tm /unregister
w32tm /register
net start w32time
w32tm /config /manualpeerlist:x.x.x.x /syncfromflags:MANUAL /update
w32tm /query /source