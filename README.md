Simple config docker for php 7, nginx, magento 1.9.x and magento 2.2.x, 2.3.x
 
##### User guide:

- command 1: run `make up` to start docker
- command 2: run `make down` to stop docker
- command 3: run `make go_run` to go into web container /bin/bash
- command 4: run `make backup` to backup database from mysql container to backup.sql file
- command 5: run `make restore` to restore database from backup.sql file

##### Current config: (view Dockerfile and docker-compose.yaml)
- php version: 7.1, check custom-fpm/php.ini file
- mysql version: 5.7
- nginx included in web container check custom-fpm/nginx.conf, custom-fpm/nginx-m1.conf, custom-fpm/nginx-m2.conf
- container name check .env file
- check log nginx in custom-fpm/log

##### Note:
- Start: run command 1 - 5 - 3
- Stop: run command 4 - 2
- mysql server name: mysql
- mysql username: magento
- mysql password: magento
- mysql database name: magento
- nginx hostname: localhost
- nginx port: 80

##### Refer:
- https://medium.com/@uv_d/migrating-our-php-applications-to-docker-without-sacrificing-performance-1a69d81dcafb
- update...
 