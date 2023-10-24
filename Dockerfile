FROM alpine:latest

RUN mkdir /opt/shell
COPY hello.sh /opt/shell/
RUN chmod 755 /opt/shell/hello.sh
CMD ["/opt/shell/hello.sh"]

