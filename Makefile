all:
	mkdir -p /home/ahkalama/data /home/ahkalama/data/mysql /home/ahkalama/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean: down
	docker system prune -a
	docker volume rm $$(docker volume ls -q)
	rm -rf /home/ahkalama/data
re: clean all

.PHONY: all down clean re
