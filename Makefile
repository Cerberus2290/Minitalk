# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tstrassb <tstrassb@student.42>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/10 11:25:22 by tstrassb          #+#    #+#              #
#    Updated: 2023/02/13 13:37:29 by tstrassb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL		=		/bin/bash

#standard

NAMESV		=		server
NAME		=		client
NAMESVB		=		server_bonus
NAMECLB		=		client_bonus
LIBFT		=		libft
INC			=		include
HEADER		=		-I include
SRC_DIR		=		source/
OBJ_DIR		=		objects/
CC			=		cc
CFLAGS		=		-Wall -Wextra -Werror
RM			=		rm -f
ECHO		=		echo -e

#colors

DEF_COLOR		=		\033[0;39m
ORANGE			=		\033[0;33m
GRAY			=		\033[0;90m
RED				=		\033[0;91m
GREEN			=		\033[1;92m
YELLOW			=		\033[1;93m
BLUE			=		\033[0;94m
MAGENTA			=		\033[0;95m
CYAN			=		\033[0;96m
WHITE			=		\033[0;97m

#joy of creation

SRCSV_FILES		=		server
SRCCL_FILES		=		client
SRCSVB_FILES	=		server_bonus
SRCCLB_FILES	=		client_bonus

SRCSV			=		$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCSV_FILES)))
OBJSV			=		$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCSV_FILES)))

SRCCL			=		$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCCL_FILES)))
OBJCL			=		$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCCL_FILES)))

SRCSVB			=		$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCSVB_FILES)))
OBJSVB			=		$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCSVB_FILES)))

SRCCLB			=		$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCCLB_FILES)))
OBJCLB			=		$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCCLB_FILES)))

OBJF			=		.cache_exists

start:
					@make -C libft
					@cp $(LIBFT)/libft.a .
					@$(ECHO) -n "[dependencies]:\t"
					@echo -e -n "$(BLUE)[$(DEF_COLOR)"
					@make all

all:			$(NAME) $(NAMESV)

$(NAME):		$(OBJCL) $(OBJF)
					@$(CC) $(CFLAGS) $(OBJCL) $(HEADER) libft.a -o $(NAME)

$(NAMESV):		$(OBJSV) $(OBJF)
					@echo -e -n "$(BLUE)]$(DEF_COLOR)"
					@$(ECHO) -n " ==> $(GREEN)CREATED!$(DEF_COLOR)\n"
					@$(ECHO) -n "[minitalk]:\t"
					@$(CC) $(CFLAGS) $(OBJSV) $(HEADER) libft.a -o $(NAMESV)
					@$(ECHO) "     ==> $(GREEN)Completed!$(DEF_COLOR)"

$(OBJ_DIR)%.o:	$(SRC_DIR)%.c $(OBJF)
					@echo -e -n "$(YELLOW)=$(DEF_COLOR)"
					@$(CC) $(CFLAGS) $(HEADER) -c $< -o $@

$(OBJF):
					@mkdir -p $(OBJ_DIR)
					@touch $(OBJF)

bonus:
					@make -C libft
					@cp $(LIBFT)/libft.a .
					@$(ECHO) -n "[dependencies]:\t"
					@$(ECHO) -n "$(BLUE)[$(DEF_COLOR)"
					@make allbonus

allbonus:			$(NAMESVB) $(NAMECLB)

$(NAMESVB):		$(OBJSVB) $(OBJF)
					@$(CC) $(CFLAGS) $(OBJSVB) $(HEADER) libft.a -o $(NAMESVB)

$(NAMECLB):		$(OBJCLB) $(OBJF)
					@$(ECHO) -n "$(BLUE)]$(DEF_COLOR)"
					@$(ECHO) -n " ==> $(GREEN)CREATED!$(DEF_COLOR)\n"
					@$(ECHO) -n "[minitalk_bonus]:"
					@$(CC) $(CFLAGS) $(OBJCLB) $(HEADER) libft.a -o $(NAMECLB)
					@$(ECHO) "    ==> $(GREEN)Completed!$(DEF_COLOR)"

#clean-up

clean:
					@$(RM) -r $(OBJ_DIR)
					@$(RM) $(OBJF)
					@make clean -C $(LIBFT)
					@$(ECHO) -n "$(BLUE)[minitalk]:\t.o files$(DEF_COLOR) ==> $(RED)removed!$(DEF_COLOR)\n"

fclean:			clean
					@$(RM) $(NAME) $(NAMESV) $(NAMESVB) $(NAMECLB)
					@$(RM) libft.a
					@$(RM) $(LIBFT)/libft.a
					@find . -name ".DS_Store" -delete
					@$(ECHO) -n "[LIBFT]:\tprogram file  ==> $(RED)removed!$(DEF_COLOR)\n"
					@$(ECHO) -n "[minitalk]:\tprogram files ==> $(RED)removed!$(DEF_COLOR)\n"

re:				clean all
					@$(ECHO) -n "[minitalk]: $(ORANGE)rebuilt!$(DEF_COLOR)\n"

.PHONY:			start all clean fclean re