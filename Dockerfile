FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk jsvc curl mongodb-server openjdk-8-jre-headless vim net-tools
RUN update-alternatives --config java
RUN ln -s /usr/lib/jvm/java-8-openjdk-amd64 default-java

COPY entrypoint.sh entrypoint.sh /root/

ADD https://static.tp-link.com/upload/software/2022/202201/20220120/Omada_SDN_Controller_v5.0.30_linux_x64.deb /tmp/
RUN  dpkg-deb -R /tmp/Omada_SDN_Controller_v5.0.30_linux_x64.deb /tmp/omada
RUN mv /tmp/omada/opt/tplink /opt/
RUN rm -rf \
  /tmp/Omada_SDN_Controller_v5.0.30_linux_x64.deb \
  /tmp/omada

RUN mkdir -p /data/db

CMD /root/entrypoint.sh
