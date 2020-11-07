FROM fluentd:latest
MAINTAINER l4m
RUN apk update -y && \
    apk install -y ruby-dev g++ make && \
    gem install fluentd fluent-plugin-secure-forward fluent-plugin-elasticsearch && \
    gem install fluent-plugin-elasticsearch && \ 
    apk remove --purge -y  $(apt-mark showauto) && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# RUN gem install fluent-plugin-mqtt-io
# RUN gem install fluent-plugin-elasticsearch
# USER ubuntu
#WORKDIR /home/ubuntu
# ENV PATH /home/ubuntu/ruby/bin:$PATH
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
