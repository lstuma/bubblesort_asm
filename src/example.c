/*
 * This is an example on how to use the bubblesort function
 */

#include <stdio.h>

extern int bubblesort(int* arr, int size);

int main(int argc, char *argv[]) {
  // Create array with some integers
  int arr[] = {11,8,2,3,4,7,5,2,1};

  // sort array using bubblesort
  bubblesort(arr, sizeof(arr));

  // Write array to stdout
  for(int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++) printf("%u, ", arr[i]);
}
