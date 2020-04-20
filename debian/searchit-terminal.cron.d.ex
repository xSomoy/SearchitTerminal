#
# Regular cron jobs for the searchit-terminal package
#
0 4	* * *	root	[ -x /usr/bin/searchit-terminal_maintenance ] && /usr/bin/searchit-terminal_maintenance
