# att_syntax bubblesort

.global main
.section .text

main:
	# allocate buffer for byte array
	push $16			#
	call malloc			# allocate 16 bytes
	addl $4, %esp		# clean up stack
	movl %eax, %ecx

	# fill buffer
	movl $0x02010301, 0(%ecx)
	movl $0x08070903, 4(%ecx)
	movl $0x06030504, 8(%ecx)
	movl $0x08020401, 12(%ecx)

	# swap places at index 3 and 6
	mov $3, %eax
	mov $7, %ebx
	call swap

	# sort buffer

	# print out buffer
	movl $16, %edx
	call stdout_int_buffer

	# exit process
	movl $1, %eax		# exit syscall
	movl $0, %ebx		# exit code 0
	int $0x80			# (kernel call)

#
# sorts buffer in ecx
#
# ecx: pointer to buffer
#
# d1, dh: as indexes
# eax: for length
# ebx: for tmp values
bubblesort:
	ret

#
# swaps out integers in buffer pointed to by ecx at index dl and dh
#
# ecx: pointer to buffer
# eax: index1
# ebx: index2
#
# dl: stores tmp value
# dh: stores tmp value
#
swap:
	# Calculate addresses for indexes
	addl %ecx, %eax
	addl %ecx, %ebx
	movb (%eax), %dl
	movb (%ebx), %dh
	movb %dl, (%ebx)
	movb %dh, (%eax)
	ret

#
# writes out int buffer pointed to by ecx to stdout
#
# ecx: pointer to buffer
# edx: size of buffer
#
# ebx: stores tmp index value
# dh: stores tmp value
stdout_int_buffer:
	addl %ecx, %edx			# edx marks end of buffer
	movl %ecx, %ebx			#
	call write
	ret
write:
	addl $48, (%ebx)
	addl $1, %ebx
	cmp %ebx, %edx
	jne write
	subl %ecx, %edx
format:
	# allocate buffer double the original size
	imul $2, %edx			#
	push %edx				#
	call malloc				#
	addl $4, %esp			#


	call print
	ret

#
# copies array pointed to by ecx to array pointed to by edx
#
# ecx: arr1
# ebx: arr2
# edx: length
#


#
# write to stdout
#
# ecx: pointer to buffer
# edx: size of buffer
#
print:
	movl $4, %eax			# write
	movl $1, %ebx			# stdou
	int $0x80				# (kernel call)
	ret

.section .data
