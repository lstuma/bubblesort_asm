# bubblesort_asm
This is my first try at actually creating something _~usefull~_ - well at least something - in assembly..

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