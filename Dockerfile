FROM scratch
LABEL version="0.1"
LABEL description="Nginx webserver compiled within Alpine"
LABEL maintainer="Vladimir Schick"
ADD alpine-minirootfs-3.15.0-x86_64.tar.gz /
ADD nginx-1.21.6.tar.gz / 
RUN apk add build-base
RUN cd /nginx-1.21.6/ && ./configure --without-http_rewrite_module --without-http_gzip_module && make install
RUN rm -rf /nginx-1.21.6
COPY index.html /usr/local/nginx/html/index.html
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
