#!/bin/bash
#
# author: excalibur
# emial:lzy7750015@gmail.com
# 
# description: 配置 redis , mysql, tomcat 和 nginx ，并且启动他们
# 

usage()
{
    echo "Usage: `basename $0` [-options]"
    echo "[-options]:"
    echo "-h		help info."
    echo "-h		help info."

    exit 1
}

TEMP=`getopt -o hr::m::t::n:: --long redis::,mysql::,tomcat::,nginx::,redis-pass:,mysql-root: \
     -n 'example.bash' -- "$@"`

# 默认配置（不指定参数时候）
if [ $# -eq 0 ] ; then 
	echo -e "Use \033[1;32mDefault\033[0m config!"
fi

redis()
{
    echo "redis"
    if [ -z "$1" ] ; then 
    	echo "$1"
	else
		echo "使用 redis"
	fi
    
}

# Note the quotes around `$TEMP': they are essential!
#set 会重新排列参数的顺序，也就是改变$1,$2...$n的值，这些值在getopt中重新排列过了
eval set -- "$TEMP"

# 进行具体配置
while true ; do
    case "$1" in
            -r) echo redis "$2"; shift ;;
            -m) echo "config mysql-port $2" ; shift ;;
            -t) echo "config tomcat-port $2" ; shift ;;
            -n) echo "config nginx-port $2" ; shift ;;
            --redis-pass) echo "config nginx-port $2" ; shift ;;
            --mysql-root) echo "config nginx-port $2" ; shift ;;
            --) shift ; break ;;
            *) echo "allways" ; exit 1 ;;
    esac
done
echo "Remaining arguments:"
for arg do
   echo '--> '"\`$arg'" ;
done