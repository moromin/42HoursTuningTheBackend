NGINX_CTR_NAME	:=	local_nginx_1
MYSQL_CTR_NAME	:=	local_mysql_1

# ========== DOCKER DOMPOSE ==========
up:
#	bash cpMysqlFile.sh
	docker-compose up

down:
	docker-compose down --rmi all --volumes --remove-orphans

kill-all:
	$(MAKE) down || :
	docker stop $(docker ps -q) || docker rm -f $(docker ps -a -q) || docker rmi $(docker images -q)

# ========== NGINX ==========
nginx-it:
	docker exec -it $(NGINX_CTR_NAME) bash

nginx-log:
	docker cp $(NGINX_CTR_NAME):/var/log/nginx/alp.log ./nginx_alp.log
	cat nginx_alp.log | alp ltsv

# ========== MYSQL ==========
mysql-it:
	docker exec -it $(MYSQL_CTR_NAME) bash

mysql-log:
	docker cp $(MYSQL_CTR_NAME):/var/log/mysql/slow.log ./slow.log
	cat slow.log | docker run -i --rm matsuu/pt-query-digest > analyzed-slow.log


# ========== TEST ==========
test:
#	(cd ../scoring/tool/nodeTool && npm ci)
	bash localApiTestOnly.sh

test-prof:
#	(cd ../scoring/tool/nodeTool && npm ci)
	bash localApiTestProf.sh


# ========== MEMO ==========

# apt-get update; apt-get install vim wget zip;
# docker cp local_nginx_1:/var/log/nginx/alp.log ./


