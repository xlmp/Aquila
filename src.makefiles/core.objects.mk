# .obj/kernel/arch/arm/none.o \

CoreObjects = \
.obj/kernel/arch/i386/boot/init.o \
.obj/kernel/arch/i386/boot/sys.o \
.obj/kernel/arch/i386/boot/multiboot.o \
.obj/kernel/arch/i386/boot/x86_64_bootstrap.o \
\
.obj/kernel/arch/i386/cpu/arith.o \
.obj/kernel/arch/i386/cpu/cpu.o \
.obj/kernel/arch/i386/cpu/fpu.o \
.obj/kernel/arch/i386/cpu/gdt.o \
.obj/kernel/arch/i386/cpu/idt.o \
.obj/kernel/arch/i386/cpu/init.o \
.obj/kernel/arch/i386/cpu/isr.o \
.obj/kernel/arch/i386/cpu/smp.o \
\

CoreObjects1 = \
.obj/source/arch.x86/start.o \
.obj/source/core/!main.o \
.obj/source/core/!debug.o \
\
.obj/source/core/interrupt.o \
.obj/source/core/process.manager.o \
.obj/source/core/applications.o \
.obj/source/core/process.schedule.o \
.obj/source/core/process.syscall.o \
.obj/source/core/events.o \
\
.obj/source/lib/system.o \
.obj/source/lib/std.io.o \
.obj/source/lib/strings.o \
.obj/source/lib/collection.o \
\
.obj/source/odd/out.screen/screen.o \
.obj/source/odd/out.screen/screen.drawn.o \
.obj/source/odd/out.screen/screen.odd.vbe.o \
.obj/source/odd/out.screen/screen.singlemode.o \
.obj/source/odd/out.screen/vscreen.fontbase.o \
.obj/source/odd/mem/mem.functions.o \
.obj/source/odd/mem/mem.manager.o \
.obj/source/odd/mem/mem.page.o \
.obj/source/arch.x86/mem.cr.funcs.o \
.obj/source/odd/timer.o \
.obj/source/odd/inputs/odd.o \
.obj/source/odd/inputs/odd.keyboard.o \
.obj/source/odd/inputs/odd.mouse.o	\
\
.obj/source/odd/storage/!storage.o \
.obj/source/odd/storage/!storage.fs.o \
.obj/source/odd/storage/!storage.unit.o \
.obj/source/odd/storage/ata.init.o \
.obj/source/odd/storage/ata.driver.o \
.obj/source/odd/storage/odd.iso.9660.o \
\
.obj/source/uidesign/!main.screen.o \
.obj/source/uidesign/grafictypes.o \
.obj/source/uidesign/image.o \
.obj/source/uidesign/screen.ui.o \
.obj/source/uidesign/ui.element.drawing.o \
.obj/source/uidesign/ui.element.props.o \
.obj/source/uidesign/ui.syscall.o \
\
.obj/source/core.app/live.o \
.obj/source/core.app/spada.intro.o \

