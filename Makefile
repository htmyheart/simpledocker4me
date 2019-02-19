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
