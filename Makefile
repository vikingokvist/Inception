# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctommasi <ctommasi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/22 12:06:57 by ctommasi          #+#    #+#              #
#    Updated: 2025/04/22 12:29:42 by ctommasi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	cd srcs && docker compose up -d --build

clean:
	cd srcs && docker compose down
