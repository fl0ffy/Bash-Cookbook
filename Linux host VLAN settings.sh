
#################################################################
#								#
#		Linux host VLAN settings			#
#								#
#################################################################

modprobe 8021q

vconfig add eth0 <VLANID>

vi /etc/sysconfig/networ-scripts/ifcfg-eth0.<VLANDID>

	# VLAN=yes
	# DEVICE=eth0.<VLANID>
	# ...

vi /etc/sysconfig/networ-scripts/static-routes

	amend applicable interface names to match

service network restart