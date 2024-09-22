FROM --platform=linux/amd64 ubuntu/nginx:latest
COPY sites-available/bytepushers.services /etc/nginx/sites-available
COPY sites-available/familyreunions.online /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/bytepushers.services /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/familyreunions.online /etc/nginx/sites-enabled/
RUN mkdir -p /var/www/familyreunions.online
COPY --from=tontepouncil/my-family-web:latest app/www /var/www/familyreunions.online
