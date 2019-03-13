<?php

$start = -50;
$finish = 50;

for ($i = $start; $i <= $finish; $i++)
{
      if ($i == 0)
            echo "$i\n";
      else if ($i % 3 == 0 && $i % 5 == 0)
            echo "FizzBuzz\n";
      else if ($i % 3 == 0)
            echo "Fizz\n";
      else if ($i % 5 == 0)
            echo "Buzz\n";
      else
            echo "$i\n";
}
?>
