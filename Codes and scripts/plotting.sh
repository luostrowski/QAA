#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=read2_      ### Job Name
#SBATCH --output=plots_%j.out         ### File in which to store job output
#SBATCH --error=Hi_plots%j.err          ### File in which to store job error messages
#SBATCH --time=0-10:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

 #read1="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz"
# read2="/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz"
 #read1="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R1_001.fastq.gz"
 read2="/projects/bgmp/shared/2017_sequencing/demultiplexed/28_4D_mbnl_S20_L008_R2_001.fastq.gz"

conda activate bgmp_py310

# /usr/bin/time -v ./phred.py -f $read1 -n 7226430 -l 101 -o Plots/27_4C_mbnl_S19_L008_R1_001.png
# echo "DONE"

# /usr/bin/time -v ./phred.py -f $read2 -n 7226430 -l 101 -o Plots/27_4C_mbnl_S19_L008_R2_001.png
# echo "DONE"

# /usr/bin/time -v ./phred.py -f $read1 -n 12428766 -l 101 -o Plots/28_4D_mbnl_S20_L008_R1_001.png
# echo "DONE"

/usr/bin/time -v ./phred.py -f $read2 -n 12428766 -l 101 -o Plots/28_4D_mbnl_S20_L008_R2_001.png
echo "DONE"