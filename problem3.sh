#!/bin/bash
wget --no-check-certificate https://www.gutenberg.org/files/132/132.txt
#check for top and bottom 15 words sorted on frequency
cat 132.txt | sed 's/[^a-zA-Z ]//g' > artwar2.txt
printf "\nTop 15 Most Used Words\n\n" > datatable.txt
awk -f wordfreq.awk artwar2.txt | sort -k 2nr | head -15 >> datatable.txt
printf "\n15 Least Used Words\n\n" >> datatable.txt
awk -f wordfreq.awk artwar2.txt | sort -k 2nr | tail -15 >> datatable.txt
cat datatable.txt
