# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aperin <aperin@student.s19.be>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 13:44:42 by aperin            #+#    #+#              #
#    Updated: 2023/04/10 12:44:13 by aperin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: dep
	sudo docker-compose -f srcs/docker-compose.yml up -d

re: dep
	sudo docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all -v

destroy:
	sudo ./srcs/requirements/tools/destroy.sh

docker:
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

dep:
	mkdir -p /home/aperin/data/mariadb_data
	mkdir -p /home/aperin/data/wordpress_data
	sudo cp srcs/requirements/tools/hosts /etc/hosts

.PHONY: all re clean destroy docker dep
