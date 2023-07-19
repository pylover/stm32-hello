TARGET=main

CC=arm-none-eabi-gcc
LD=arm-none-eabi-gcc
AR=arm-none-eabi-ar
AS=arm-none-eabi-as
CP=arm-none-eabi-objcopy
OD=arm-none-eabi-objdump
SE=arm-none-eabi-size
SF=st-flash

CFLAGS = \
	-std=gnu99 \
	-g \
	-O2 \
	-Wall \
	-mlittle-endian \
	-mthumb \
	-mthumb-interwork \
	-mcpu=cortex-m0 \
	-fsingle-precision-constant \
	-Wdouble-promotion \
	-specs=nosys.specs


SRCS = main.c
BINSIZE = $(shell wc -c $(TARGET).bin | cut -d' ' -f1 | xargs)

.PHONY: all
all: $(TARGET)

.PHONY: $(TARGET)
$(TARGET): $(TARGET).elf

$(TARGET).elf: $(SRCS)
	$(CC) $(INCLUDE) $(CFLAGS) $^ -o $@
	$(CP) -O binary $(TARGET).elf $(TARGET).bin

clean:
	rm -f *.o $(TARGET).elf $(TARGET).bin read.bin

flash:
	$(SF) --reset write $(TARGET).bin 0x8000000

verify:
	$(SF) --reset read read.bin 0x8000000 $(BINSIZE)
	md5sum $(TARGET).bin
	md5sum read.bin
