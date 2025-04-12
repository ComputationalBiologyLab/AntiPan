# AntiPan-The-in-silico-vaccine-identification-Pipeline
The AntiPan (beta-version-1) is an in-silico subunit vaccine discovery workflow which augments a variety of bioinformatics and immuno-informatics tools and databases to identify protein antigens for bacterial pathogens vaccine design purpose.

This is the AntiPan's command-line interface (AntiPan-CLI beta-version-1) which provides the user with five utilities including:

          1- Genome Annotation Module
          2- Pangenome Estimation Module
          3- Reverse Vaccinology Filteration Module
          4- Protein Assessment Module
          5- Immuno-informatics Module

1- The Genome Annotation Module: It allows the annotation of protein-coding genes and other genomic features including RNAs. 

2- Pangenome Estimation Module:  It constructs the pan, core, accessory, and unique genomes and genes for the provided bacterial strains. It also provide a summary statistic of the identified core, cloud, shell, and total genes identified in the analyzed bacterial genomes. In addition, the module provides a presence-absence heatmap and phylogentic tree to visualize the pangenome analysis results.

3- Reverse Vaccinology Filteration Module: It is a multi-step filteration process that identifies candidate antigenic proteins that are exposed to the immune system and have the potential of eliciting a protective immune response. 

4- Protein Assessment Module: It provides several major characterisitics of the candidate antigens such as biological function, essentiality, and toxicity. 

5- Immuno-informatics Module: It entails a comprehensive set of tools that allow the mapping of both T-cell and B-cell epitopes of the analyzed candiated antigens.

This command-line interface provides the utility to run each module separately or run the whole AntiPan workflow to get the final list of potetnial antigen candidates (PACs) at a click.

### Configuration ###

Please, refer to the INSTALLATION file to check the pre-requisites and follow the configuration instructions; and install all the required packages from the "requirements.txt".

### Usage ###

Antipan commandline interface can be initiated by opening the shell terminal in the AntiPan/Source_Code directory and running --> bash AntiPan_main
You will get a list of options to select from:

          Hello, this is AntiPan - beta version

     _      _   _    _    _  ____     _      _   _           
    / \    | \ | | _/ |_ | ||  _ \   / \    | \ | |
   / _ \   |  \| ||_   _|| || |_) | / _ \   |  \| |
  / ___ \  | |\  |  | |  | ||  __/ / ___ \  | |\  |
 / /   \ \ | | \ |  | |  | || |   / /   \ \ | | \ |
/_/     \_\|_|  \|  |_|  |_||_|  /_/     \_\|_|  \|

          1) The Entire AntiPan Workflow
          2) Genome Annotation Module
          3) Pangenome Estimation Module
          4) Reverse Vaccinology Filteration Module
          5) Protein Assessment Module
          6) Immuno-informatics Module
          7) Quit 

Choose the the type of analysis that suits your work or run the entire AntiPan workflow by writing the "nubmer" and pressing enter. AntiPan CLI takes inputs as either directory path (e.g., /home/usr/AntiPan/test_data/Genomes_Fasta_Sample) or file path (e.g., /home/usr/AntiPan/test_data/Protein_Assessment_Sample/Protein_Assessment.fasta) For the entire AntiPan workflow/ the Reverse Vaccinology Module alone to run it will ask about the type of bacteria (either grame +ve/-ve), you can answer this by writing P or N and pressing enter. 

The AntiPan-CLI will ask about the "conda.sh" file path to activate the AntiPan conda environment. The file is typically located at: ~/anaconda3/etc/profile.d/conda.sh

The output will vary depending on the module. Nevertheless, the final AntiPan workflow output is a FASTA file containing the identified potetnial antigen candidates as follows:

>AA100_esxA-10
MAMIKMSPEEIRAKSQSYGQGSDQIRQILSDLTRAQGEIAAN

### Inputs ###

The required arguments are:

p for gram-positive bacterial pathogens
n for gram-negative bacterial pathogens

### Outputs ###

Running the entire AntiPan workflow will generate a main folder called "Antipan_Results" which includes 6 subfolders:
          
          1. Annotation_Results
          2. GFF_Files
          3. Pangenome_Results
          4. RV_Results
          5. Proteins_Assessment_Results
          6. Immuno-informatics_Results
          
1. Annotation_Results folder includes the annotation files for each genome fasta file in a separate folder.
2. GFF_Files includes the annotated genomes in .gff format.
3. Pangenome_Results folder contains the Coregene_Proteins_95.fasta, summary_statistics.txt, gene_presence_absence.csv, the pangenome_pie chart, and the rest of accessory, unique, and pangenome files.
4. RV_Results folder contains 8 subfolders, each one contains the filtered protein fasta files along with the intermediate analysis files, for the complete analysis:
         
          1. Psortb_Results
          2. VF_Results
          3. HS_Homology_Results
          4. GF_Homology_Results
          5. TM_Helices_Results
          6. MW_Results
          7. Antigenicity_Results
          8. Allergenicity_Results
5. Proteins_Assessment_Results folder contains 3 subfolders:
          
          1. Essentiality_Results
          2. Functional_Annotation
          3. Toxicity_Results
6. Immuno-informatics_Results folder contains two main folders, Results-toxins and Results-non-toxins, inside which there will be the final Potetnial_Antigen_Candidates.fasta, T-Cell, and B-Cell epitopes files in tsv format; and 6 subfolders:
          
          1. Ann_Results
          2. Immunogenicity_Results
          3. NetCTLPan_Results
          4. NetMHCpan-el_Results
          5. MHC-II_Results
                    1. NetMHCIIpan-EL_Results
          6. B-Cell_Epitopes_Results
          
### Examples ###

To run the AntiPan modules (e.g., the Reverse Vaccinology Filteration Module):
          
          1. Open the terminal inside the Source_Code directory and run "bash AntiPan_main"
          2. write "4" and press Enter key
          3. Specify the absolute path to the conda.sh file <~/anaconda3/etc/profile.d/conda.sh> and press Enter key
          4. Specify the absolute path to the proteins.fasta file e.g., </home/user/Coregene_proteins_95.fasta> and press Enter key
          5. Specify the absolute path to the directoy where you want to save the AntiPan results e.g., </home/user/AntiPan> and press Enter key

It might require administrative access, so provide the machine's admin password and press enter. To avoid administrative access requirement while running the workflow you can run the script under super user mode by: 

          1. Typing in the terminal: sudo su
          2. Entering the machine's admin password and pressing Enter
          3. Running the AntiPan workflow as usual by typing: "bash AntiPan_main"
The Reverse Vaccinology Filteration results would be saved in your specified directory inside "Antipan_Results/RV_Results".               

### Cite ###
If you found AntiPan-0.1-b useful in your research, please cite,
