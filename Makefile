OUTDIR = ./build
CFLAGS = -Wall -g -ffunction-sections -fPIC
LDFLAGS = -Wl,-rpath=$(OUTDIR) -L$(OUTDIR) -lcode


SOURCES = code1.c code1.h
#TODO head change rebulid
#-rpath info store in where?

EXEC = a.exe
LIBSO = $(OUTDIR)/libcode.so
OBJS= $(patsubst %.c, $(OUTDIR)/%.o, $(filter %.c, $(SOURCES)))

all: build ${EXEC}

so: ${LIBSO}

build:
	mkdir $@

${EXEC}: main.c ${LIBSO}
	${CC} $(CFLAGS) -o $@ main.c $(LDFLAGS)


${LIBSO}: ${OBJS}
	${LD} -shared -o $@ $^


$(OUTDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf ${OBJS}
