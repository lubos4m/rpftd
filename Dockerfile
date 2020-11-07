FROM fluentd:latest
MAINTAINER l4m
RUN gem install fluent-plugin-mqtt-io
RUN gem install fluent-plugin-elasticsearch
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
