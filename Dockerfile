FROM fluentd:latest
MAINTAINER l4m
USER root
RUN apk update && \
    apk upgrade && \
    gem install fluentd fluent-plugin-secure-forward fluent-plugin-elasticsearch && \
    gem install fluent-plugin-elasticsearch
# RUN gem install fluent-plugin-mqtt-io
# RUN gem install fluent-plugin-elasticsearch
# USER ubuntu
#WORKDIR /home/ubuntu
# ENV PATH /home/ubuntu/ruby/bin:$PATH
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
