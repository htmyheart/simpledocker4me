include .env
export

up:
	@docker-compose up -d
	@echo "Custom php-fpm + nginx Up"

down:
	@docker-compose down
	@echo "Custom php-fpm + nginx Down"

backup:
	@echo "Backup database"
	@docker exec $(container_mysql_name) /usr/bin/mysqldump -u root --password=root magento > backup.sql

restore:
	@echo "Restore database"
	@cat backup.sql | docker exec -i $(container_mysql_name) /usr/bin/mysql -u root --password=root magento

go_run:
	docker exec -it $(container_web_name) /bin/bash

chmod:
	@echo "Update permission"
	@sudo chmod -R 777 ./

upg:
	@echo "bin/magento Setup Upgrade"
	php bin/magento setup:upgrade

dp:
	@echo "bin/magento Deploy"
	php bin/magento setup:static-content:deploy -f

ri:
	@echo "bin/magento Reindex"
	php bin/magento indexer:reindex

cf:
	@echo "bin/magento Flush cache"
	php bin/magento cache:flush

composer:
	php composer.phar $(cm)
	
m_all: upg dp ri cf chmod
	@echo "-----------------------"; echo "Done !!!";