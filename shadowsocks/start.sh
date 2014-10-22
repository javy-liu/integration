
if [ ! -f /etc/shadowsocks.json ]; then
	echo '{ 
    "server":"'$SS_SERVER'", 
    "server_port":'$SS_PORT', 
    "local_address": "'$SS_LOCAL_ADDRESS'", 
    "local_port":'$SS_LOCAL_PORT', 
    "password":"'$SS_PASSWORD'", 
    "timeout":'$SS_TIMEOUT',
    "method":"'$SS_METHOD'", 
    "fast_open": '$SS_FAST_OPEN', 
    "workers": '$SS_WORKERS' 
}' > /etc/shadowsocks.json
fi

/usr/local/bin/supervisord -n