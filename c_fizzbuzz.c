#include <stdio.h>

void fizzbuzz(int start, int finish);

int main() {
      fizzbuzz(-50,50);
      return 0;
}

void fizzbuzz(int start, int finish) {
      for (int i = start; i <= finish; i++) {
            if (i == 0) {
                  printf("%d\n", i);
            } else if (i % 3 == 0) {
                  printf("%s\n","Fizz");
            } else if (i % 5 == 0) {
                  printf("%s\n","Buzz");
            } else if (i % 3 == 0 && i % 5 == 0) {
                  printf("%s\n","FizzBuzz");
            } else {
                  printf("%d\n",i);
            }
      }
}
