use v6;

my $sum = 0;

for 'input-1-1.txt'.IO.lines -> $line {
    $sum += (:10($line) div 3) - 2;
}

say $sum
