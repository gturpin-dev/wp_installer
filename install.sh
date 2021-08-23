#!/usr/bin/env bash

################################
# Ask for variable
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
PHP
wp db create
wp core install --url='http://localhost:8000' --title=$project_name --admin_user=$site_id --admin_password=$site_passwd --admin_email=$site_mail --skip-email
wp language core install fr_FR
wp language core activate fr_FR
wp core update-db
wp theme install twentytwentyone
wp theme activate twentytwentyone

################################
# Delete Installation directory
################################
cd ..
rm ./install.sh

# TODO
# Ajouter le lien vers curl wp-cli dans le README
# Delete le user 1 et en créer un avec les vrais credentials
# Delete les themes préinstalls par wp lors de l'install
# Update le switcher de langue deprecated => use wp site switch-language à la place (checker les différences)
# Mettre par défaut le theme moderne a l'user principale si possible
# Mettre les permalinks par défaut
# Delete les contenus fake (plugins/pages/article/commentaire)
# Add les max révisions a 3 ? 