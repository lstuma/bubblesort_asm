# att_syntax bubblesort

.att_syntax
.global bubblesort
#
# sorts buffer
#
# stack1: buffer length
# stack2: buffer pointer
#
bubblesort:
    movl 8(%esp), %ecx
    movl 4(%esp), %esi
    addl %esi, %ecx
    subl $4, %ecx
    pushl %ecx
    movl $1, %edi

    # start sorting
    jmp loop_re

    sorting_loop:

        pushl %ecx
        pushl %edx
        # compare values at ecx and edx
        movl (%ecx), %ecx
        movl (%edx), %edx
        cmp %edx, %ecx

        popl %edx
        popl %ecx
        # swap if needed otherwise skip
        jge skip_swap
            call swap

        skip_swap:

        # either restart loop or go further in loop
        cmp %esi, %edx

        # let pointers go further if they'll still be in the array
        je skip_step

        step:
            # move pointers one step forward
            subl $4, %ecx
            subl $4, %edx
        skip_step:

        # if pointers are still in array go next step in bubblesort
        jne sorting_loop

        skip_sorting_loop:
        je loop_re

    loop_re:
        # set ecx to end of buffer
        popl %ecx                 # higher buffer pointer

        # set edx one bellow ecx
        movl %ecx, %edx                  # edx: lower buffer pointer
        subl $4, %edx
        pushl %ecx

        # do not need to check lowest position since it has 100% already been correctly sorted
        #addl $4, %esi


        # check if array has been swapped last iteration
        cmp $0, %edi
        jne continue
        popl %ecx
        ret

        continue:
        movl $0, %edi                # edi: swapped flag

        jmp sorting_loop

#
# swaps out integers at memory addresses in ecx and edx and sets swapped flag to true
#
swap:
    # Switch values
    pushl (%edx)
    pushl (%ecx)
    popl (%edx)
    popl (%ecx)

    # set swapped flag
    movl $1, %edi
    ret
