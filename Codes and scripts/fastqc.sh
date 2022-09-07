#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=fastqc      ### Job Name
#SBATCH --output=fastqc%j.out         ### File in which to store job output
#SBATCH --error=Hi_fastqc%j.err          ### File in which to store job error messages
#SBATCH --time=0-00:10:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

# ./fastqc.sh                         # run your actual program

file1_r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz"
file1_r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz"
file2_r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz"
file2_r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz"

outdir="/projects/bgmp/luizah/bioinfo/Bi622/QAA"

module load fastqc/0.11.5

/usr/bin/time -v fastqc \
    $file1_r1 $file1_r2 $file2_r1 $file2_r2 \
    --format fastq \
    --outdir $outdir 
echo "DONE"