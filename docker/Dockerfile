FROM docker.io/library/nginx:latest

ENV VERSIONS="v1.4"

ENV NGINX_HTTP_PORT=80
ENV NGINX_HTTPS_PORT=443

RUN apt update && apt install -y --no-install-recommends wget pandoc

# Copy the template file to the container
COPY docker/conf/nginx.conf.template /etc/nginx/templates/nginx.conf

COPY docker/scripts/init.sh /docker-entrypoint.d
COPY docker/security/nginx-selfsigned.crt /etc/nginx/ssl/nginx.crt
COPY docker/security/nginx-selfsigned.key /etc/nginx/ssl/nginx.key

WORKDIR /app
COPY .. /app

RUN pandoc /app/README.md -o /usr/share/nginx/html/index.html

RUN chmod +x /docker-entrypoint.d/init.sh \
        && chmod +x /app/localinstall.sh
