language = pt_br
arch = x32

include src.makefiles/maketools.mk
include src.makefiles/core.objects.mk
include src.makefiles/makecompile.mk

# include src.makefiles/apps.objects.mk
# include src.makefiles/apps.creat.mk

linker: kernel/arch/i386/kernel.i386.ld

$(FinalKernel): linker $(CoreObjects)
	@$(LD) $(LDFLAGS) -T $< -o $@ $(CoreObjects)
	@echo "AquilaOS Compilador com Sucesso"

install: $(FinalKernel)
	@copy $(subst /,\\, $(FinalKernel))  root\\Elision\\Sys\\ 
#	$(tools-cfile) --template "L:\\Projetos\\ProjOS\\Elision\\_tools\\grub\\grub-template.cfg" --creat "L:\\Projetos\\ProjOS\\Elision\\root\\boot\\grub\\grub.cfg" -addKernel "FileKernel"
	@echo "AquilaOS Instalado com Sucesso"
#	echo $(boot_string)

iso/Elision-$(arch)-$(versao_kernel).iso: install 
#	$(FinalKernel)
	@echo ----- Criação do ISO ----------------
	@$(GRUB) --prefix=./root --config=root/boot/grub/grub.cfg --output=root/boot/grub/core.img -O i386-pc-eltorito biosdisk iso9660 multiboot
	$(MKISO) -R -b boot/grub/core.img $(MKISO_FLAGS) -o ./$@ ./root
	@echo ----- Elision $(arch) $(versao_kernel) Arquivo ISO com sucesso--


creatiso: iso/Elision-$(arch)-$(versao_kernel).iso

boch:
	@echo ----- RUNNING COM BOCH ------------------- OK
	@$(BOCHS) -q -f  "_tools/bochsrc-v1.bxrc"

vbox:
	@echo ----- RUNNING COM VIRTUAL BOX ------------------- OK
	@"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm  teste

qemu:
	@"L:\Aplications\QemuManager\qemu\qemu.exe" -L "L:\Aplications\QemuManager\qemu" -M "pc" -m 512 -cpu "qemu32" -vga std -serial vc -parallel vc -name "Elision" -drive "file=L:\HDVirtual\HDTeste10GB.qcow,index=0,media=disk" -drive "file=L:\Projetos\ElisionSystem\Elision\iso\Elision-x32-v0.11.22.iso,index=2,media=cdrom" -boot order=dc,menu=off -soundhw es1370 -kernel-kqemu -net nic,vlan=0,macaddr=52-54-00-D7-77-B3,model=rtl8139 -net user,vlan=0 -localtime

teste: creatiso qemu 

compile: clean apps creatiso
compile2: apps creatiso
compile-q: clean creatiso qemu
compile-b: clean creatiso boch
compile-vb: clean creatiso vbox

.PHONY: clean
clean:
	@rm -rf .obj/source .obj/source.app $(FinalKernel) iso/Elision-$(arch)-$(versao_kernel).iso
	@echo ------- Execulando Limpeza -----------


