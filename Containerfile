FROM quay.io/libpod/alpine:latest

RUN apk add --no-cache bash

COPY show /bin/show

RUN chmod +x /bin/show

CMD ["/bin/show"]
