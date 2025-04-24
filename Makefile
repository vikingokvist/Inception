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
	cd srcs && docker-compose up -d --build --remove-orphans

clean:
	cd srcs && docker-compose down

fclean:
	cd srcs && docker-compose down -v --rmi all

ps:
	cd srcs && docker-compose ps


re: fclean all

# al hacer make deberia crar /home/ctommasi/data/wordpress-files and one for mariadb
# clean docker down 
# fclean docker down y volumenes con rm rf