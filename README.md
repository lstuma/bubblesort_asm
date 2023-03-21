# Sorting Algorithms!
Implementing different sorting algorithms in Assembly x86

## Usage
### In x86
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
call insertionsort
```
```asm
call quicksort
```

### In C
```c
// Bubblesort
bubblesort(arr, sizeof(arr));
// Insertionsort
insertionsort(arr, sizeof(arr));
// Quicksort
quicksort(arr, sizeof(arr));
```

## Example Usage
Example code for usage of sorting functions. (src/example.c)
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

## Assembling, Compiling and Linking
Remember that the assembly code is written for x86 architecture in at&t syntax when assembling and compiling.
```bash
as bubblesort.asm --32 -o bubblesort.o -g
as insertionsort.asm --32 -o insertionsort.o -g
as quicksort.asm --32 -o quicksort.o -g
gcc -m32 -masm=att -o example example.c bubblesort.o insertionsort.o quicksort.o
```
