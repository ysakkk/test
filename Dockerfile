FROM alpine:latest

ARG VERSION
ENV VERSION $VERSION

RUN mkdir /opt/shell
COPY hello.sh /opt/shell/
RUN chmod 755 /opt/shell/hello.sh
RUN echo $VERSION > VERSION.txt
CMD ["/opt/shell/hello.sh"]

