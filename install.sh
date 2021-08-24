#!/usr/bin/env bash

################################
# Ask for variables
################################
echo "Quel est le nom de votre projet ?"
read project_name
echo "------------------------"
echo "DB_NAME ?"
read db_name
echo "------------------------"
echo "DB_USER ?"
read db_user
echo "------------------------"
echo "DB_PASSWORD ?"
read db_password
echo "------------------------"
echo "DB_PREFIX ?"
read db_prefix
echo "------------------------"
echo "Quel est l'identifiant du compte admin ?"
read site_id
echo "------------------------"
echo "Quel est le mot de passe du compte admin ?"
read site_passwd
echo "------------------------"
echo "Quel est l'email du compte admin ?"
read site_mail

################################
# Init WP
################################
mkdir -p $project_name
cd $project_name
wp core download
wp core config --dbname=$db_name --dbuser=$db_user --dbpass=$db_password --dbhost=localhost --dbprefix=$db_prefix --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_POST_REVISIONS', 3 );
PHP
wp db create
wp core install --url='http://localhost:8000' --title=$project_name --admin_user=admin --admin_password=admin --admin_email=test@test.fr --skip-email

# User admin do not have id of 1
wp user delete 1 --yes
wp user create $site_id $site_mail --user_pass=$site_passwd --role=administrator

# Set good permalinks
wp rewrite structure '/%postname%/'

# Delete all sample stuff
wp plugin delete --all
wp post delete 1 2 3 --force
wp theme delete --all

# Disable indexing
wp option set blog_public 0

# Set default config 
wp language core install fr_FR --activate
wp core update-db

################################
# Delete Installation directory
################################
rm wp-config-sample.php
cd ..
rm ./install.sh