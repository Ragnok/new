	.file	"josephus.c"
	.intel_syntax noprefix
# GNU C11 (Ubuntu 5.2.1-22ubuntu2) version 5.2.1 20151010 (x86_64-linux-gnu)
#	compiled by GNU C version 5.2.1 20151010, GMP version 6.0.0, MPFR version 3.1.3, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu josephus.c -masm=intel
# -mtune=generic -march=x86-64 -fstack-check=no -fverbose-asm
# -fstack-protector-strong -Wformat -Wformat-security
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcommon -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique -fident
# -finline-atomics -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fsigned-zeros
# -fsplit-ivs-in-unroller -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
# -ftree-coalesce-vars -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
# -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mtls-direct-seg-refs -mvzeroupper

	.globl	BUFLEN
	.section	.rodata
	.align 8
	.type	BUFLEN, @object
	.size	BUFLEN, 8
BUFLEN:
	.quad	64
	.text
	.globl	ll_circlify
	.type	ll_circlify, @function
ll_circlify:
.LFB2:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-24], rdi	# l, l
	mov	rax, QWORD PTR [rbp-24]	# tmp88, l
	mov	QWORD PTR [rbp-8], rax	# head, tmp88
	jmp	.L2	#
.L3:
	mov	rax, QWORD PTR [rbp-24]	# tmp89, l
	mov	rax, QWORD PTR [rax+8]	# tmp90, l_1->next
	mov	QWORD PTR [rbp-24], rax	# l, tmp90
.L2:
	mov	rax, QWORD PTR [rbp-24]	# tmp91, l
	mov	rax, QWORD PTR [rax+8]	# D.3104, l_1->next
	test	rax, rax	# D.3104
	jne	.L3	#,
	mov	rax, QWORD PTR [rbp-24]	# tmp92, l
	mov	rdx, QWORD PTR [rbp-8]	# tmp93, head
	mov	QWORD PTR [rax+8], rdx	# l_1->next, tmp93
	nop
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	ll_circlify, .-ll_circlify
	.globl	remove_next
	.type	remove_next, @function
remove_next:
.LFB3:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR [rbp-24], rdi	# l, l
	mov	rax, QWORD PTR [rbp-24]	# tmp89, l
	mov	rax, QWORD PTR [rax+8]	# tmp90, l_2(D)->next
	mov	QWORD PTR [rbp-8], rax	# to_remove, tmp90
	mov	rax, QWORD PTR [rbp-24]	# tmp91, l
	mov	rax, QWORD PTR [rax+8]	# D.3105, l_2(D)->next
	mov	rdx, QWORD PTR [rax+8]	# D.3105, _4->next
	mov	rax, QWORD PTR [rbp-24]	# tmp92, l
	mov	QWORD PTR [rax+8], rdx	# l_2(D)->next, D.3105
	mov	rax, QWORD PTR [rbp-8]	# tmp93, to_remove
	mov	QWORD PTR [rax+8], 0	# to_remove_3->next,
	mov	rax, QWORD PTR [rbp-8]	# tmp94, to_remove
	mov	rdi, rax	#, tmp94
	call	ll_destroy	#
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	remove_next, .-remove_next
	.section	.rodata
.LC0:
	.string	"Cannot initialize buffer"
.LC1:
	.string	"Failed to read from file"
	.align 8
.LC2:
	.string	"First line must be a positive number"
.LC3:
	.string	"Ran out of space for names"
	.align 8
.LC4:
	.string	"Name beginning '%s' is too long; max length of %zu allowed\n"
	.text
	.globl	read_file
	.type	read_file, @function
read_file:
.LFB4:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 80	#,
	mov	QWORD PTR [rbp-72], rdi	# fp, fp
	mov	QWORD PTR [rbp-80], rsi	# hops, hops
	mov	rax, QWORD PTR fs:40	# tmp136,
	mov	QWORD PTR [rbp-8], rax	# D.3113, tmp136
	xor	eax, eax	# tmp136
	cmp	QWORD PTR [rbp-72], 0	# fp,
	jne	.L6	#,
	mov	eax, 0	# D.3106,
	jmp	.L18	#
.L6:
	mov	eax, 64	# D.3107,
	mov	rdi, rax	#, D.3107
	call	malloc	#
	mov	QWORD PTR [rbp-40], rax	# buf, tmp108
	cmp	QWORD PTR [rbp-40], 0	# buf,
	jne	.L8	#,
	mov	edi, OFFSET FLAT:.LC0	#,
	call	perror	#
	mov	eax, 0	# D.3106,
	jmp	.L18	#
.L8:
	mov	QWORD PTR [rbp-56], 0	# head,
	mov	eax, 64	# D.3107,
	mov	ecx, eax	# D.3108, D.3107
	mov	rdx, QWORD PTR [rbp-72]	# tmp109, fp
	mov	rax, QWORD PTR [rbp-40]	# tmp110, buf
	mov	esi, ecx	#, D.3108
	mov	rdi, rax	#, tmp110
	call	fgets	#
	test	rax, rax	# D.3109
	jne	.L9	#,
	mov	edi, OFFSET FLAT:.LC1	#,
	call	perror	#
	jmp	.L10	#
.L9:
	mov	QWORD PTR [rbp-64], 0	# err,
	lea	rcx, [rbp-64]	# tmp111,
	mov	rax, QWORD PTR [rbp-40]	# tmp112, buf
	mov	edx, 10	#,
	mov	rsi, rcx	#, tmp111
	mov	rdi, rax	#, tmp112
	call	strtol	#
	mov	rdx, rax	# D.3107, D.3110
	mov	rax, QWORD PTR [rbp-80]	# tmp113, hops
	mov	QWORD PTR [rax], rdx	# *hops_25(D), D.3107
	mov	rax, QWORD PTR [rbp-64]	# D.3109, err
	test	rax, rax	# D.3109
	je	.L11	#,
	mov	rax, QWORD PTR [rbp-64]	# D.3109, err
	movzx	eax, BYTE PTR [rax]	# D.3111, *_28
	cmp	al, 10	# D.3111,
	je	.L11	#,
	mov	edi, OFFSET FLAT:.LC2	#,
	call	perror	#
	jmp	.L10	#
.L11:
	mov	rax, QWORD PTR [rbp-56]	# tmp114, head
	mov	QWORD PTR [rbp-48], rax	# tail, tmp114
	jmp	.L12	#
.L17:
	mov	rax, QWORD PTR [rbp-72]	# tmp115, fp
	mov	rdi, rax	#, tmp115
	call	ferror	#
	test	eax, eax	# D.3108
	je	.L13	#,
	mov	edi, OFFSET FLAT:.LC1	#,
	call	perror	#
	jmp	.L10	#
.L13:
	mov	eax, 64	# D.3107,
	mov	rdi, rax	#, D.3107
	call	malloc	#
	mov	QWORD PTR [rbp-32], rax	# cpy, tmp116
	cmp	QWORD PTR [rbp-32], 0	# cpy,
	jne	.L14	#,
	mov	edi, OFFSET FLAT:.LC3	#,
	call	perror	#
	jmp	.L10	#
.L14:
	mov	rax, QWORD PTR [rbp-40]	# tmp117, buf
	mov	esi, 10	#,
	mov	rdi, rax	#, tmp117
	call	strchr	#
	mov	QWORD PTR [rbp-24], rax	# nl, tmp118
	cmp	QWORD PTR [rbp-24], 0	# nl,
	jne	.L15	#,
	mov	eax, 64	# D.3107,
	lea	rcx, [rax-2]	# D.3107,
	mov	rax, QWORD PTR stderr[rip]	# D.3112, stderr
	mov	rdx, QWORD PTR [rbp-40]	# tmp119, buf
	mov	esi, OFFSET FLAT:.LC4	#,
	mov	rdi, rax	#, D.3112
	mov	eax, 0	#,
	call	fprintf	#
	jmp	.L10	#
.L15:
	mov	rax, QWORD PTR [rbp-24]	# tmp120, nl
	mov	BYTE PTR [rax], 0	# *nl_41,
	mov	edx, 64	# D.3107,
	mov	rcx, QWORD PTR [rbp-40]	# tmp121, buf
	mov	rax, QWORD PTR [rbp-32]	# tmp122, cpy
	mov	rsi, rcx	#, tmp121
	mov	rdi, rax	#, tmp122
	call	strncpy	#
	mov	rdi, rax	#, D.3109
	call	ll_create	#
	mov	QWORD PTR [rbp-16], rax	# new_tail, tmp123
	cmp	QWORD PTR [rbp-56], 0	# head,
	jne	.L16	#,
	mov	rax, QWORD PTR [rbp-16]	# tmp124, new_tail
	mov	QWORD PTR [rbp-56], rax	# head, tmp124
	mov	rax, QWORD PTR [rbp-56]	# tmp125, head
	mov	QWORD PTR [rbp-48], rax	# tail, tmp125
	jmp	.L12	#
.L16:
	mov	rax, QWORD PTR [rbp-48]	# tmp126, tail
	mov	rdx, QWORD PTR [rbp-16]	# tmp127, new_tail
	mov	QWORD PTR [rax+8], rdx	# tail_3->next, tmp127
	mov	rax, QWORD PTR [rbp-16]	# tmp128, new_tail
	mov	QWORD PTR [rbp-48], rax	# tail, tmp128
.L12:
	mov	eax, 64	# D.3107,
	mov	ecx, eax	# D.3108, D.3107
	mov	rdx, QWORD PTR [rbp-72]	# tmp129, fp
	mov	rax, QWORD PTR [rbp-40]	# tmp130, buf
	mov	esi, ecx	#, D.3108
	mov	rdi, rax	#, tmp130
	call	fgets	#
	test	rax, rax	# D.3109
	jne	.L17	#,
	mov	rax, QWORD PTR [rbp-40]	# tmp131, buf
	mov	rdi, rax	#, tmp131
	call	free	#
	mov	rax, QWORD PTR [rbp-56]	# tmp132, head
	mov	rdi, rax	#, tmp132
	call	ll_circlify	#
	mov	rax, QWORD PTR [rbp-56]	# D.3106, head
	jmp	.L18	#
.L10:
	mov	rax, QWORD PTR [rbp-56]	# tmp133, head
	mov	rdi, rax	#, tmp133
	call	ll_destroy	#
	mov	rax, QWORD PTR [rbp-40]	# tmp134, buf
	mov	rdi, rax	#, tmp134
	call	free	#
	mov	eax, 0	# D.3106,
.L18:
	mov	rsi, QWORD PTR [rbp-8]	# tmp137, D.3113
	xor	rsi, QWORD PTR fs:40	# tmp137,
	je	.L19	#,
	call	__stack_chk_fail	#
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	read_file, .-read_file
	.section	.rodata
.LC5:
	.string	"Usage: %s <file>\n"
.LC6:
	.string	"r"
.LC7:
	.string	"Could not open file"
.LC8:
	.string	"Exiting.\n"
.LC9:
	.string	"%s is eliminated\n"
.LC10:
	.string	"\n%s lives!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	sub	rsp, 64	#,
	mov	DWORD PTR [rbp-52], edi	# argc, argc
	mov	QWORD PTR [rbp-64], rsi	# argv, argv
	mov	rax, QWORD PTR fs:40	# tmp117,
	mov	QWORD PTR [rbp-8], rax	# D.3127, tmp117
	xor	eax, eax	# tmp117
	cmp	DWORD PTR [rbp-52], 2	# argc,
	je	.L21	#,
	mov	rax, QWORD PTR [rbp-64]	# tmp97, argv
	mov	rdx, QWORD PTR [rax]	# D.3122, *argv_12(D)
	mov	rax, QWORD PTR stderr[rip]	# D.3123, stderr
	mov	esi, OFFSET FLAT:.LC5	#,
	mov	rdi, rax	#, D.3123
	mov	eax, 0	#,
	call	fprintf	#
	mov	eax, 1	# D.3121,
	jmp	.L29	#
.L21:
	mov	rax, QWORD PTR [rbp-64]	# tmp98, argv
	add	rax, 8	# D.3124,
	mov	rax, QWORD PTR [rax]	# D.3122, *_17
	mov	esi, OFFSET FLAT:.LC6	#,
	mov	rdi, rax	#, D.3122
	call	fopen	#
	mov	QWORD PTR [rbp-16], rax	# fp, tmp99
	cmp	QWORD PTR [rbp-16], 0	# fp,
	jne	.L23	#,
	mov	edi, OFFSET FLAT:.LC7	#,
	call	perror	#
	mov	eax, 2	# D.3121,
	jmp	.L29	#
.L23:
	mov	QWORD PTR [rbp-48], 0	# hops,
	lea	rdx, [rbp-48]	# tmp100,
	mov	rax, QWORD PTR [rbp-16]	# tmp101, fp
	mov	rsi, rdx	#, tmp100
	mov	rdi, rax	#, tmp101
	call	read_file	#
	mov	QWORD PTR [rbp-40], rax	# group, tmp102
	mov	rax, QWORD PTR [rbp-16]	# tmp103, fp
	mov	rdi, rax	#, tmp103
	call	fclose	#
	cmp	QWORD PTR [rbp-40], 0	# group,
	jne	.L25	#,
	mov	rax, QWORD PTR stderr[rip]	# D.3123, stderr
	mov	rcx, rax	#, D.3123
	mov	edx, 9	#,
	mov	esi, 1	#,
	mov	edi, OFFSET FLAT:.LC8	#,
	call	fwrite	#
	mov	eax, 4	# D.3121,
	jmp	.L29	#
.L28:
	mov	rax, QWORD PTR [rbp-48]	# tmp104, hops
	mov	QWORD PTR [rbp-32], rax	# duck, tmp104
	mov	rax, QWORD PTR [rbp-40]	# tmp105, group
	mov	QWORD PTR [rbp-24], rax	# prev, tmp105
	jmp	.L26	#
.L27:
	mov	rax, QWORD PTR [rbp-40]	# tmp106, group
	mov	QWORD PTR [rbp-24], rax	# prev, tmp106
	mov	rax, QWORD PTR [rbp-40]	# tmp107, group
	mov	rax, QWORD PTR [rax+8]	# tmp108, group_1->next
	mov	QWORD PTR [rbp-40], rax	# group, tmp108
.L26:
	sub	QWORD PTR [rbp-32], 1	# duck,
	cmp	QWORD PTR [rbp-32], 0	# duck,
	jne	.L27	#,
	mov	rax, QWORD PTR [rbp-40]	# tmp109, group
	mov	rax, QWORD PTR [rax]	# D.3126, group_1->data
	mov	rsi, rax	#, D.3126
	mov	edi, OFFSET FLAT:.LC9	#,
	mov	eax, 0	#,
	call	printf	#
	mov	rax, QWORD PTR [rbp-24]	# tmp110, prev
	mov	rdi, rax	#, tmp110
	call	remove_next	#
	mov	rax, QWORD PTR [rbp-24]	# tmp111, prev
	mov	rax, QWORD PTR [rax+8]	# tmp112, prev_4->next
	mov	QWORD PTR [rbp-40], rax	# group, tmp112
.L25:
	mov	rax, QWORD PTR [rbp-40]	# tmp113, group
	mov	rax, QWORD PTR [rax+8]	# D.3125, group_2->next
	cmp	rax, QWORD PTR [rbp-40]	# D.3125, group
	jne	.L28	#,
	mov	rax, QWORD PTR [rbp-40]	# tmp114, group
	mov	rax, QWORD PTR [rax]	# D.3126, group_2->data
	mov	rsi, rax	#, D.3126
	mov	edi, OFFSET FLAT:.LC10	#,
	mov	eax, 0	#,
	call	printf	#
	mov	rax, QWORD PTR [rbp-40]	# tmp115, group
	mov	rdi, rax	#, tmp115
	call	remove_next	#
	mov	eax, 0	# D.3121,
.L29:
	mov	rcx, QWORD PTR [rbp-8]	# tmp118, D.3127
	xor	rcx, QWORD PTR fs:40	# tmp118,
	je	.L30	#,
	call	__stack_chk_fail	#
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
