#####
# 1) Generate asm-offsets.h
#

offsets-file := include/generated/asm-offsets.h

always  += $(offsets-file)
targets += $(offsets-file)
targets += arch/$(SRCARCH)/lib/asm-offsets.s


# Default sed regexp - multiline due to syntax constraints
define sed-y
	"/^->/{s:->#\(.*\):/* \1 */:; \
	s:^->\([^ ]*\) [\$$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; \
	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
	s:->::; p;}"
endef

quiet_cmd_offsets = GEN     $@
define cmd_offsets
	(set -e; \
	 echo "#ifndef __ASM_OFFSETS_H__"; \
	 echo "#define __ASM_OFFSETS_H__"; \
	 echo "/*"; \
	 echo " * DO NOT MODIFY."; \
	 echo " *"; \
	 echo " * This file was generated by Kbuild"; \
	 echo " *"; \
	 echo " */"; \
	 echo ""; \
	 sed -ne $(sed-y) $<; \
	 echo ""; \
	 echo "#endif" ) > $@
endef

# We use internal kbuild rules to avoid the "is up to date" message from make
arch/$(SRCARCH)/lib/asm-offsets.s: arch/$(SRCARCH)/lib/asm-offsets.c FORCE
	$(Q)mkdir -p $(dir $@)
	$(call if_changed_dep,cc_s_c)

$(obj)/$(offsets-file): arch/$(SRCARCH)/lib/asm-offsets.s Kbuild
	$(call cmd,offsets)
