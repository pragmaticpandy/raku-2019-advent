use v6;

sub calcFuel(Int $mass) returns Int {
    return ($mass div 3) - 2;
}

my Int $fuel = 0;

for 'input-1-1.txt'.IO.lines -> $line {
    $fuel += calcFuel :10($line);
}

my Int $fuelForFuel = calcFuel $fuel;

while $fuelForFuel > 0 {
    $fuel += $fuelForFuel;
    $fuelForFuel = calcFuel $fuelForFuel;
}

say $fuel;
