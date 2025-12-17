FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y php-cli php-cgi

COPY index.html save.php results.json /usr/share/nginx/html/

VOLUME /usr/share/nginx/html

EXPOSE 80

RUN chown -R www-data:www-data /usr/share/nginx/html && chmod -R 777 /usr/share/nginx/html

CMD ["sh", "-c", "php-cgi -b 127.0.0.1:9000 & nginx -g 'daemon off;'"]

# docker exec -it tictactoe cat /usr/share/nginx/html/results.json pour lire le fichier sur le conteneur
# docker run --rm -v game-results:/data alpine  cat /data/results.json pour lire le fichier sur le volume