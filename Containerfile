FROM alpine:latest

RUN apk add --no-cache bash

COPY show /bin/show

RUN chmod +x /bin/show

ENTRYPOINT ["/bin/show"]
