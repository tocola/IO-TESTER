MAKEFLAGS	=	--no-print-directory

CXX 		?=	g++

RM			?=	rm -f

CXXFLAGS	=	-std=c++14 -Wall -Wextra

CPPFLAGS	=	-iquote include

SRC			+=	src/Utils.cpp
SRC			+=	src/IO_Tester.cpp
SRC			+=	src/ErrorHandling.cpp
SRC			+=	src/Updater.cpp

OBJ			=	$(SRC:.cpp=.o)

NAME		=	IO_Tester

ifneq (,$(findstring xterm,${TERM}))
GREEN       := $(shell tput -Txterm setaf 2)
else
GREEN       := ""
endif

ifdef DEBUG
	CXXFLAGS	+=	-ggdb3
endif

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CXX) -o $(NAME) $(OBJ)
	$(RM) $(OBJ)

install: all
	@cp $(NAME) /usr/local/bin
	@echo "${GREEN}[SUCCESS] Install : IO_Tester ==> /usr/local/bin"

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
