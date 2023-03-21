# att_syntax quicksort

.att_syntax
.global quicksort

quicksort:
	movl 4(%esp), %edx		# buffer pointer (i)
	movl 8(%esp), %ecx		# buffer length (in bytes)

	# set edi to bottom and esi to top buffer pointer
	movl %edx, %edi
	movl %edx, %esi
	addl %ecx, %esi
	subl $4, %esi


	sort:
		# ecx will be i, while edx will be j
		movl %edi, %ecx
		subl $4, %ecx
		movl %ecx, %edx

		# pivot will be last element
		pushl %edi
		movl (%esi), %edi

		0:
		# move one element further
		addl $4, %edx

		# check if end of buffer has been reached
		cmp %esi, %edx
		jl 1f
		
		# set edi back to buffer base pointer
		popl %edi
		# check if this partition of the buffer is small enough (length <= 3) and therefore has been fully sorted
		movl %esi, %eax
		subl %edi, %eax
		# check if pivot has to be moved (length > 1)
		cmp $0, %eax
		jle 3f
		# move pivot to middle of both partitions
		addl $4, %ecx
		movl %esi, %edx
		call swap
		3:
		cmp $8, %eax
		jge 2f
		ret
		2:
		# sort lower partition first
		pushl %edi
		pushl %esi
		pushl %ecx
		subl $4, %ecx
		movl %ecx, %esi
		call sort

		# sort higher partition
		popl %ecx
		popl %esi
		popl %edi
		addl $4, %ecx
		movl %ecx, %edi
		call sort

		movl %ecx, %eax
		subl %esi, %eax
		ret
		1:
		# swap elements if needed
		cmp (%edx), %edi
		jl 1f

		# swap elements 
		addl $4, %ecx
		call swap

		1:
		# compare next element
		jmp 0b


#
# swaps out integers at memory addresses in ecx and edx and sets swapped flag to true
#
swap:
    # Switch values
    pushl (%edx)
    pushl (%ecx)
    popl (%edx)
    popl (%ecx)
    ret
