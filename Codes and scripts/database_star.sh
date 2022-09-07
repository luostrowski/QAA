#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=Database      ### Job Name
#SBATCH --output=results_star_%j.out         ### File in which to store job output
#SBATCH --error=Star_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

# ./database_star.sh                         # run your actual program

dir="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.10a"
gtf_dir="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/Mus_musculus.GRCm39.107.gtf"
dna_dir="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/Mus_musculus.GRCm39.dna.primary_assembly.fa"

##building the database
conda activate QAA
/usr/bin/time -v STAR --runMode genomeGenerate --runThreadN 8 \
    --genomeDir $dir \
    --genomeFastaFiles $dna_dir \
    --sjdbGTFfile $gtf_dir
