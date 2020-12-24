#!/usr/bin/env perl
=begin comment
Copyright (c) 2020, Rachel Michaela Bradley
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=end comment
=cut

use warnings;
use strict;
use Getopt::Std;

package Autoexec;

my %options;
Getopt::Std::getopts('f', \%options);

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
	printf "Usage: autoexec \"command\"\n";
	printf "Example: autoexec \"pkg upgrade -y\"\n";
	printf "See autoexec(8) for more details.\n";
	exit;
}

our $COMMAND = $ARGV[0];
our $EXECSTR = "iocage exec";

if ($options{f}) {
	$EXECSTR .= " -f"
}

my @jails;
my $i = 0;

open my $fh, q{-|}, 'iocage list -hq' or die "Could not read iocage output.\n";
while (my $line = <$fh>) {
	$line =~ m/^(\S+)/xms;
	$jails[$i] = $1;
	$i++;
}
close $fh or die "Could not close ${fh}.\n";

foreach my $jail (@jails) {
	printf "Executing \"${COMMAND}\" in \"${jail}\"\n";
	printf "DEBUGGING: ${EXECSTR} ${jail} ${COMMAND}";
	system "${EXECSTR} ${jail} ${COMMAND}";
}