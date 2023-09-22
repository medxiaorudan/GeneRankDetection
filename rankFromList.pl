#!/usr/bin/perl
use strict;
use warnings;
#use Devel::Size qw(size total_size);
my %hash;
my $sampleNo;	#index of the last sample(number of samples - 1)
my $file = shift;
my $list = shift;
open I, "$file";
my $header = <I>;
while(<I>){
	chomp;
	my @tmp = split;
	my $gene = shift @tmp;
	#print $gene, "\n";
	$sampleNo = $#tmp;
	$hash{$gene} = \@tmp;
}
close I;
print $header;
open L, "$list";
while(<L>){
	chomp;
	my ($gene1, $gene2) = split;
	my $rankList = $gene1."_".$gene2;
	for(my $k=0;$k<=$sampleNo;$k++){
		if((exists  $hash{$gene1}[$k] && exists $hash{$gene2}[$k]) && $hash{$gene1}[$k] > $hash{$gene2}[$k]){
			$rankList.="\t1";
		}
		if((exists  $hash{$gene1}[$k] && exists $hash{$gene2}[$k]) && $hash{$gene1}[$k] <= $hash{$gene2}[$k]){
			$rankList.="\t0";
		}
	}
	print $rankList, "\n";
}
close L;
=cut
my @genes = sort {$a cmp $b} keys %hash;
#print join("\n", @genes), "\n";
for(my $i=0;$i<=$#genes;$i++){
	for(my $j=$i+1;$j<=$#genes;$j++){
		my $rankList = "$genes[$i]_$genes[$j]";
		for(my $k=0;$k<=$sampleNo;$k++){
			if($hash{$genes[$i]}[$k] > $hash{$genes[$j]}[$k]){
				$rankList.="\tg";
			}
			if($hash{$genes[$i]}[$k] < $hash{$genes[$j]}[$k]){
				$rankList.="\tl";
			}
			if(($hash{$genes[$i]}[$k] ==0) and ($hash{$genes[$j]}[$k] == 0)){
				$rankList.="\tu";
			}
			if(($hash{$genes[$i]}[$k] * $hash{$genes[$j]}[$k]) !=0 and ($hash{$genes[$i]}[$k] == $hash{$genes[$j]}[$k])){
				$rankList.="\te";
			}
		}
		print $rankList, "\n";
	}
}
#print total_size(%hash), "\n";
