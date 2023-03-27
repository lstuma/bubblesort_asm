# Sorting Algorithms!
Implementing sorting algorithms in Assembly x86

## Usage
### in x86
```gas
# push integer array pointer to stack
push %ebx
# push length of array (in bytes) to stack
pushl %ecx
```
```gas
call bubblesort
```
```gas
call insertionsort
```
```gas
call quicksort
```

### in C
```c
// Bubblesort
bubblesort(arr, sizeof(arr));
// Insertionsort
insertionsort(arr, sizeof(arr));
// Quicksort
quicksort(arr, sizeof(arr));
```

## example.c
Example code for usage of sorting functions placed in src/ folder.
### Console Output:
```
original array:
11, 8, 10, 12, 14, 2, 3, 6, 7, 5, 2, 1
bubblesort:
1, 2, 2, 3, 5, 6, 7, 8, 10, 11, 12, 14
Insertionsort:
1, 2, 2, 3, 5, 6, 7, 8, 10, 11, 12, 14
Quicksort:
1, 2, 2, 3, 5, 6, 7, 8, 10, 11, 12, 14
```

## assembling, compiling and linking
The assembly code is written for x86 architecture in at&t syntax. Remember that when assembling and compiling.
```bash
as bubblesort.asm --32 -o bubblesort.o -g
as insertionsort.asm --32 -o insertionsort.o -g
as quicksort.asm --32 -o quicksort.o -g
gcc -m32 -masm=att -o example example.c bubblesort.o insertionsort.o quicksort.o
```
