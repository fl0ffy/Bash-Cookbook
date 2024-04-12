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
                killproc -p "$PIDFILE" named
                echo
                rm -f /var/lock/subsys/named
                rm -f /var/named/chroot/var/run/named/named.pid
                ;;

        status)
                status -p "$PIDFILE" -l named /usr/local/sbin/named;
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
                /usr/local/sbin/rndc reload
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
