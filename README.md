# sorting algorithms
Implementing sorting algorithms in Assembly x86

## Usage
### in x86
```asm
# push integer array pointer to stack
push %ebx
# push length of array (in bytes) to stack
pushl %ecx
# call label
call bubblesort
```

### in C
```c
bubblesort(arr, sizeof(arr));
```

## example.c
Example code for usage of function placed in src/ folder.
### Console Output:
```
1, 2, 3, 4, 5, 7, 8, 11,
```

## assembling, compiling and linking
The assembly code is written for x86 architecture in at&t syntax. Remember that when assembling and compiling.
```bash
as bubblesort.asm --32 -o bubblesort.o -g
echo "compiling" && gcc -m32 -masm=att -o example example.c bubblesort.o
```
