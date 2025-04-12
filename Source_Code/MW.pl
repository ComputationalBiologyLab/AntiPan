use Bio::SeqIO;
use lib '/usr/share/perl5/Bio';
use Bio::Seq;
use Bio::Tools::SeqStats;
my $s1 = $ARGV[0];
my $s2 = $ARGV[1];
my $sequences = Bio::SeqIO->new( 
    -file   => "$s1",
    -format => "fasta",
);

while ( my $protein = $sequences->next_seq ){			
    my $seqobj = Bio::PrimarySeq->new(-seq=>($protein->seq));
    $seq_stats  =  Bio::Tools::SeqStats->new(-seq=>$seqobj);
    $weight = $seq_stats->get_mol_wt();
    $monomer_ref = $seq_stats->count_monomers();
		$id= $protein->display_id, "\n";
    		$seq= $protein->seq, "\n";
		$Seq1=">$id\n$seq\nMolecular Weight in the range:\t";

	my $filename = "$s2";
	open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
	print $fh "$Seq1", $$weight[0], " : " , $$weight[1], "\tDa", "\n";
	close $fh;
}
print "done\n";

