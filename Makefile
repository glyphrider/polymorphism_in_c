EXE=demo
OBJS=main.o hello.o

$(EXE) : $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(PHONY) : clean
clean :
	rm -f $(EXE) $(OBJS)
