# att_syntax mergesort

.att_syntax
.global mergesort

mergesort:
	movl 4(%esp), %edx	# buffer pointer
	movl 8(%esp), %ecx	# buffer length

	
	0:
	# set edi to buffer base pointer and esi to buffer top pointer
	movl %edx, %edi
	movl %edx, %esi
	addl %ecx, %esi
	subl $4, %esi

	# check if array is longer than 1 element and split if true, otherwise return
	cmp $8, %ecx
	jge split
	ret

	split:
	# split array into two new arrays
	# lower buffer
	#pushl %ecx
	pushl %edi
	pushl %esi
	# Get middle of buffer
	movl $0, %edx
	movl %ecx, %eax
	movl $2, %ecx
	divl %ecx
	movl %edi, %esi
	addl %eax, %esi
	pushl %esi
	call 0b 	# sort
	# higher buffer
	popl %edi
	popl %esi
	call 0b 	# sort

	# merge higher and lower buffer
	popl %edi


	merge:
	# merge array in ecx to edx with edi to esi into eax
	ret


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
