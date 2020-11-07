FROM fluentd:latest
MAINTAINER l4m
RUN sudo gem install fluent-plugin-mqtt-io
RUN sudo gem install fluent-plugin-elasticsearch
USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
