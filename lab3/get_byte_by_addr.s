	.globl get_byte_by_addr
get_byte_by_addr:
	movl $0, %eax
	mov (%rsi, %rdi), %al
	
	# place your code for Part 3 here

	# end of Part 3

	ret
