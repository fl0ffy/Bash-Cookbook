
#################################################################
#								#
#		Extending Linux partitions			#
#								#
#################################################################

fdisk -l
df -h
vgs

fdisk /dev/sda
	# n
	# p
	# 3
	# <ENTER>
	# <ENTER>
	# t
	# 3
	# 8e
	# w

partprobe - s /dev/sda  OR reboot

pvcreate /dev/sda3
pvdisplay

vgextend VolGroup00 /dev/sda3
vgdisplay

lvextend /dev/VolGroup00/vol_opt /dev/sda3
lvresize -l +100%FREE /dev/VolGroup00/vol_opt
lvdisplay /dev/VolGroup00/vol_opt

resize2fs /dev/VolGroup00/vol_opt

# -------------------Extending Swap partition--------------------

fdisk -l
df -h
vgs

fdisk /dev/sda
	# n
	# p
	# 3
	# <ENTER>
	# <ENTER>
	# t
	# 3
	# 8e
	# w

partprobe - s /dev/sda  OR reboot

pvcreate /dev/sda3
pvdisplay

vgextend VolGroup00 /dev/sda3
vgdisplay

swapoff -v /dev/VolGroup00/vol_swap

lvextend /dev/VolGroup00/vol_swap /dev/sda3
lvresize -l +100%FREE /dev/VolGroup00/vol_swap
lvdisplay /dev/VolGroup00/vol_swap

swapon -va
swapon -s

# --------------------Troubleshooting--------------------

#If you try to increase a logical volume when root is full, e.g.

lvextend —r -L +100mb /dev/vg/lv

#you will get an error,

#  “Couldn't create temporary archive name.
#  Volume group "vg" metadata archive failed.”

#because there is no space to write the metadata archive under /etc.

#So, if you were trying to enlarge the logical volume for root you’re stuck. The solution is to #disable the autobackup of the metadata:

lvextend -A n -L +100mb /dev/vg/lv