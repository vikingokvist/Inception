# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctommasi <ctommasi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/22 12:06:57 by ctommasi          #+#    #+#              #
#    Updated: 2025/04/24 17:36:20 by ctommasi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/ctommasi/data/db /home/ctommasi/data/wp-files /home/ctommasi/data/certs \
	&& cd srcs && docker-compose up -d --build

attached:
	mkdir -p /home/ctommasi/data/db /home/ctommasi/data/wp-files /home/ctommasi/data/certs \
	&& cd srcs && docker-compose up --build

clean:
	cd srcs && docker-compose down

fclean:
	rm -rf /home/ctommasi/data/db /home/ctommasi/data/wp-files /home/ctommasi/data/certs \
	&& cd srcs && docker-compose down -v --rmi all

re: fclean all

.PHONY: all clean fclean re attached