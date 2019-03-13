let fizzbuzz:(Int) -> String = { i in
    switch (i % 3 == 0, i % 5 == 0, i == 0) {
        case (true, false, false):
            return "Fizz"
        case (false, true, false):
            return "Buzz"
        case (true, true, false):
            return "FizzBuzz"
        default:
            return "\(i)"
        }
}

let main:() -> Void = {
    let start = -50;
    let finish = 50;
    
    for i in start...finish {
        print (fizzbuzz(i));
    }
}

main();
