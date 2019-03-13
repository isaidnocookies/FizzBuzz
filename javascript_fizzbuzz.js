function fizzbuzz(start, finish) {
      for (var i = start; i <= finish; i++) {
            if (i == 0) {
                  console.log(i);
            } else if (i % 3 === 0 && i % 5 === 0) {
                  console.log("FizzBuzz");
            } else if (i % 3 === 0) {
                  console.log("Fizz");
            } else if (i % 5 === 0) {
                  console.log("Buzz")
            } else {
                  console.log(i);
            }
      }
}

fizzbuzz(-50,50);
