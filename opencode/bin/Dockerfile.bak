FROM ghcr.io/anomalyco/opencode:latest


RUN apk add --no-cache nodejs=24.14.1-r0
RUN apk add --no-cache npm=11.11.0-r0
RUN apk add --no-cache python3=3.12.12-r0
RUN apk add --no-cache vim

ARG UID=1000
ARG GID=1000

RUN groupadd --gid "${GID}" hostgroup 2>/dev/null || true \
 && useradd --uid "${UID}" --gid "${GID}" \
            --create-home --home-dir /home/hostuser \
            --shell /bin/sh \
            hostuser 2>/dev/null \
 || usermod --uid "${UID}" --gid "${GID}" "$(getent passwd ${UID} | cut -d: -f1)" 2>/dev/null || true

# Create home dir in case the usermod path ran instead of useradd
RUN mkdir -p /home/hostuser \
 && chown "${UID}:${GID}" /home/hostuser

# Create XDG dirs the app needs, all owned by the host user
RUN mkdir -p /home/hostuser/.local \
             /home/hostuser/.config/opencode \
 && chown -R "${UID}:${GID}" /home/hostuser

ENV HOME=/home/hostuser \
    TZ=Africa/Johannesburg

USER ${UID}:${GID}
ENV EDITOR=vim
