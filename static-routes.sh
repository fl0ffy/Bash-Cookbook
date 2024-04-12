
#################################################################
#								#
#			Static routes				#
#								#
#################################################################

# =================================================================
# =============================Linux===============================
# =================================================================

#add temporary route
route add -net 192.168.102.0 netmask 255.255.255.0 gw 192.168.101.1

----
#make route persistent
echo "192.168.102.0/24 via 192.168.101.1" >> /etc/sysconfig/network-scripts/route-eth1

----
#add a whole bunch of static routes
vi /etc/sysconfig/static-routes

#entry for routed networks
any net x.x.x.0 netmask 255.255.255.0 gw x.x.x.1 eth0

#entry for non-routed networks
any net x.x.x.0 netmask 255.255.255.0 eth0

# =================================================================
# ============================Windows==============================
# =================================================================

# Open cmd as administrator

#view routes
route print

#delete routes
route delete <networkIP>

#add persistent route
route add -p x.x.x.0 MASK 255.255.255.0 <IPof Interface>

#example
route add -p 10.10.1.0 MASK 255.255.255.0 10.10.1.190