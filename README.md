# function-rocke-unannotated
This task included counting the number of proteins wiht no annotation (so KEGG, GO or PFAM) accross the various HS039 analyses, and plotting the %unannotated (of total proteins) according to various metadata categories. The dataframe used to plot these graphs is loaded as "HS039a.txt".  

Unannotated proteins were counted directly in terminal using awk: 
awk -F',' '($4 == "" || $5 == "" || $6 == "" || $7 == "") {count++} END {print count}' File.csv
Where $4, $5, and $6 represent columns indicating the KEGG, GO and PFAM annotations
