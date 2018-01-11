#!/bin/bash +e
# catch signals as PID 1 in a container

pidmosq=0

# SIGNAL-handler
term_handler() {

  echo "terminating mosquitto ..."
  if [ $pidmosq -ne 0 ]; then
    kill -SIGTERM "$pidmosq"
     wait "$pidmosq"
  fi


  exit 143; # 128 + 15 -- SIGTERM
}

# on callback, stop all started processes in term_handler
trap 'kill ${!}; term_handler' SIGINT SIGKILL SIGTERM SIGQUIT SIGTSTP SIGSTOP SIGHUP

#create mosquitto configuration file
cat >  /etc/mosquitto/mosquitto.conf <<EOF
pid_file /var/run/mosquitto.pid
persistence true
persistence_location /var/lib/mosquitto/
log_dest file /var/log/mosquitto/mosquitto.log
user mosquitto
include_dir /etc/mosquitto/conf.d
EOF

# run applications in the background
echo "starting mosquitto ..."
/usr/local/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf &
pidmosq="$!"

# wait forever not to exit the container
while true
do
  tail -f /dev/null & wait ${!}
done

exit 0
