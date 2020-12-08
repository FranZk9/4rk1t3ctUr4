PROG = main
CC = iverilog

$(PROG): $(PROG).sv
	$(CC) -o $(PROG) $(PROG).sv

run: $(PROG)
	vvp $(PROG)

clean:
	rm $(PROG)