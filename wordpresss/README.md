
Steps of deployment

1- clone all the repository 
    *database repository with https://gitface.irex.aretex.ca/archives/wordpress/irex/database.git
    *scripts repository with https://gitface.irex.aretex.ca/archives/wordpress/irex/deployment.git
    *theme repository with https://gitface.irex.aretex.ca/archives/wordpress/irex/themes.git

2- Go into uat folder which are in deployment folder by typing $ cd deployment/uat/

3- Modify the conf.defaults file in the conf folder by typing $ vi conf/conf.defaults

4- After that, execute the deploy-wordpress-data.sql by typing $ ./deploy-wordpress-data.sql

5- Go to https://wp.uat.irex.aretex.ca/ and enjoy!!!!
