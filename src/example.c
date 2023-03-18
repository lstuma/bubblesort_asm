/*
 * This is an example on how to use the bubblesort function
 */

#include <stdio.h>

extern int bubblesort(int* arr, int size);
extern int insertionsort(int* arr, int size);

int main(int argc, char *argv[]) {
  // Create array with some integers
  int arr[] = {11,8,2,3,4,7,5,2,1};
  int arr2[] = {11,8,2,3,4,7,5,2,1};
  int arr3[] = {11,8,2,3,4,7,5,2,1};
  
  /*
  *   Original
  */
  printf("\noriginal array:\n");
  for(int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++) printf("%u, ", arr[i]);

  /*
  *   Bubblesort
  */
  bubblesort(arr2, sizeof(arr2));
  printf("\nbubblesort:\n");
  for(int i = 0; i < sizeof(arr2)/sizeof(arr2[0]); i++) printf("%u, ", arr2[i]);

  /*
  *   Insertionsort
  */
  insertionsort(arr3, sizeof(arr3));
  printf("\nInsertionsort:\n");
  for(int i = 0; i < sizeof(arr3)/sizeof(arr3[0]); i++) printf("%u, ", arr3[i]);
}
