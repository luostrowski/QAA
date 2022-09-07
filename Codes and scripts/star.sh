#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=RunStar      ### Job Name
#SBATCH --output=results_star_%j.out         ### File in which to store job output
#SBATCH --error=Star_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

# ./star.sh                         # run your actual program

# file1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R1_001_surviving.fastq.gz"
# file2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R2_001_surviving.fastq.gz"
file1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R1_001_surviving.fastq.gz"
file2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R2_001_surviving.fastq.gz"
genomedir="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a"

conda activate QAA
##align reads
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $file1 $file2 \
--genomeDir $genomedir \
--outFileNamePrefix "28_4D_mbnl_S20_L008_star_alignment_files"