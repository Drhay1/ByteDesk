#!/bin/sh
set -e

echo "Waiting for MySQL at ${DB_HOST}:${DB_PORT}..."

until mysqladmin ping -h"${DB_HOST}" -P"${DB_PORT}" -u"${DB_USERNAME}" --password="${DB_PASSWORD}" --silent; do
  sleep 2
done

echo "MySQL is ready."

php artisan optimize:clear
php artisan migrate --force

exec php artisan serve --host=0.0.0.0 --port=8000