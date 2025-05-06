#!/bin/sh

echo "<html><body><h1>Whoami Information</h1>" > /var/www/localhost/htdocs/index.html
echo "<p>User: $(whoami)</p>" >> /var/www/localhost/htdocs/index.html
echo "<p>UID: $(id -u)</p>" >> /var/www/localhost/htdocs/index.html
echo "<p>GID: $(id -g)</p>" >> /var/www/localhost/htdocs/index.html
echo "<p>Groups: $(id -Gn)</p>" >> /var/www/localhost/htdocs/index.html
echo "</body></html>" >> /var/www/localhost/htdocs/index.html
