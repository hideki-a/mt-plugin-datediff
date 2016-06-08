package DateDiff::Tags;
use strict;
use Time::Local;

sub _hdlr_date_diff {
    my ($ctx, $args, $cond) = @_;
    my $vars = $ctx->{ __stash }{ vars };
    my $var_name = $args->{ name };
    my ($sec, $min, $hour, $day, $month, $year, $wday, $yday, $isdst) = localtime(time);

    if ($var_name) {
        if ($vars->{ $var_name }) {
            (my $target_year  = $vars->{ $var_name }) =~ s/(\d{4})\d{2}\d{2}/$1/;
            (my $target_month = $vars->{ $var_name }) =~ s/\d{4}(\d{2})\d{2}/$1/;
            (my $target_day   = $vars->{ $var_name }) =~ s/\d{4}\d{2}(\d{2})/$1/;

            $target_year -= 1900;
            $target_month -= 1;

            my $base = timelocal( 0, 0, 0, $day, $month, $year );
            my $target = timelocal( 0, 0, 0, $target_day, $target_month, $target_year );
            my $duration = $base - $target;

            if ($args->{ interval } > 0) {
                $duration = $duration * -1;

                if ($duration >= 0 && $duration < 86400 * $args->{ interval }) {
                    return 1;
                } else {
                    return 0;
                }
            } else {
                if ($duration >= 0 && $duration < 86400 * $args->{ interval } * -1) {
                    return 1;
                } else {
                    return 0;
                }
            }
        }
    }
}

1;
