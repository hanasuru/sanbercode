# Initialize Database
mysql_install_db
mysqld_safe &

sleep 5

# Create Database
mysql -e "CREATE DATABASE ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"

# Create additional mysql user with privileges
mysql -e "CREATE USER ${MYSQL_USER}@localhost IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Replace default .env file with new db-name, username & password
sed -i "s/DB_DATABASE=homestead/DB_DATABASE=$MYSQL_DATABASE/g" .env
sed -i "s/DB_USERNAME=homestead/DB_USERNAME=$MYSQL_USER/g" .env
sed -i "s/DB_PASSWORD=secret/DB_PASSWORD=$MYSQL_PASSWORD/g" .env

php artisan migrate

php-fpm -D; nginx -g "pid /tmp/nginx.pid; daemon off;"