EXE=demo
OBJS=main.o

$(EXE) : $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(PHONY) : clean
clean :
	rm -f $(EXE) $(OBJS)
