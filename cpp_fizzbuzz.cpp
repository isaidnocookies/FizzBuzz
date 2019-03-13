#include <iostream>

using namespace std;

void fizzbuzz(int start, int finish);

int main() {
      fizzbuzz(-50,50);
      return 0;
}

void fizzbuzz(int start, int finish) {
      for (int i = start; i <= finish; i++) {
            if (i == 0) {
                  cout << i << endl;
            } else if (i % 3 == 0 && i % 5 == 0) {
                  cout << "FizzBuzz" << endl;
            } else if (i % 3 == 0) {
                  cout << "Fizz" << endl;
            } else if (i % 5 == 0) {
                  cout << "Buzz" << endl;
            } else {
                  cout << i << endl;
            }
      }
}
