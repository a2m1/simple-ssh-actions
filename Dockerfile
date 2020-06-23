# Source Image: https://hub.docker.com/repository/docker/a2m1/debian
FROM a2m1/debian:stable-slim-ssh-client

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]