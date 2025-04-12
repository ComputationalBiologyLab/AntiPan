# you should run the file in the envioronment where you've installed perl commands #
use Bio::SeqIO;
use lib '/usr/share/perl5/Bio';
use Bio::Seq;
my $s1 = $ARGV[0];
my $s2 = $ARGV[1];
#my $s3 = $ARGV[2];
my $sequences = Bio::SeqIO->new( 
    -file   => "$s1",
    -format => "fasta",
);

#print "\$s1 = $s1 \n\$s2 = $s2\n";
#$panfile="$s2";
#print "OutputFile: $panfile\n";
while ( my $dna = $sequences->next_seq ){
    my $protein = $dna->translate( 
        -codontable_id => 1, # standard genetic code
        -frame         => 0, #reading-frame offset 0 
    );
#print "Protein seq : $protein\n"
		$id= $dna->display_id, "\n";
    		$seq= $protein->seq, "\n";
    		$modified_seq = chop($seq); #this line to remove the last character of the string sequence "*"
		$Seq1=">$id\n$seq\n";
		#print "$Seq1";

	my $filename = "$s2";
	open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
	print $fh "$Seq1";
	close $fh;
}
print "done\n";
###################### ................. Bio::Seq module ...................#####################
#my $seq = "ATGTCGGAAAAAGAAATTTGGGAAAAAGTGCTTGAAATTGCTCAAGAAAAATTATCAGCTGTAAGTTACTCAACTTTCCTAAAAGATACTG";
#my $dna = Bio::Seq->new(-seq => $seq); # make a seq object called "dna" and assign the variable "seq"'s content as its value
#my $protein = $dna->translate(        -codontable_id => 1, -frame  => 0); #translate the dna_seq_object into a protein_seq and store it in the varibale "protein" which is a seq_object now
## if you try to print the variable "protein" directly you will get the seq_object itself --> Bio::Seq=HASH(0x555ab227bbb0)
#my $seq1 = $protein->seq; # assign the value of the translated sequence of the protein_seq_object to the variable "seq1"
#print "Protein seq : $seq1\n"
# Run this file using the command: perl <file_name.pl> <input_file name "$AVRG[0]"> <output_file name "$AVRG[1]"> in the enviroment where you've installed perl or you might get the following error:
# Can't locate Bio/Seq.pm file
# Stop codon: "*" --> {"TAA", "TGA", "TAG"}  


