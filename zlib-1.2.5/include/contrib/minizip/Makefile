CC=cc
CFLAGS=-O -I../..

UNZ_OBJS = miniunz.o unzip.o ioapi.o ../../libz.a
ZIP_OBJS = minizip.o zip.o   ioapi.o ../../libz.a
MINIZIP_OBJS = miniunz.o unzip.o ioapi.o minizip.o zip.o

.c.o:
	$(CC) -c -fPIC $(CFLAGS) $*.c

all: miniunz minizip libminizip_static.a

miniunz:  $(UNZ_OBJS)
	$(CC) $(CFLAGS) -o $@ $(UNZ_OBJS)

minizip:  $(ZIP_OBJS)
	$(CC) $(CFLAGS) -o $@ $(ZIP_OBJS)

libminizip_static.a: $(MINIZIP_OBJS)
	$(AR) -rv $@ $^
	$(RANLIB) $@

test:	miniunz minizip
	./minizip test readme.txt
	./miniunz -l test.zip
	mv readme.txt readme.old
	./miniunz test.zip

clean:
	/bin/rm -f *.o *~ minizip miniunz libminizip_static.a

