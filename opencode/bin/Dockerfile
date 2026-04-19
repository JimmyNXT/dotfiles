FROM ghcr.io/anomalyco/opencode:latest


RUN apk add --no-cache nodejs npm python3 py3-pip vim

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
    && mkdir -p /home/hostuser/.config/opencode \
    && mkdir -p /home/hostuser/.cache/opencode/bin \
    && chown -R "${UID}:${GID}" /home/hostuser

ENV HOME=/home/hostuser \
    TZ=Africa/Johannesburg

USER ${UID}:${GID}
ENV EDITOR=vim
