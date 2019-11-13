docker run --rm --detach \
    --name nginx-proxy \
    --publish 80:80 \
    --publish 443:443 \
    --volume /etc/nginx/certs \
    --volume /etc/nginx/vhost.d \
    --volume /usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy

docker run --rm --detach \
    --name nginx-proxy-letsencrypt \
    --volumes-from nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --env "DEFAULT_EMAIL=imyjer@protonmail.com" \
    jrcs/letsencrypt-nginx-proxy-companion

docker run --rm --detach \
    --name flaskian \
    --env "VIRTUAL_HOST=ianmyjer.com" \
    --env "LETSENCRYPT_EMAIL=imyjer@protonmail.com" \
    --env "LETSENCRYPT_HOST=ianmyjer.com" \
    ian:latest
