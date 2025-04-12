import csv
import os
import sys

def main():
    if len(sys.argv) < 2:
        print("Error: Please provide input file path")
        print("Usage: python epitope_analysis.py <input_file.csv>")
        sys.exit(1)
    
    file_path = sys.argv[1]  
    print(f"Processing file: {file_path}")
    
    raw_file_path = os.path.join(file_path, 'raw_output.csv')
    summary_file_path = os.path.join(file_path, 'summary_output_linear.csv')
    summary_file_linear_path = os.path.join(file_path, 'summary_output_top50_linear.csv')	

    Threshold = 0.1512  # Minimum score to consider a residue part of an epitope
    Min_Length = 6       # Minimum length of peptide to be included

    # Initialization
    summary_data = []
    start_pos = None
    peptide = ""
    peptide_length = 0
    total_score = 0.0
    pos = 0  

    # Read input CSV and process peptides
    with open(raw_file_path, 'r') as infile:
        reader = csv.DictReader(infile)
        
        for row in reader:
            pos += 1
            score = float(row['BepiPred-3.0 linear epitope score'])
            residue = row['Residue']
            protein_name = row['Accession']

            if score >= Threshold:
                # Building a peptide if bebipred score is => the threshold
                if start_pos is None:
                    start_pos = pos
                peptide += residue
                peptide_length += 1
                total_score += score
            else:
                # Stop appending and save correct peptides when a score in a residue is is < threshold
                if peptide_length >= Min_Length:
                    avg_score = total_score / peptide_length
                    summary_data.append([start_pos, pos - 1, peptide, peptide_length, avg_score, protein_name])
                
                # Reset peptide information
                start_pos = None
                peptide = ""
                peptide_length = 0
                total_score = 0.0

        # This is to account for the last peptide passing threshold, but else is not activated for it
        if peptide_length >= Min_Length:
            avg_score = total_score / peptide_length
            summary_data.append([start_pos, pos, peptide, peptide_length, avg_score, protein_name])

    # Write full summary output
    with open(summary_file_path, 'w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerow(['Start', 'End', 'Peptide', 'Length', 'Average Score', 'Protein'])
        writer.writerows(summary_data)
    
    print(f"Full summary output saved as {summary_file_path}")

    # Sort peptides by average score where highest scores come first (descending)
    summary_data.sort(key=lambda x: x[4], reverse=True)

    # Calculate the cutoff score for the top 50%
    top_50_index = len(summary_data) // 2
    cutoff_score = summary_data[top_50_index - 1][4] if top_50_index > 0 else float('-inf')

    # Filter top 50% peptides
    top_50_peptides = [entry for entry in summary_data if entry[4] >= cutoff_score]

    # Write top 50% summary output
    with open(summary_file_linear_path, 'w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerow(['Start', 'End', 'Peptide', 'Length', 'Average Score', 'Protein'])
        writer.writerows(top_50_peptides)

    print(f"Top 50% summary output saved as {summary_file_linear_path}")

if __name__ == "__main__":
    main()
