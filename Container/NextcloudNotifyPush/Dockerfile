FROM alpine:3.19 as builder

ARG NOTIFY_PUSH_VERSION=v0.6.7
ARG TARGETARCH

# Install necessary tools
RUN apk add --no-cache curl jq

# Download the appropriate binary based on architecture
RUN mkdir -p /app && \
    if [ "$TARGETARCH" = "arm64" ]; then \
        ARCH="aarch64"; \
    else \
        ARCH="x86_64"; \
    fi && \
    echo "Downloading for architecture: $ARCH" && \
    # Get the download URL for the latest release
    DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/nextcloud/notify_push/releases/tags/${NOTIFY_PUSH_VERSION}" | \
                jq -r --arg ARCH "$ARCH" '.assets[] | select(.name | contains($ARCH) and contains("linux-musl")) | .browser_download_url') && \
    echo "Download URL: $DOWNLOAD_URL" && \
    curl -L $DOWNLOAD_URL -o /app/notify_push && \
    chmod +x /app/notify_push

# Create a lightweight runtime container
FROM alpine:3.19
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install only required runtime dependencies
RUN apk add --no-cache ca-certificates libgcc curl

# Copy from builder stage
COPY --from=builder /app/notify_push /usr/local/bin/notify_push

# Create a non-root user for running the application
RUN addgroup -S nextcloud && \
    adduser -S -G nextcloud nextcloud

# Create directories and set permissions
RUN mkdir -p /config /data && \
    chown -R nextcloud:nextcloud /config /data

# Copy healthcheck script
COPY healthcheck.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh

USER nextcloud
WORKDIR /data

# Default environment variables
ENV NEXTCLOUD_URL="http://nextcloud:80"
ENV NC_DATABASE_URL=""
ENV NC_REDIS_URL=""
ENV LOG_LEVEL="info"
ENV ALLOW_SELF_SIGNED="false"

# Expose main port and metrics port
EXPOSE 7867
EXPOSE 9868

# Set up healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD /usr/local/bin/healthcheck.sh

VOLUME ["/config", "/data"]

ENTRYPOINT ["notify_push"]
CMD ["--port", "7867", "--log-level", "$LOG_LEVEL"]