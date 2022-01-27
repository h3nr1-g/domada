#!/bin/bash
set -x

if [ ! -d "/opt/tplink/EAPController/data/db" ]; then
  mkdir -p "/opt/tplink/EAPController/data/db"
fi

mongod \
	--port 27217 \
	--fork \
	--logpath /tmp/mongo.log

/usr/bin/jsvc \
	-cwd /opt/tplink/EAPController/lib \
	-pidfile /var/run/omada.pid \
	-home /usr/lib/jvm/java-8-openjdk-amd64/jre/ \
	-cp '/usr/share/java/commons-daemon.jar:/opt/tplink/EAPController/lib/*:/opt/tplink/EAPController/properties' \
	-outfile /opt/tplink/EAPController/logs/startup.log \
	-errfile /opt/tplink/EAPController/logs/startup.log \
	-user root \
	-procname omada \
	-showversion \
	-server \
	-Xms128m \
	-Xmx1024m \
	-XX:MaxHeapFreeRatio=60 \
	-XX:MinHeapFreeRatio=30 \
	-XX:+HeapDumpOnOutOfMemoryError \
	-XX:HeapDumpPath=/opt/tplink/EAPController/logs/java_heapdump.hprof \
	-Djava.awt.headless=true \
	com.tplink.smb.omada.starter.OmadaLinuxMain start

echo "Open your browser and go to http://127.0.0.1:8088"
sleep infinity