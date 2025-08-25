#!/bin/bash

apt update -y && apt upgrade -y

apt install -y docker.io docker-compose nfs-common curl mysql-client

systemctl start docker
systemctl enable docker

sudo cat <<EOF > /etc/wordpress-secrets.env
RDS_DB="seu_database"
RDS_USER="seu_usuario"
RDS_PASS="sua_senha"
RDS_ENDPOINT="wordpress.xxxxxxxx.us-east-2.rds.amazonaws.com"
EFS_DNS="fs-xxxxxxxxxxx.efs.us-east-2.amazonaws.com"
DISCORD_WEBHOOK="URL_WEBHOOK"
EOF

chmod 600 /etc/wordpress-secrets.env
source /etc/wordpress-secrets.env

mkdir -p /home/ubuntu/wordpress-app
cd /home/ubuntu/wordpress-app

mkdir efs
chmod -R 775 /home/ubuntu/wordpress-app/efs
chown -R 33:33 /home/ubuntu/wordpress-app/efs

mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${EFS_DNS}:/ efs
echo "${EFS_DNS}:/ /home/ubuntu/wordpress-app/efs nfs4 defaults,_netdev 0 0" >> /etc/fstab
mount -a

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
      WORDPRESS_DB_NAME: \${RDS_DB}
      WORDPRESS_DB_USER: \${RDS_USER}
      WORDPRESS_DB_PASSWORD: \${RDS_PASS}
      WORDPRESS_DB_HOST: \${RDS_ENDPOINT}
    volumes:
      - ./efs/wp-content/uploads:/var/www/html/wp-content/uploads
      - ./efs/wp-content/plugins:/var/www/html/wp-content/plugins
      - ./wp-config.php:/var/www/html/wp-config.php
      - ./health.php:/var/www/html/health.php
EOF

WP_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)

cat <<EOC > wp-config.php
<?php
define( 'DB_NAME', '${RDS_DB}' );
define( 'DB_USER', '${RDS_USER}' );
define( 'DB_PASSWORD', '${RDS_PASS}' );
define( 'DB_HOST', '${RDS_ENDPOINT}' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

${WP_KEYS}

\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( !defined('ABSPATH') ) define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';
EOC

chown 33:33 wp-config.php

cat <<'EOP' > health.php
<?php
http_response_code(200);
echo "OK";
?>
EOP

docker-compose up -d

send_discord() {
    local status="$1"
    local msg="$2"
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"[${status}] ${msg}\"}" \
         "$DISCORD_WEBHOOK"
}

if mountpoint -q /home/ubuntu/wordpress-app/efs; then
    send_discord "EFS - EFS montado com sucesso"
else
    send_discord "EFS - Falha ao montar EFS"
fi

if mysql -h "$RDS_ENDPOINT" -u "$RDS_USER" -p"$RDS_PASS" -e "USE $RDS_DB;" >/dev/null 2>&1; then
    send_discord "RDS - Conexão bem-sucedida"
else
    send_discord "RDS - Falha na conexão"
