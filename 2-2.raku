use v6;

my $progString = "input-2-1.txt".IO.slurp;

my @originalProg = map { :10($_) }, split(',', $progString);

say getAnswer(@originalProg);

sub getAnswer(@originalProg) returns Int {
    my @range = 0..99;
    for @range -> $noun {
        for @range -> $verb {
            
            my @prog = @originalProg.clone;
            @prog[1] = $noun;
            @prog[2] = $verb;
            executeProgAt(0, @prog);

            if @prog[0] == 19690720 {
                return (100 * $noun) + $verb;
            }
        }
    }
}

sub executeProgAt(Int $pos, @prog) {
    if $pos >= @prog.elems {
        die "Never reached the exit code.";
    }

    given @prog[$pos] {
        when 1 {
            @prog[@prog[$pos + 3]] = @prog[@prog[$pos + 1]] + @prog[@prog[$pos + 2]];
            executeProgAt($pos + 4, @prog);
        }

        when 2 {
            @prog[@prog[$pos + 3]] = @prog[@prog[$pos + 1]] * @prog[@prog[$pos + 2]];
            executeProgAt($pos + 4, @prog);
        }

        when 99 {}

        default { die "Unknown op code: " + @prog[$pos]; }
    }
}
