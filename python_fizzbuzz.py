def fizzbuzz(start, finish):
    fizzyBuzzy = list(range(start, finish + 1))
    output = list(map(fizzBuzzFunction, fizzyBuzzy))

    for outputValue in output:
        print (outputValue)

def fizzBuzzFunction(value):
    if (value == 0):
        return (str(value))
    elif (value % 3 == 0):
        return("Fizz")
    elif (value % 5 == 0):
        return ("Buzz")
    elif (value % 3 == 0 and value % 5 == 0):
        return("FizzBuzz")
    else:
        return (str(value))

fizzbuzz(-50,50);
