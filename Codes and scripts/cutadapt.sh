#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=cutadapt      ### Job Name
#SBATCH --output=cutadapt%j.out         ### File in which to store job output
#SBATCH --error=Hi_cutadapt%j.err          ### File in which to store job error messages
#SBATCH --time=0-1:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

#cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq

adapt1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
adapt2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"
# output_file1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/27_4C_mbnl_S19_L008_R1_001_trimmed.fastq.gz"
# output_file2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/27_4C_mbnl_S19_L008_R2_001_trimmed.fastq.gz"
output_file1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/28_4D_mbnl_S20_L008_R1_001_trimmed.fastq.gz"
output_file2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/28_4D_mbnl_S20_L008_R2_001_trimmed.fastq.gz"
# input_file1="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz"
# input_file2="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz"
input_file1="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz"
input_file2="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz"

conda activate QAA

/usr/bin/time -v cutadapt -a $adapt1 -A $adapt2 -o $output_file1 -p $output_file2 $input_file1 $input_file2

