NGINX_CTR_NAME	:=	development_nginx_1
MYSQL_CTR_NAME	:=	development_mysql_1

evaluate:
	(cd ./development && bash build.sh)
	(cd ./scoring && bash evaluate.sh)

log:
	mkdir -p logs/

kill-all:
	(cd development && docker-compose down --rmi all --volumes --remove-orphans) || :
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

