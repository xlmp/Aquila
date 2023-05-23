.SUFFIXES:
.SUFFIXES: .s .S .c .asm .o

versao_kernel := v0.05.23
Filekernel := aquila-os-$(versao_kernel).xn
FinalKernel := .obj/$(Filekernel)


#******** target de compilamento do código do Core **********
.obj/kernel/%.o: kernel/%.cpp
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS) -c -o $@ $<

.obj/kernel/%.o: kernel/%.c
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS) -c -o $@ $<

.obj/kernel/%.o: kernel/%.S
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS) -E $< -o .obj/kernel/$*.asm
	@$(NM) $(ASMFLAGS) .obj/kernel/$*.asm -o $@
	@$(RM) .obj/kernel/$*.asm

#******** target de compilamento do código dos applicativos de sistema**********

.obj/source.app/%.o: source.app/%.S
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS_APPS) -E $< -o .obj/source.app/$*.asm
	@$(NM) $(ASMFLAGS_APPS) .obj/source.app/$*.asm -o $@
	@$(RM) .obj/app/$*.asm

.obj/source.app/%.o: source.app/%.c
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS_APPS) -c -o $@ $<

.obj/source.app/%.o: source.app/%.cpp
	@if not exist $(subst /,\, $(@D)) mkdir  $(subst /,\, $(@D))
	@$(CC) $(CC_FLAGS_APPS) -c -o $@ $<