#!/usr/bin/env bash

WORK_DIR="/home/box"
PROJ_DIR="$WORK_DIR/web"


function init_nginx {
    sudo ln -sf $PROJ_DIR/etc/nginx.conf /etc/nginx/sites-enabled/nginx.conf
    sudo rm -rf /etc/nginx/sites-enabled/default
    sudo /etc/init.d/nginx restart
}

function init_gunicorn {
    sudo rm /etc/gunicorn.d/*
    sudo ln -sf $PROJ_DIR/etc/gunicorn.conf /etc/gunicorn.d/gunicorn.conf
    sudo /etc/init.d/gunicorn start
}


case "$1" in
    init)
        init_nginx
        init_gunicorn
        ;;

    start)
        sudo /etc/init.d/nginx start
        sudo /etc/init.d/gunicorn start
        ;;

    restart)
        sudo /etc/init.d/nginx restart
        sudo /etc/init.d/gunicorn restart
        ;;

    stop)
        sudo /etc/init.d/nginx stop
        sudo /etc/init.d/gunicorn stop
        ;;

    *)
        echo "Usage: $0 {init|start|stop|restart}" >&2
        exit 1
    ;;
esac