export GO111MODULE := off

DBNAME:=tutorial-db
DATASOURCE:=root:password@tcp(127.0.0.1:3306)/$(DBNAME)

up:
	docker-compose up -d

down:
	docker-compose down

mysql:
	mysql -u root -h localhost --protocol tcp -p $(DBNAME)

# migrate/init:
# 	mysql -u root -h localhost --protocol tcp -e "create database \`$(DBNAME)\`" -p
