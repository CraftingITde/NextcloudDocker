FROM nextcloud:31.0.11-fpm AS base

FROM nginx:1.29.1-alpine
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

ENV NEXTCLOUD_FPM_HOST=nextcloud-fpm
ENV NEXTCLOUD_FPM_PORT=9000
ENV NEXTCLOUD_NOTIFY_PUSH_HOST=nextcloud-notify-push
ENV NEXTCLOUD_NOTIFY_PUSH_PORT=7867

# Install required packages
RUN apk add --no-cache bash curl

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf
COPY nextcloud.conf /etc/nginx/templates/nextcloud.conf.template

COPY --from=base /usr/src/nextcloud /var/www/html

# Create healthcheck script
COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD /healthcheck.sh

EXPOSE 80