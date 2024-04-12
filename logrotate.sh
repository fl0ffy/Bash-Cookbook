vi /etc/logrotate.d/audit
chmod +r /etc/logrotate.d/audit

# ---------------------------------------------

/Path to Log/log
{
	daily
	rotate 30
	dateext
	missingok
	compress
	compressoptions -9
	delaycompress
	notifempty
	copytruncate
		
}

# ---------------------------------------------

/var/log/audit/audit.log
{
	daily
	rotate 30
	dateext
	missingok
	compress
	compressoptions -9
	delaycompress
	notifempty
	copytruncate
	postrotate
		/sbin/service auditd restart 2> /dev/null > /dev/null || true
	endscript
	
}

# --------------------------------------------------
#Maintains the usage of logrotate but essentially scripts everything much like a cron job

/opt/jboss/standalone/log/server.log*
{
	daily
	rotate 30
	postrotate
		for i in $(ls /opt/jboss/standalone/log/server.log*) ; do if [[ $(echo $i | cut -d"." -f3) == $(date --date="-1 day" +%Y-%m-%d) ]] && [[ $(echo $i | cut -d"." -f4) != gz ]] ; then gzip -f -9 $i ; fi ; find /opt/jboss/standalone/log/server.log* -mtime +30 -exec rm -f {} \;
	endscript
}

# ---------------------------------------------
#Scripts the log to hit logs with a specific date extension parameters

/opt/jboss/standalone/log/server.log$(date --date="-1 day" +%Y-%m-%d)
{
	daily
	missingok
	rotate 30
	compress
	compressoptions -9
}

$(find /opt/jboss/standalone/log/server.log* -mtime +1 -mtime -40 -print)
{
	daily
	missingok
	rotate 30
}


# ---------------------------------------------
#standard logratate without outside influence

/opt/jboss/standalone/log/server.log
{
	daily
	rotate 30
	dateext
	missingok
	compress
	compressoptions -9
	delaycompress
	notifempty
	copytruncate
		
}

# ---------------------------------------------
