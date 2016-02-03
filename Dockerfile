FROM elasticsearch:2.1
MAINTAINER Bachue Zhou "bachue.shu@gmail.com"

RUN echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib' > /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --force-yes maven openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*
ADD https://github.com/medcl/elasticsearch-analysis-ik/archive/v1.7.0.tar.gz /tmp/elasticsearch-analysis-ik.tar.gz
RUN tar -xvf /tmp/elasticsearch-analysis-ik.tar.gz -C /tmp && \
    cd /tmp/elasticsearch-analysis-ik-1.7.0 && \
    mvn package && \
    unzip target/releases/elasticsearch-analysis-ik-1.7.0.zip -d /usr/share/elasticsearch/plugins/ik && \
    cd / && \
    rm -rf /tmp/elasticsearch-analysis-ik*
