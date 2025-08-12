#!/bin/bash

apt update -y
apt upgrade -y

apt install -y docker.io docker-compose nfs-common curl mysql-client

systemctl enable docker
systemctl start docker

RDS_ENDPOINT="wordpress.xxxxxxxx.us-east-2.rds.amazonaws.com"
RDS_USER="seu_usuario"
RDS_PASS="sua_senha"
RDS_DB="seu_database"
EFS_DNS="fs-xxxxxxxxxxx.efs.us-east-2.amazonaws.com"

mkdir -p /home/ubuntu/wordpress-app
cd /home/ubuntu/wordpress-app

mkdir -p efs
mount -t nfs4 $EFS_DNS:/ efs
echo "$EFS_DNS:/ /home/ubuntu/wordpress-app/efs nfs4 defaults,_netdev 0 0" >> /etc/fstab

mkdir -p efs/wp-content/uploads
mkdir -p efs/wp-content/plugins

WP_KEYS=$(curl -s https://url/da/api)

cat <<EOF > docker-compose.yml
services:
  wordpress:
    image: wordpress:6.8-php8.1-apache
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: ${RDS_ENDPOINT}:3306
      WORDPRESS_DB_USER: ${RDS_USER}
      WORDPRESS_DB_PASSWORD: ${RDS_PASS}
      WORDPRESS_DB_NAME: ${RDS_DB}
    volumes:
      - ./efs/wp-content/uploads:/var/www/html/wp-content/uploads
      - ./efs/wp-content/plugins:/var/www/html/wp-content/plugins
      - ./wp-config.php:/var/www/html/wp-config.php
EOF

cat <<EOC > wp-config.php
<?php
define( 'DB_NAME', '${RDS_DB}' );
define( 'DB_USER', '${RDS_USER}' );
define( 'DB_PASSWORD', '${RDS_PASS}' );
define( 'DB_HOST', '${RDS_ENDPOINT}:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

${WP_KEYS}

\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( !defined('ABSPATH') ) define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';
EOC

chown 33:33 wp-config.php

docker-compose up -d
