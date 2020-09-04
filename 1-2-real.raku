use v6;

sub calcFuel(Int $mass) returns Int {
    return ($mass div 3) - 2;
}

my Int $fuel = 0;

for 'input-1-1.txt'.IO.lines -> $line {

    my Int $moduleFuel = calcFuel :10($line);
    my Int $fuelForModuleFuel = calcFuel $moduleFuel;
    while $fuelForModuleFuel > 0 {
        $moduleFuel += $fuelForModuleFuel;
        $fuelForModuleFuel = calcFuel $fuelForModuleFuel;
    }

    $fuel += $moduleFuel;
}

say $fuel;
