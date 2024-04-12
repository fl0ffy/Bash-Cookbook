#################################################################
#								#
#			NetApp					#
#								#
#################################################################

# =================================================================
# ===================console connection============================
# =================================================================
#==> use serial cable

# �����for mac����
#connect usb/serial cable on mac
cd /dev
ls -ltr /dev/*usb*
	#use tty
screen /dev/tty.usbmodem1a21 9600

#To Disconnect the OS X USB Console from the Terminal Window
Enter Ctrl+A followed by Ctrl+\

# �����for windows����
#connect usb/serial cable on pc
open putty
select correct com port (look in devices)
select serial

# =================================================================
# ===========================Network===============================
# =================================================================

#==> add lines to /etc/rc to make persistent
ifconfig <inet> <IPAddr> netmask <netmask>
route add default <gateway>

# =================================================================
# ===========================Disks=================================
# =================================================================
#check for spare disks
aggr status -s 
#assign disks to filer
disk assign <disk_id>
#remove disks from filer
disk remove_ownership <disk_id>

#example
disk assign 0a.01.21 0a.01.22
disk remove_ownership 0a.01.21

# =================================================================
# ==========================Aggregates=============================
# =================================================================
#��create aggr�-
aggr create <aggr_name> -t <raid_type> -r <nRaiddisks> -d <disk_ids>
#example
aggr create tmp_aggr -t raid_dp -r 3 -d 0a.01.21 0a.01.22 0a.01.23
OR
aggr create <aggr_name> -t <raid_type> -r <nRaiddisks> <nDisks>@<size_of_disks_in_GB>
#example
aggr create aggr0 -t raid_dp -r 6 6@2543

# =================================================================
# ===========================Volumes===============================
# =================================================================
#��Create vol��
vol create <vol_name> <aggr_name> <size>
#example
vol create vol0_tmp tmp_aggr 2220g

#���Copy volume���
vol restrict <destination_vol>
vol copy start <source_vol> <destination_vol>
vol online <destination_vol>
#example
vol restrict home_tmp
vol copy start home home_tmp
vol online home_tmp

#�delete volume��
vol offline <vol_name>
vol destroy <vol_name>
#example
vol offline home
vol destroy home

#��Set volume to root volume���
vol options <vol_name> root
reboot
#verify vol is root
vol status

#��Resize a flex vol��
#add or subtract space to current size
vol size <+/-><size>
#state what the end size will be
vol size <size>

#examples
vol size home_tmp +1g
vol size home_tmp -2g
vol size home_tmp 5g

# =================================================================
# ========================NFS Exports==============================
# =================================================================

#==> exports are automatically created when volumes are created

# =================================================================
# ========================CIFS Shares==============================
# =================================================================

#==> this links to Windows domain and there can only be one domain at a time unless vfilers are used

# =================================================================
# ============================LUNs=================================
# =================================================================

#Host-------------------------------------------------------------

ping <target>

iscsiadm -m discovery -t st -p <targetIP>

iscsiadm -m node


#Get IQN
#If installed OS then it should be unique
#If OS is copied you will need to change

vi /etc/iscsi/initiatorname.iscsi

	InitiatorName= iqn.1986-03.com.ibm:iscsihost.0

#NetApp-----------------------------------------------------------

#Create Vol

#Create LUN

#creates one 4GB Lun on the iscsiLunVol volume:
lun create -s 4g -t linux /vol/iscsiLunVol/testlun1
lun show

#Create iGroup

iscsi initiator show
igroup create -i -t linux Debian2 iqn.1993-08.org.debian:01.35ef13adb6d
igroup show

#Map iGroup
lun map /vol/iscsiLunVol/testlun1 Debian2p
lun show -v

#Host-------------------------------------------------------------

#makes the disk accessible from the Linux host
iscsiadm -m node --login

fdisk -l

#If you want to use sdb after the next reboot, you should change the following entry:
vi /etc/iscsi/iscsid.conf
	node.startup = automatic

#################################################################
#								#
#			Appendix A				#
#								#
#################################################################

ifconfig -a
route -s
disk show -a
aggr status -s
aggr status -r
vol status -r
sysconfig 
exportfs
storage show