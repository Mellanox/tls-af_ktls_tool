CC = gcc -std=gnu99 -g
CFLAGS = -Wall -O2 #-pedantic
LDFLAGS = -lgnutls -lpthread

all: client server

ktls.o: ktls.c
	${CC} ${CFLAGS} ${LDFLAGS} $^ -c -o $@

client: client.c benchmark.c server.c verify.c common.c connection.c xlibgnutls.c ktls.o action.c plain_server.c
	${CC} ${CLFLAGS} ${LDFLAGS} $^ -o $@

server: server.c server-main.c common.c ktls.c plain_server.c
	${CC} ${CFLAGS} ${LDFLAGS} $^ -o $@

insmod:
	(cd .. && make insmod)

clean:
	rm -f *.o client server

