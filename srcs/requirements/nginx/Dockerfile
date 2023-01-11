#nginx configration

FROM debian:10
RUN apt-get --assume-yes update  && apt-get --assume-yes upgrade

#install nginx and openssl
RUN apt-get install -y nginx openssl && rm -fr /var/lib/apt/lists/*

# Copy the nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.2;/' /etc/nginx/nginx.conf

# Create the SSL certificates and key
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/server.key -out /etc/nginx/server.crt -days 365 -subj "/C=US/ST=California/L=San Francisco/O=ACME Inc/CN=example.com"

# run nginx with the given config
RUN nginx -c /etc/nginx/nginx.conf

# docker will listen in port 443
EXPOSE 443

# the command that will run at container startup , daemon off so that nginx wont be running in the backround
CMD ["nginx", "-g", "daemon off;"]

