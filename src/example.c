/*
 * This is an example on how to use the bubblesort function
 */

#include <stdio.h>

extern int bubblesort(int* arr, int size);
extern int insertionsort(int* arr, int size);
extern int quicksort(int* arr, int size);
extern int radixsort(int* arr, int size);
extern int mergesort(int* arr, int size);

int main(int argc, char *argv[]) {
  // Create array with some integers
  int arr0[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  int arr2[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  int arr3[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  int arr4[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  int arr5[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  int arr6[] = {11,8,10,12,14,2,3,6,7,5,2,1};
  
  /*
  *   Original
  */
  printf("\noriginal array:\n");
  for(int i = 0; i < sizeof(arr0)/sizeof(arr0[0]); i++) printf("%u, ", arr0[i]);

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

  /*
  *   Quicksort
  */
  quicksort(arr4, sizeof(arr4));
  printf("\nQuicksort:\n");
  for(int i = 0; i < sizeof(arr4)/sizeof(arr4[0]); i++) printf("%u, ", arr4[i]);

  /*
  *   Radixsort
  */
  int r = radixsort(arr5, sizeof(arr5));
  printf("\nRadixsort: [not implemented]%d\n", r);
  for(int i = 0; i < sizeof(arr5)/sizeof(arr5[0]); i++) printf("%u, ", arr5[i]);

  /*
  *   Mergesort
  */
  int r2 = mergesort(arr6, sizeof(arr6));
  printf("\nMergesort: [under development]%d\n", r2);
  for(int i = 0; i < sizeof(arr6)/sizeof(arr6[0]); i++) printf("%u, ", arr6[i]);
}
