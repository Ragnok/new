	.file	"driver.c"
	.intel_syntax noprefix
	.text
	.globl	pq_compare
	.type	pq_compare, @function
pq_compare:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-24], rdi
	mov	QWORD PTR [rbp-32], rsi
	cmp	QWORD PTR [rbp-24], 0
	jne	.L2
	mov	rax, QWORD PTR [rbp-32]
	neg	eax
	jmp	.L3
.L2:
	cmp	QWORD PTR [rbp-32], 0
	jne	.L4
	mov	rax, QWORD PTR [rbp-24]
	jmp	.L3
.L4:
	mov	rax, QWORD PTR [rbp-24]
	mov	QWORD PTR [rbp-16], rax
	mov	rax, QWORD PTR [rbp-32]
	mov	QWORD PTR [rbp-8], rax
	mov	rax, QWORD PTR [rbp-16]
	mov	edx, DWORD PTR [rax+8]
	mov	rax, QWORD PTR [rbp-8]
	mov	eax, DWORD PTR [rax+8]
	sub	edx, eax
	mov	eax, edx
.L3:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	pq_compare, .-pq_compare
	.globl	__make_node
	.type	__make_node, @function
__make_node:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR [rbp-24], rdi
	mov	DWORD PTR [rbp-28], esi
	mov	edi, 16
	call	malloc
	mov	QWORD PTR [rbp-8], rax
	cmp	QWORD PTR [rbp-8], 0
	jne	.L6
	mov	eax, 0
	jmp	.L7
.L6:
	mov	rax, QWORD PTR [rbp-8]
	mov	rdx, QWORD PTR [rbp-24]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR [rbp-8]
	mov	edx, DWORD PTR [rbp-28]
	mov	DWORD PTR [rax+8], edx
	mov	rax, QWORD PTR [rbp-8]
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	__make_node, .-__make_node
	.globl	__make_vnode
	.type	__make_vnode, @function
__make_vnode:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR [rbp-20], edi
	mov	QWORD PTR [rbp-32], rsi
	mov	QWORD PTR [rbp-40], rdx
	mov	edi, 24
	call	malloc
	mov	QWORD PTR [rbp-8], rax
	cmp	QWORD PTR [rbp-8], 0
	jne	.L9
	mov	eax, 0
	jmp	.L10
.L9:
	mov	rax, QWORD PTR [rbp-8]
	mov	rdx, QWORD PTR [rbp-40]
	mov	QWORD PTR [rax+16], rdx
	mov	rax, QWORD PTR [rbp-8]
	mov	edx, DWORD PTR [rbp-20]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR [rbp-8]
	mov	rdx, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+8], rdx
	mov	rax, QWORD PTR [rbp-8]
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	__make_vnode, .-__make_vnode
	.globl	dijkstra_path
	.type	dijkstra_path, @function
dijkstra_path:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 152
	.cfi_offset 3, -24
	mov	QWORD PTR [rbp-136], rdi
	mov	QWORD PTR [rbp-144], rsi
	mov	QWORD PTR [rbp-152], rdx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-24], rax
	xor	eax, eax
	mov	edi, OFFSET FLAT:pq_compare
	call	heap_create
	mov	QWORD PTR [rbp-96], rax
	mov	rax, QWORD PTR [rbp-144]
	mov	esi, 0
	mov	rdi, rax
	call	__make_node
	mov	QWORD PTR [rbp-88], rax
	mov	rdx, QWORD PTR [rbp-88]
	mov	rax, QWORD PTR [rbp-96]
	mov	rsi, rdx
	mov	rdi, rax
	call	heap_add
	call	hash_create
	mov	QWORD PTR [rbp-80], rax
	mov	rax, QWORD PTR [rbp-88]
	mov	edx, 0
	mov	rsi, rax
	mov	edi, 0
	call	__make_vnode
	mov	QWORD PTR [rbp-72], rax
	mov	rdx, QWORD PTR [rbp-72]
	mov	rcx, QWORD PTR [rbp-144]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rcx
	mov	rdi, rax
	call	hash_insert
	jmp	.L12
.L19:
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	heap_remove_min
	mov	QWORD PTR [rbp-64], rax
	mov	rax, QWORD PTR [rbp-64]
	mov	rax, QWORD PTR [rax]
	cmp	rax, QWORD PTR [rbp-152]
	je	.L26
	mov	rax, QWORD PTR [rbp-64]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-136]
	mov	rsi, rdx
	mov	rdi, rax
	call	graph_adjacent_to
	mov	QWORD PTR [rbp-56], rax
	mov	rax, QWORD PTR [rbp-56]
	mov	QWORD PTR [rbp-104], rax
	jmp	.L15
.L18:
	mov	rax, QWORD PTR [rbp-64]
	mov	ebx, DWORD PTR [rax+8]
	mov	rax, QWORD PTR [rbp-104]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-64]
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-136]
	mov	rsi, rcx
	mov	rdi, rax
	call	graph_edge_weight
	add	eax, ebx
	mov	DWORD PTR [rbp-116], eax
	mov	rax, QWORD PTR [rbp-104]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_exists
	xor	eax, 1
	test	al, al
	je	.L16
	mov	rax, QWORD PTR [rbp-104]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-116]
	mov	esi, edx
	mov	rdi, rax
	call	__make_node
	mov	QWORD PTR [rbp-48], rax
	mov	rax, QWORD PTR [rbp-64]
	mov	rdx, QWORD PTR [rax]
	mov	rcx, QWORD PTR [rbp-48]
	mov	eax, DWORD PTR [rbp-116]
	mov	rsi, rcx
	mov	edi, eax
	call	__make_vnode
	mov	QWORD PTR [rbp-40], rax
	mov	rax, QWORD PTR [rbp-104]
	mov	rcx, QWORD PTR [rax]
	mov	rdx, QWORD PTR [rbp-40]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rcx
	mov	rdi, rax
	call	hash_insert
	mov	rdx, QWORD PTR [rbp-48]
	mov	rax, QWORD PTR [rbp-96]
	mov	rsi, rdx
	mov	rdi, rax
	call	heap_add
	jmp	.L17
.L16:
	mov	rax, QWORD PTR [rbp-104]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_fetch
	mov	QWORD PTR [rbp-32], rax
	mov	rax, QWORD PTR [rbp-32]
	mov	eax, DWORD PTR [rax]
	cmp	eax, DWORD PTR [rbp-116]
	jle	.L17
	mov	rax, QWORD PTR [rbp-32]
	mov	edx, DWORD PTR [rbp-116]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR [rbp-64]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-32]
	mov	QWORD PTR [rax+16], rdx
	mov	rax, QWORD PTR [rbp-32]
	mov	rax, QWORD PTR [rax+8]
	mov	edx, DWORD PTR [rbp-116]
	mov	DWORD PTR [rax+8], edx
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	heap_rebalance
.L17:
	mov	rax, QWORD PTR [rbp-104]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR [rbp-104], rax
.L15:
	cmp	QWORD PTR [rbp-104], 0
	jne	.L18
.L12:
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	heap_is_empty
	xor	eax, 1
	test	al, al
	jne	.L19
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	heap_destroy
	mov	rax, QWORD PTR [rbp-80]
	mov	rdi, rax
	call	hash_destroy
	mov	eax, 0
	jmp	.L23
.L26:
	nop
.L14:
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	heap_destroy
	mov	rax, QWORD PTR [rbp-152]
	mov	rdi, rax
	call	ll_create
	mov	QWORD PTR [rbp-112], rax
	jmp	.L21
.L22:
	mov	rax, QWORD PTR [rbp-112]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_fetch
	mov	rdx, QWORD PTR [rax+16]
	lea	rax, [rbp-112]
	mov	rsi, rdx
	mov	rdi, rax
	call	ll_add
.L21:
	mov	rax, QWORD PTR [rbp-112]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-80]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_fetch
	mov	rax, QWORD PTR [rax+16]
	test	rax, rax
	jne	.L22
	mov	rax, QWORD PTR [rbp-80]
	mov	rdi, rax
	call	hash_destroy
	mov	rax, QWORD PTR [rbp-112]
.L23:
	mov	rbx, QWORD PTR [rbp-24]
	xor	rbx, QWORD PTR fs:40
	je	.L24
	call	__stack_chk_fail
.L24:
	add	rsp, 152
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	dijkstra_path, .-dijkstra_path
	.globl	graph_path
	.type	graph_path, @function
graph_path:
.LFB4:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR [rbp-72], rdi
	mov	QWORD PTR [rbp-80], rsi
	mov	QWORD PTR [rbp-88], rdx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-8], rax
	xor	eax, eax
	call	hash_create
	mov	QWORD PTR [rbp-40], rax
	call	queue_create
	mov	QWORD PTR [rbp-32], rax
	mov	rcx, QWORD PTR [rbp-80]
	mov	rax, QWORD PTR [rbp-40]
	mov	edx, 0
	mov	rsi, rcx
	mov	rdi, rax
	call	hash_insert
	mov	rdx, QWORD PTR [rbp-80]
	mov	rax, QWORD PTR [rbp-32]
	mov	rsi, rdx
	mov	rdi, rax
	call	queue_enqueue
	jmp	.L28
.L33:
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	queue_dequeue
	mov	QWORD PTR [rbp-24], rax
	mov	rdx, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rbp-72]
	mov	rsi, rdx
	mov	rdi, rax
	call	graph_adjacent_to
	mov	QWORD PTR [rbp-16], rax
	mov	rax, QWORD PTR [rbp-16]
	mov	QWORD PTR [rbp-48], rax
	jmp	.L29
.L32:
	mov	rax, QWORD PTR [rbp-48]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-40]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_exists
	xor	eax, 1
	test	al, al
	je	.L30
	mov	rax, QWORD PTR [rbp-48]
	mov	rcx, QWORD PTR [rax]
	mov	rdx, QWORD PTR [rbp-24]
	mov	rax, QWORD PTR [rbp-40]
	mov	rsi, rcx
	mov	rdi, rax
	call	hash_insert
	mov	rax, QWORD PTR [rbp-48]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-32]
	mov	rsi, rdx
	mov	rdi, rax
	call	queue_enqueue
	mov	rax, QWORD PTR [rbp-48]
	mov	rax, QWORD PTR [rax]
	cmp	rax, QWORD PTR [rbp-88]
	jne	.L30
	mov	rax, QWORD PTR [rbp-16]
	mov	rdi, rax
	call	ll_disassemble
	nop
.L31:
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	queue_disassemble
	mov	rax, QWORD PTR [rbp-88]
	mov	rdi, rax
	call	ll_create
	mov	QWORD PTR [rbp-56], rax
	jmp	.L35
.L30:
	mov	rax, QWORD PTR [rbp-48]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR [rbp-48], rax
.L29:
	cmp	QWORD PTR [rbp-48], 0
	jne	.L32
	mov	rax, QWORD PTR [rbp-16]
	mov	rdi, rax
	call	ll_disassemble
.L28:
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	queue_is_empty
	xor	eax, 1
	test	al, al
	jne	.L33
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	queue_disassemble
	mov	rax, QWORD PTR [rbp-40]
	mov	rdi, rax
	call	hash_disassemble
	mov	eax, 0
	jmp	.L37
.L36:
	mov	rax, QWORD PTR [rbp-56]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-40]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_fetch
	mov	rdx, rax
	lea	rax, [rbp-56]
	mov	rsi, rdx
	mov	rdi, rax
	call	ll_add
.L35:
	mov	rax, QWORD PTR [rbp-56]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR [rbp-40]
	mov	rsi, rdx
	mov	rdi, rax
	call	hash_fetch
	test	rax, rax
	jne	.L36
	mov	rax, QWORD PTR [rbp-40]
	mov	rdi, rax
	call	hash_disassemble
	mov	rax, QWORD PTR [rbp-56]
.L37:
	mov	rcx, QWORD PTR [rbp-8]
	xor	rcx, QWORD PTR fs:40
	je	.L38
	call	__stack_chk_fail
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	graph_path, .-graph_path
	.section	.rodata
.LC0:
	.string	"L"
.LC1:
	.string	"\n%zu nodes, %zu edges\n"
.LC2:
	.string	"A"
.LC3:
	.string	"From A to L: "
.LC4:
	.string	"Shortest A to L: "
.LC5:
	.string	"K"
.LC6:
	.string	"From K to L: "
.LC7:
	.string	"Shortest K to L: "
.LC8:
	.string	"D"
.LC9:
	.string	"From D to A: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	call	big_graph
	mov	QWORD PTR [rbp-64], rax
	mov	rax, QWORD PTR [rbp-64]
	mov	esi, OFFSET FLAT:print_item
	mov	rdi, rax
	call	graph_print
	mov	rax, QWORD PTR [rbp-64]
	mov	esi, OFFSET FLAT:.LC0
	mov	rdi, rax
	call	graph_remove_node
	mov	rax, QWORD PTR [rbp-64]
	mov	esi, OFFSET FLAT:print_item
	mov	rdi, rax
	call	graph_print
	mov	rax, QWORD PTR [rbp-64]
	mov	rdi, rax
	call	graph_edge_count
	mov	rbx, rax
	mov	rax, QWORD PTR [rbp-64]
	mov	rdi, rax
	call	graph_node_count
	mov	rdx, rbx
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	graph_path
	mov	QWORD PTR [rbp-56], rax
	mov	edi, OFFSET FLAT:.LC3
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-56]
	mov	rdi, rax
	call	print_path
	mov	rax, QWORD PTR [rbp-56]
	mov	rdi, rax
	call	ll_disassemble
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	dijkstra_path
	mov	QWORD PTR [rbp-48], rax
	mov	edi, OFFSET FLAT:.LC4
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-48]
	mov	rdi, rax
	call	print_path
	mov	rax, QWORD PTR [rbp-48]
	mov	rdi, rax
	call	ll_disassemble
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	call	graph_path
	mov	QWORD PTR [rbp-40], rax
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-40]
	mov	rdi, rax
	call	print_path
	mov	rax, QWORD PTR [rbp-40]
	mov	rdi, rax
	call	ll_disassemble
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	call	dijkstra_path
	mov	QWORD PTR [rbp-32], rax
	mov	edi, OFFSET FLAT:.LC7
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	print_path
	mov	rax, QWORD PTR [rbp-32]
	mov	rdi, rax
	call	ll_disassemble
	mov	rax, QWORD PTR [rbp-64]
	mov	edx, OFFSET FLAT:.LC2
	mov	esi, OFFSET FLAT:.LC8
	mov	rdi, rax
	call	graph_path
	mov	QWORD PTR [rbp-24], rax
	mov	edi, OFFSET FLAT:.LC9
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-24]
	mov	rdi, rax
	call	print_path
	mov	rax, QWORD PTR [rbp-24]
	mov	rdi, rax
	call	ll_disassemble
	mov	rax, QWORD PTR [rbp-64]
	mov	rdi, rax
	call	graph_disassemble
	mov	eax, 0
	add	rsp, 56
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
.LC10:
	.string	"B"
.LC11:
	.string	"C"
.LC12:
	.string	"E"
.LC13:
	.string	"F"
.LC14:
	.string	"G"
.LC15:
	.string	"H"
.LC16:
	.string	"J"
	.text
	.globl	big_graph
	.type	big_graph, @function
big_graph:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	graph_create
	mov	QWORD PTR [rbp-8], rax
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC10
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC11
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC8
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC13
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC14
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC15
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC16
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	esi, OFFSET FLAT:.LC0
	mov	rdi, rax
	call	graph_add_node
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 14
	mov	edx, OFFSET FLAT:.LC10
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 11
	mov	edx, OFFSET FLAT:.LC5
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 10
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 3
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC10
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 6
	mov	edx, OFFSET FLAT:.LC13
	mov	esi, OFFSET FLAT:.LC10
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 1
	mov	edx, OFFSET FLAT:.LC10
	mov	esi, OFFSET FLAT:.LC11
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 6
	mov	edx, OFFSET FLAT:.LC12
	mov	esi, OFFSET FLAT:.LC11
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 6
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC8
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 10
	mov	edx, OFFSET FLAT:.LC14
	mov	esi, OFFSET FLAT:.LC8
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 6
	mov	edx, OFFSET FLAT:.LC8
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 15
	mov	edx, OFFSET FLAT:.LC13
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 7
	mov	edx, OFFSET FLAT:.LC15
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 9
	mov	edx, OFFSET FLAT:.LC5
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 11
	mov	edx, OFFSET FLAT:.LC10
	mov	esi, OFFSET FLAT:.LC12
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 8
	mov	edx, OFFSET FLAT:.LC15
	mov	esi, OFFSET FLAT:.LC13
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 7
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC13
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 16
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC13
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 13
	mov	edx, OFFSET FLAT:.LC12
	mov	esi, OFFSET FLAT:.LC14
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 10
	mov	edx, OFFSET FLAT:.LC16
	mov	esi, OFFSET FLAT:.LC14
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 5
	mov	edx, OFFSET FLAT:.LC14
	mov	esi, OFFSET FLAT:.LC15
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 9
	mov	edx, OFFSET FLAT:.LC16
	mov	esi, OFFSET FLAT:.LC15
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 19
	mov	edx, OFFSET FLAT:.LC13
	mov	esi, OFFSET FLAT:.LC16
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 7
	mov	edx, OFFSET FLAT:.LC0
	mov	esi, OFFSET FLAT:.LC16
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 5
	mov	edx, OFFSET FLAT:.LC11
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	mov	ecx, 18
	mov	edx, OFFSET FLAT:.LC14
	mov	esi, OFFSET FLAT:.LC5
	mov	rdi, rax
	call	graph_add_edge
	mov	rax, QWORD PTR [rbp-8]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	big_graph, .-big_graph
	.section	.rodata
.LC17:
	.string	"\n%s"
.LC18:
	.string	" \342\206\222 %s"
	.text
	.globl	print_item
	.type	print_item, @function
print_item:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR [rbp-8], rdi
	mov	eax, esi
	mov	BYTE PTR [rbp-12], al
	cmp	BYTE PTR [rbp-12], 0
	je	.L44
	mov	rax, QWORD PTR [rbp-8]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC17
	mov	eax, 0
	call	printf
	jmp	.L46
.L44:
	mov	rax, QWORD PTR [rbp-8]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC18
	mov	eax, 0
	call	printf
.L46:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	print_item, .-print_item
	.section	.rodata
.LC19:
	.string	"%s \342\206\222 "
	.text
	.globl	print_path
	.type	print_path, @function
print_path:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR [rbp-8], rdi
	jmp	.L48
.L49:
	mov	rax, QWORD PTR [rbp-8]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC19
	mov	eax, 0
	call	printf
	mov	rax, QWORD PTR [rbp-8]
	mov	rax, QWORD PTR [rax+8]
	mov	QWORD PTR [rbp-8], rax
.L48:
	cmp	QWORD PTR [rbp-8], 0
	jne	.L49
	mov	edi, 10
	call	putchar
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_path, .-print_path
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
