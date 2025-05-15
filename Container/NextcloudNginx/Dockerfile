FROM nextcloud:31.0.4-fpm AS base


FROM nginx:1.28.0-alpine
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install required packages
RUN apk add --no-cache bash curl

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf
COPY nextcloud.conf /etc/nginx/conf.d/nextcloud.conf

COPY --from=base /usr/src/nextcloud /var/www/html

# Create healthcheck script
COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD /healthcheck.sh

EXPOSE 80