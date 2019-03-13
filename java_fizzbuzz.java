public class java_fizzbuzz {
    public static void main(String args[]) {
          int start = -50;
          int finish = 50;
        fizzbuzz(start, finish);
    }

    public static void fizzbuzz(int start, int finish) {
          if (start == 0) {
                System.out.println(start);
          } else if(start % 3 == 0 && start % 5 == 0) {
                System.out.println("FizzBuzz");
          } else if(start % 5 == 0) {
                System.out.println("Buzz");
          } else if (start % 3 == 0) {
                System.out.println("Fizz");
          } else {
                System.out.println(start);
          }

          if (start < finish) {
                fizzbuzz(start+1, finish);
          }
    }
}
