#!/usr/bin/env perl

my $check =  {
    vimrc => 'vim/vimrc',
    bash_profile => 'bash/bash_profile',
    bash_alias => 'bash/bash_alias',
    gitconfig => 'git/gitconfig'
};

for my $f ( sort keys %$check ) { 
    my $raw = qx{ diff ~/.$f  $check->{$f} };
    $raw or next;
    print "-----$f --> $check->{$f}-----\n$raw\n\n";
    print "UPDATE? y/n*";
    my $ack = <STDIN>;
    $ack =~ m/y/i or next;
    print qx { cp $check->{$f} ~/.$f }
}

