#nginx configration

FROM debian:buster

RUN apt-get --assume-yes update  && apt-get --assume-yes upgrade

#install nginx and openssl
RUN apt-get install --assume-yes nginx openssl && rm -fr /var/lib/apt/lists/*

# Create the SSL certificates and key
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out \
/etc/ssl/aabdou.42.fr.pem -keyout /etc/ssl/aabdou.42.fr.key  -subj \
"/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=42 School/OU=aabdou/CN=aabdou.42.fr"

# Copy the nginx config file
COPY config-files/nginx.conf /etc/nginx/nginx.conf

# docker will listen in port 443
EXPOSE 443

# the command that will run at container startup , daemon off so that nginx wont be running in the backround
CMD ["nginx", "-g", "daemon off;"]

