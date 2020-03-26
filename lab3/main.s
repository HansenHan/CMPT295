	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	get_byte_by_order
	.type	get_byte_by_order, @function
get_byte_by_order:
.LFB23:
	.cfi_startproc
	testl	%esi, %esi
	je	.L8
	cmpl	$1, %esi
	je	.L9
	cmpl	$2, %esi
	je	.L10
	cmpl	$3, %esi
	je	.L11
	rep ret
	.p2align 4,,10
	.p2align 3
.L8:
	movzbl	%dil, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%edi, %eax
	movzbl	%ah, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%edi, %eax
	shrl	$24, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%edi, %eax
	sarl	$16, %eax
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	get_byte_by_order, .-get_byte_by_order
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"x = %#.08x\n"
.LC1:
	.string	"x = %i\n"
.LC2:
	.string	"y = %#.08x\n"
.LC3:
	.string	"y = %u\n"
.LC4:
	.string	"x = "
.LC5:
	.string	"%02x"
.LC6:
	.string	"y = "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	movl	x(%rip), %edx
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC0, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__printf_chk
	movl	x(%rip), %edx
	movl	$.LC1, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	y(%rip), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movl	y(%rip), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movl	$.LC4, %esi
	movl	$1, %edi
	call	__printf_chk
	testq	%rbx, %rbx
	movl	x(%rip), %edx
	je	.L30
.L14:
	cmpl	$1, %ebx
	je	.L32
	cmpl	$2, %ebx
	je	.L33
	shrl	$24, %edx
	xorl	%eax, %eax
	movl	$.LC5, %esi
	movl	$1, %edi
	call	__printf_chk
	cmpl	$3, %ebx
	je	.L34
.L18:
	addq	$1, %rbx
	movl	x(%rip), %edx
	testq	%rbx, %rbx
	jne	.L14
.L30:
	movzbl	%dl, %edx
.L15:
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L34:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	call	_IO_putc
	movl	$.LC4, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L19:
	movl	%ebx, %esi
	movl	$x, %edi
	addl	$1, %ebx
	call	get_byte_by_addr
	movl	$.LC5, %esi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	cmpl	$4, %ebx
	jne	.L19
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	call	_IO_putc
	xorl	%eax, %eax
	movl	$.LC6, %esi
	movl	$1, %edi
	call	__printf_chk
	testq	%rbx, %rbx
	movl	y(%rip), %edx
	je	.L31
.L21:
	cmpl	$1, %ebx
	je	.L35
	cmpl	$2, %ebx
	je	.L36
	shrl	$24, %edx
	xorl	%eax, %eax
	movl	$.LC5, %esi
	movl	$1, %edi
	call	__printf_chk
	cmpl	$3, %ebx
	je	.L37
.L25:
	addq	$1, %rbx
	movl	y(%rip), %edx
	testq	%rbx, %rbx
	jne	.L21
.L31:
	movzbl	%dl, %edx
.L22:
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L37:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	xorl	%ebx, %ebx
	call	_IO_putc
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L26:
	movl	%ebx, %esi
	movl	$y, %edi
	addl	$1, %ebx
	call	get_byte_by_addr
	movl	$.LC5, %esi
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	cmpl	$4, %ebx
	jne	.L26
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	jmp	_IO_putc
.L32:
	.cfi_restore_state
	movzbl	%dh, %edx
	jmp	.L15
.L35:
	movzbl	%dh, %edx
	jmp	.L22
.L33:
	sarl	$16, %edx
	jmp	.L30
.L36:
	sarl	$16, %edx
	jmp	.L31
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	y
	.data
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.long	2908479998 #-42
	.globl	x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	233876875 #19088743
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~16.04~ppa1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
