FROM squid:6.6-alpine
RUN apk add --no-cache gcc musl-dev hiredis-dev && \
    wget -O /tmp/redis_store.c \
      https://raw.githubusercontent.com/squid-cache/squid/master/helpers/storeid/file/redis_storeid.c && \
    gcc -shared -fPIC -o /usr/lib/squid/redis_storeid.so \
      /tmp/redis_store.c -lhiredis