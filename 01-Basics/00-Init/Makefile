PROJ = init
PIN_DEF = ../../ulx3s.lpf
PNRDEVICE = 85k
PNRPACKAGE = CABGA381

all: $(PROJ).config $(PROJ).bit

%.json: %.vhdl
	yosys -p 'ghdl $(PROJ).vhdl -e $(PROJ); synth_ecp5 -json $@'

%.config: $(PIN_DEF) %.json
	nextpnr-ecp5 --$(PNRDEVICE) --package $(PNRPACKAGE) --json $(PROJ).json --textcfg $@ --lpf $(PIN_DEF) -q --timing-allow-fail

%.bit: %.config
	ecppack $< $@

prog: $(PROJ).bit
	fujprog $<

sudo-prog: $(PROJ).bit
	@echo 'Executing prog as root!!!'
	sudo fujprog $<

clean:
	rm -f $(PROJ).json $(PROJ).config $(PROJ).bit

.SECONDARY:
.PHONY: all prog clean
