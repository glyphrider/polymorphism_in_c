EXE=demo
OBJS=main.o

$(PHONY) : all
all : $(EXE) libhello1.so libhello2.so

$(EXE) : $(OBJS)
	$(CC) $(LDFLAGS) -ldl -o $@ $^

libhello1.so : hello1.o
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$@ -o $@ $^

libhello2.so : hello2.o
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$@ -o $@ $^

$(PHONY) : clean
clean :
	rm -f $(EXE) $(OBJS)
	rm -f libhello1.so libhello2.so
