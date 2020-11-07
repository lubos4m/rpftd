FROM fluentd:latest
RUN gem install fluent-plugin-elasticsearch
RUN gem install fluent-plugin-mqtt-io
EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
