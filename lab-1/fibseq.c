#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  time_t start_tm, finish_tm;
  
  scanf("%d",&number);
 
  start_tm = clock();
  result = fibonacci(number);
  finish_tm = clock();

  printf("The fibonacci sequence at %d is: %d\n", number, result);
  
  float elapsed_tm = (float)(finish_tm - start_tm)/ CLOCKS_PER_SEC;

  printf("Time: %f seconds\n", elapsed_tm);

  return(0);
}

