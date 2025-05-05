# Use the official Nginx image as the base
FROM nginx:1.23.1

# Install necessary packages, including OpenSSL
RUN apt-get update && apt-get install -y openssl curl

# Copy your custom Nginx config files
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./routes /etc/nginx/routes
COPY ./includes/ /etc/nginx/includes/
COPY ./images/ /var/www/html/images/

# Copy the SSL certificate generation script
COPY ./generate_ssl.sh /usr/local/bin/generate_ssl.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/generate_ssl.sh

# Run the script to generate the SSL certificate and start Nginx
CMD ["/bin/bash", "-c", "/usr/local/bin/generate_ssl.sh && nginx -g 'daemon off;'"]

# Expose ports 80 and 443 for HTTP and HTTPS traffic
EXPOSE 80 443
