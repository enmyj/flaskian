docker run --rm --detach \
    --name example-webapp \
    --network nginx-proxy \
    --expose 80 \
    -e "VIRTUAL_PORT=80" \
    --env "VIRTUAL_HOST=ianmyjer.com" \
    --env "LETSENCRYPT_HOST=ianmyjer.com" \
    ian:latest
