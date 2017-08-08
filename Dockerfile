FROM docker.io/centos

COPY .s2i/bin /usr/local/s2i
ENV http_proxy=http://proxy-am.shell.com:8080
ENV https_proxy=http://proxy-am.shell.com:8080
RUN yum install httpd -y && \
yum clean all

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i
EXPOSE 80
USER apache
