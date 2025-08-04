FROM alpine:latest

RUN apk add --no-cache bash

COPY scripts/ /app/scripts/

RUN chmod +x /app/scripts/*.sh

WORKDIR /app

ENTRYPOINT ["/app/scripts/cleanup.sh"]

CMD ["--help"]
