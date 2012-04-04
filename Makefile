%.sym : %.tsym
	tragesym $< $@

SYMS = $(wildcard packages/*.tsym)
SYMBOLS := $(SYMS:.tsym=.sym)

symbols : $(SYMBOLS)

check-symbols : $(SYMBOLS)
	gsymcheck $(SYMBOLS)

.PHONY : clean
clean :
	rm -f $(SYMBOLS)

pcb : symbols
	gsch2pcb -v project | tee pcb.log

%.ps : %.sch
	gschem -s /usr/share/gEDA/scheme/print.scm -o ${notdir $@} $<

%-artwork.ps : %.pcb
	pcb -x ps --psfile $@ $<

%-photo.png : %.pcb
	pcb -x png --dpi 300 --photo-mode --format PNG --outfile $@ $<

%.pdf : %.ps
	ps2pdf $< $@

pdfs : board.pdf packages/pwm-unit.pdf packages/stepper.pdf board-artwork.pdf

.PHONY : gerbers
gerbers : board.pcb beagle-daq.bom
	rm -Rf gerbers
	mkdir gerbers
	pcb -x gerber --gerberfile gerbers/beagle-daq $<

gerbers.zip : gerbers
	rm -f $@
	zip -j $@ gerbers/*

%.bom : %.sch
	   gnetlist -g partslist3 -o $@ $<

