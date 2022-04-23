FROM openjdk:19-slim-bullseye

RUN groupadd minecraft \
    && useradd -g minecraft -s /bin/bash -m minecraft

RUN apt-get update && apt-get install -y \
    screen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER minecraft
WORKDIR /minecraft

CMD ["bash", "run.sh"]
