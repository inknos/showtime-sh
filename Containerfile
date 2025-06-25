FROM quay.io/libpod/alpine:latest

COPY ./show /bin/show

CMD ["show"]
