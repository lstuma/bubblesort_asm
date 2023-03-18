# att_syntax indexsort

.att_syntax
.global indexsort

#
# sorts buffer using indexsort
#
# stack 1: buffer length
# stack 2: buffer pointer
#
indexsort:
	movl 4(%esp), %edx		# buffer pointer (i)
	movl 8(%esp), %ecx		# buffer length (in bytes)

	# set esi to top buffer pointer and edi to bottom buffer pointer
	movl %edx, %edi
	movl %edx, %esi
	addl %ecx, %esi

	# push first index pointer to stack
	pushl %edx

	# move once through the array
	iterate:
		
		0:
		# edx: higher pointer
		popl %edx
		addl $4, %edx
		pushl %edx

		# if top has been reached return
		cmp %edx, %esi
		jne 1f
		popl %edx
		ret
		
		1:
		# ecx: lower pointer
		movl %edx, %ecx
		subl $4, %ecx		

		# go to next index if they don't need to be swapped
		pushl %ecx
        pushl %edx
        movl (%ecx), %ecx
        movl (%edx), %edx
        cmp %edx, %ecx
        popl %edx
        popl %ecx
		jl 2f
		# swapping needed: continue iterating
		call swap
		# check if base of buffer has been reached and if yes move to next index
		cmp %ecx, %edi
		je 0b
		# move pointers one element down
		movl %ecx, %edx
		
		# check for next index
		jmp 1b

		2:
		# stop iterating
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
