#----------------------
# @author Riza Kaan Ucak
# @date 16.02.2024
#----------------------

.PHONY: build
.PHONY: clean

# folders
BUILD=build
SRC=boot
BOOT_IMAGE=boot.img

# commands
ASM=nasm
QEMU=qemu-system-i386

build: bootloader

#
# Bootloader
#
bootloader: boot.img
boot.img:
	${ASM} ${SRC}/boot.asm -f bin -o ${BUILD}/$@

#
# Floppy Image
#
floppy: main.img
main.img:
	dd if=/dev/zero of=$(BUILD)/main.img bs=512 count=2880
	mkfs.fat -F 12 -n "ROS" $(BUILD)/main.img
	dd if=$(BUILD)/boot.img of=$(BUILD)/main.img conv=notrunc
	mcopy -i $(BUILD)/main.img $(BUILD)/kernel.bin "::kernel.bin"

run:
	${QEMU} -fda ${BUILD}/${BOOT_IMAGE}

clean:
	rm -rf *.bin *.o