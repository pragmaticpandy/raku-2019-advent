use v6;

my $progString = "input-2-1.txt".IO.slurp;

my @prog = map { :10($_) }, split(',', $progString);

@prog[1] = 12;
@prog[2] = 2;
executeProgAt(0, @prog);

say @prog;

sub executeProgAt(Int $pos, @prog) {
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
