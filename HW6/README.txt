View Homework 6:
=========================


Getting started:
=========================
This database project was made using the Wapp stack.
if you would like to run this project on your local Windows computer download the wapp stack here:
https://bitnami.com/stack/wapp

If you are using linux you can use:
https://bitnami.com/stack/lapp

If you are using Mac you can use:
https://bitnami.com/stack/mapp

this stack will set up a web development environment where you can use PHP and postgreSQL.
once the stack is downloaded go to its location and move the htdocs files provided in this folder into the location where you 
downloaded the wapp stack.  Replace the htdocs file inside the 'apache2/htdocs' with the 'htdocs' provided in this project
also make sure to use the tables created in HW5 to setup the database.

Once you create the tables make sure to load HW6Load.sql into the database for the airline information

for more documentation checkout:
https://docs.bitnami.com/installer/infrastructure/wapp/

HW6.error and HW6.flight are located inside the htdocs folder
You can view them here

HW6.error: http://104.154.58.248/HW6.error
HW6.flight: http://104.154.58.248/HW6.flight

IN ORDER TO HOOK UP POSTGRESQL DATABASE WITH STACK
make sure to go into 'htdocs/inc/connection.php' and change the password and port number to match your postgres data
unlease your port is already set to 5432 and the database username is postgres and the password is postgres

