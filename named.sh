
#--> Remove old BIND
rpm -qa | grep bind
rpm -e --nodeps bind-9.8.2-0.17.rc1.el6_4.6.x86_64
rpm -e --nodeps bind-libs-9.8.2-0.17.rc1.el6_4.6.x86_64
rpm -e --nodeps bind-utils-9.8.2-0.17.rc1.el6_4.6.x86_64
rpm -qa | grep '^bind'
#--<


#--> Setup Centos Repos
sed -i 's/enabled=1/enabled=0/g' redhat.repo
sed -i 's/enabled=1/enabled=0/g' local.repo
rpm -Uvh http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
rpm -Uvh http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6.rpm
rpm -import http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
rpm --import http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
cd /etc/pki/rpm-gpg/
wget http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
rpm --import RPM-GPG-KEY-CentOS-6
sed -i 's/enabled=0/enabled=1/g' *.repo
#--<


#--> Update packages
yum install -y gcc openssl openssl-devel
#--<


#--> Prepare environment
echo "named:x:200:200:Nameserver:/chroot/named:/bin/nologin" >> /etc/passwd
echo "named:x:200:" >> /etc/group
mkdir -p /chroot/named
cd /chroot/named
mkdir -p dev etc/namedb/slave var/run
chown -R named:named /chroot/named/etc/namedb/slave
chown named:named /chroot/named/var/run
mknod /chroot/named/dev/null c 1 3
mknod /chroot/named/dev/random c 1 8
chmod 666 /chroot/named/dev/{null,random}
cp /etc/localtime /chroot/named/etc/
#--<


#--> Install BIND from source
tar xvzf /tmp/bind-9.9.5-P1.tar.gz
cd /tmp/bind-9.9.5-P1/
./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--enable-threads \
	--localstatedir=/var/state \
	--with-libtool \
	--with-openssl=/usr/ssl \
	--with-pkcs11
make
make install
#--<


#--> Test startup
/usr/local/sbin/named start -u named -t /var/named/chroot/ -c /etc/named.conf start
#--<

# -------------------------------------------------------------------------------

/usr/local/sbin/named start -u named -t /var/named/chroot/ -c /etc/named.conf start

#--> Startup Script

mv /etc/rc.d/init.d/named /tmp/named.initscript.old

cat << '_ENDofSCRIPT_' > /etc/rc.d/init.d/named

#!/bin/sh
#
# named This shell script takes care of starting and stopping
# named (BIND DNS server).
#
# chkconfig: 345 55 45
# description: named (BIND) is a Domain Name Server (DNS) \
# that is used to resolve host names to IP addresses.
# probe: true
#
# Source function library.
. /etc/rc.d/init.d/functions
#
# Source networking configuration.
. /etc/sysconfig/network
#
# Check that networking is up.
[ ${NETWORKING} = "no" ] && exit 0
#
[ -f /usr/local/sbin/named ] || exit 0
[ -f /var/named/chroot/etc/named.conf ] || exit 0
#
PIDFILE="/var/named/chroot/var/run/named/named.pid"
#
# See how we were called.
case "$1" in
        start)
                # Start daemons.
                echo -n "Starting named: "
                daemon --pidfile "$PIDFILE" /usr/local/sbin/named -u named -t /var/named/chroot -c /etc/named.conf
                echo
                touch /var/lock/subsys/named
                ;;

         stop)
                # Stop daemons.
                echo -n "Shutting down named: "
                #killproc -p "$PIDFILE" named
                /usr/local/sbin/rndc -k /var/named/chroot/etc/rndc.key stop
                echo
                rm -f /var/lock/subsys/named
                rm -f /var/named/chroot/var/run/named/named.pid
                ;;

        status)
                /usr/local/sbin/rndc -k /var/named/chroot/etc/rndc.key status
                #status -p "$PIDFILE" -l named /usr/local/sbin/named;
                #return $?
                #status named
                exit $?
                ;;

        restart)
                $0 stop
                $0 start
                exit $?
                ;;

        reload)
                /usr/local/sbin/rndc -k /var/named/chroot/etc/rndc.key reload
                exit $?
                ;;

        probe)
                # named knows how to reload intelligently; we don't want linuxconf
                # to offer to restart every time
                /usr/local/sbin/rndc reload >/dev/null 2>&1 || echo start
                exit 0
                ;;
        #

        *)
                echo "Usage: named {start|stop|status|restart|reload}"
                exit 1
esac
#
exit 0

_ENDofSCRIPT_
#--<


#--> Test startup script
vi /etc/rc.d/init.d/named
service named start
service named status
service named restart
service named stop
#--<



vi /var/named/chroot/etc/named.conf

named-checkconf -t /var/named/chroot/

