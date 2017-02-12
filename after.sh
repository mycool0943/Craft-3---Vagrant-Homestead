Update () {
    echo "-- Update Packages --"
    sudo apt-get update
    sudo apt-get upgrade
}
Update

echo "-- Installing Mcrypt --"
sudo apt-get install mcrypt php7.1-mcrypt

echo "-- Configuring MySQL mode --"
echo -e '[mysqld]
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' | sudo tee --append /etc/mysql/my.cnf > /dev/null

echo "-- Restarting MySQL --"
sudo service mysql restart

echo "-- Updating PHP Configs --"
# more info on sed http://stackoverflow.com/a/16440444
# basically find string in php.ini and replace it
sudo sed -i 's/.*post_max_size.*/post_max_size = 20M/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/.*upload_max_filesize.*/upload_max_filesize = 100M/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/.*max_input_vars.*/max_input_vars = 1000/' /etc/php/7.1/fpm/php.ini
sudo sed -i 's/.*memory_limit.*/memory_limit = 256M/' /etc/php/7.1/fpm/php.ini
echo "-- PHP Configs Updated --"

echo "Restarting Apache..."
sudo service apache2 restart

echo "+++++++++++++++++++++++"
echo "++++ Happy Coding! ++++"
echo "+++++++++++++++++++++++"