# Craft 3 - Vagrant Homestead


Have Vagrant and VirtualBox installed on your machine.

* **Vagrant** https://www.vagrantup.com/
* **VirtualBox** https://www.virtualbox.org/wiki/Downloads

***

### Note!

You can follow the instructions bellow or clone this repo and just run `vagrant up`.

Take a look at `after.sh` it will do all the server set up there. If you need to configure php.ini you can add that to `after.sh`. 

* Before you `vagrant up` open up `Homestead.yaml` and replace `folders:map` to your own user path directory where you are running the vagrant command from.



***

## Setup Vagrant + Homestead

* Run `mkdir craft3` (or whatever you want to call it) in your development directory, then `cd craft3`
* Run `composer require laravel/homestead --dev`
* Run `php vendor/bin/homestead make`
* Open `Homestead.yaml`, 
    * Update `sites:map` to `craft3.dev` 
    * Update `sites:to` to `/home/vagrant/craft3/craft3/web`
    * Update `databases:` to `craft3`
* Run `vagrant up` (will take some time if you didn't have box installed before)

***

## Setup Server

* Run `vagrant ssh`
* We need to update our box so run `sudo apt-get update` and after that run `sudo apt-get upgrade`
* We need to install mcrypt so run `sudo apt-get install mcrypt php7.1-mcrypt`
* We need to update mysql file, run `echo -e '[mysqld]
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' | sudo tee --append /etc/mysql/my.cnf > /dev/null`
* Restart your mysql with `sudo service mysql restart`

***

## Setup Craft 3

Still while in your server (`vagrant ssh`)

* Run `cd /vagrant`
* Run `composer create-project craftcms/craft craft3 -s beta`

Now back to your machine (not virtual box) you will need to update host file `/etc/hosts` add this line `192.168.10.10 craft3.dev` and save. Point your browser to `http://craft3.dev`!


#### Install Craft 3

* Inside your `cd craft3` folder is another `cd craft3` folder. Open `.env` and update your db configs
    * `DB_USER` to `homestead`
    * `DB_PASSWORD` to `secret`
    * `DB_DATABASE` to `craft3`
* Now go to `http://craft3.dev/admin` and go through setup wizard.

***

If you need to make updates to `Homestead.yaml` run `vagrant reload --provision` to update server.