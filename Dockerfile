# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package lists and install Apache2
RUN apt-get update && \
    apt-get install -y apache2

# Enable necessary Apache modules (optional)
RUN a2enmod rewrite

# Copy your website files (if any)
COPY ./html/ /var/www/html/

# Set the Apache2 foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
