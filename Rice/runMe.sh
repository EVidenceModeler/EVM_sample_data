#!/bin/bash

set -ex

for file in *.gz; do
   if [ ! -s ${file%%.gz} ]; then
       echo "gunzipping $file > ${file%%.gz}" 
       gunzip -c $file > ${file%%.gz}
   fi
done


../../EVidenceModeler --genome genome.fasta \
   --weights weights.txt \
   --gene_predictions gene_predictions.gff3 \
   --segmentSize 30000 \
   --overlapSize 10000 \
   --protein_alignments protein_alignments.gff3 \
   --transcript_alignments transcript_alignments.gff3 \
   --sample_id rice_evm \
   --CPU 4

