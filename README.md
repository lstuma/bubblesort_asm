# Sorting Algorithms!
Implementing sorting algorithms in Assembly x86

## Usage
### in x86
```asm
# push integer array pointer to stack
push %ebx
# push length of array (in bytes) to stack
pushl %ecx
```
```asm
call bubblesort
```
```asm
call indexsort
```

### in C
```c
// Bubblesort
bubblesort(arr, sizeof(arr));
// Indexsort
indexsort(arr, sizeof(arr));
```

## example.c
Example code for usage of sorting functions placed in src/ folder.
### Console Output:
```
original array:
11, 8, 2, 3, 4, 7, 5, 2, 1, 
bubblesort:
1, 2, 2, 3, 4, 5, 7, 8, 11, 
Indexsort:
1, 2, 2, 3, 4, 5, 7, 8, 11,
```

## assembling, compiling and linking
The assembly code is written for x86 architecture in at&t syntax. Remember that when assembling and compiling.
```bash
as bubblesort.asm --32 -o bubblesort.o -g
as indexsort.asm --32 -o indexsort.o -g
gcc -m32 -masm=att -o example example.c bubblesort.o indexsort.o
```
