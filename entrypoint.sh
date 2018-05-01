#!/bin/sh

if [ ! -e /squid/squid.pem ]; then
	cd /squid/
	openssl req -new -newkey rsa:2048 -sha256 -days 3650 -nodes -x509 -extensions v3_ca -keyout squid.pem -out squid.pem -subj "/C=FR/ST=Paris/L=Paris/O=Global Security/OU=IT Department/CN=example.com"
	openssl x509 -in squid.pem -outform DER -out squid.der
	cd -
fi

if [ "a$1" = "a" ]; then
	/opt/squid/sbin/squid -z -f /opt/squid/squid.conf
	rm -rf /opt/squid/var/lib/
	mkdir -p /opt/squid/var/lib
	/opt/squid/libexec/ssl_crtd -c -s /opt/squid/var/lib/ssl_db
	chown -R squid:squid /opt/squid/
	/opt/squid/sbin/squid -NF -f /opt/squid/squid.conf
fi

