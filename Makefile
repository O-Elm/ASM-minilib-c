##
## EPITECH PROJECT, 2019
## d
## File description:
## d
##

SRC		=	main.c

ASM		=	src/strlen.asm	\
            src/strchr.asm	\
            src/memset.asm	\
            src/memcpy.asm	\
            src/strcmp.asm	\
            src/memmove.asm	\
            src/strncmp.asm	\
            src/strcasecmp.asm	\
            src/rindex.asm	\
            src/strstr.asm	\
            src/strpbrk.asm	\
            src/strcspn.asm	\

OBJ		=	$(ASM:.asm=.o)
OBJSRC	=	$(SRC:.c=.o)

NAME	=	libasm.so
EXECNAME	=	miniLibC

all:		$(NAME)

$(NAME):	lib

both:		lib exec

lib:
		nasm -felf64 src/strlen.asm
		nasm -felf64 src/strchr.asm
		nasm -felf64 src/memset.asm
		nasm -felf64 src/memcpy.asm
		nasm -felf64 src/strcmp.asm
		nasm -felf64 src/memmove.asm
		nasm -felf64 src/strncmp.asm
		nasm -felf64 src/strcasecmp.asm
		nasm -felf64 src/rindex.asm
		nasm -felf64 src/strstr.asm
		nasm -felf64 src/strpbrk.asm
		nasm -felf64 src/strcspn.asm
		ld -shared -o $(NAME) $(OBJ)

exec:	$(OBJSRC)
		gcc -o $(EXECNAME) $(OBJSRC) -L. -lasm

test:	$(exec)
		./miniLibC

clean:
		rm -f $(OBJ)
		rm -f $(OBJSRC)

fclean:        clean
		rm -f $(NAME)
		rm -f $(EXECNAME)

re:		fclean all

.PHONY:	clean all fclean re