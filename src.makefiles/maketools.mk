CC := clang 
NM := nasm 
RM := rm -f

LD := ..\..\tools\x86_64-pc-elf\bin\i586-elf-ld
AR := ..\..\tools\x86_64-pc-elf\bin\i586-elf-ar
GRUB := ..\..\Tools\grub\grub-mkimage.exe
MKISO := ../../tools/mkisofs
BOCHS := "..\..\tools\Bochs-2.6.7\bochs.exe"

tools-cfile := CreateFile
# --------- Flags -------------
INCLUDEPATH := kernel/include
INCLUDEPATH2:= kernel/arch/i386/include
INCLUDEPATH3:= kernel/arch/none/include
INC_APPPATH := source.app/include 

MKISO_FLAGS :=  -no-emul-boot -boot-load-size 12 -boot-info-table
WARNINGS:= -Wint-to-void-pointer-cast \
			-Wno -W-unused-variable \
			-Wvoid-pointer-to-int-cast
ASMFLAGS := -I$(INCLUDEPATH) 
CC_FLAGS := -I./$(INCLUDEPATH) -I./$(INCLUDEPATH2) -I./$(INCLUDEPATH3)  -Dlang_$(language)

LDFLAGS  := -nostdlib -nodefaultlibs -g 
CC_FLAGS += -m32 -nostdinc  -nostdlib -fno-exceptions -fno-builtin -D__x86__ -march=i686 -D__UD_STANDALONE__ -D_COMP_01 -D__PCC__ -DARCH_BITS
LDFLAGS += -melf_i386
ASMFLAGS += -felf32
CLANG_FLAGS := -fno-rtti --target=i686-pc-none-elf -Wall
NO_FLAGS = -Wpragma-pack -Wnew-returns-null  
CC_FLAGS += -ffreestanding -fno-stack-protector $(CLANG_FLAGS)

ASMFLAGS_APPS := -I$(INC_APPPATH) -felf32
CC_FLAGS_APPS := -I./$(INC_APPPATH) -Dlang_$(language) -ffreestanding -fno-stack-protector $(CLANG_FLAGS) \
-m32 -nostdinc  -nostdlib -fno-exceptions -fno-builtin -D__x86__ -march=i686 -D__UD_STANDALONE__ -D_COMP_01