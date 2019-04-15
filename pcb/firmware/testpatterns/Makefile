
TARGET = testpatterns
OBJECT = gpio clk spi

ARCH = stm8
INCDIR = ../../../../ulibSTM8/inc
LIBDIR = ../../../../ulibSTM8/lib
OBJDIR = ./obj
SDCC = sdcc
CFLAGS = -c -l$(ARCH) -m$(ARCH) -I$(INCDIR) --opt-code-size
LFLAGS = -l$(ARCH) -m$(ARCH) --out-fmt-ihx
OBJGROUP = $(OBJDIR)/$(TARGET).rel $(OBJECT:%=$(OBJDIR)/%.rel)

.PHONY: all clean flash

all: $(OBJGROUP)
	$(SDCC) $(LFLAGS) $(OBJGROUP) -o $(OBJDIR)/

clean:
	rm -f *.ihx *.rel *.map *.rst *.sym *.cdb *.lk *.asm *.lst
	rm -rf $(OBJDIR)/*

$(OBJDIR)/%.rel: %.c
	$(SDCC) $(CFLAGS) $< -o $@
$(OBJDIR)/%.rel: $(LIBDIR)/%.c
	$(SDCC) $(CFLAGS) $< -o $@

flash: all
	stm8flash -cstlinkv2 -pstm8s003?3 -w $(OBJDIR)/$(TARGET).ihx
