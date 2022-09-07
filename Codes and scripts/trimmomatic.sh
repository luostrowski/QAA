#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=trimm2      ### Job Name
#SBATCH --output=trimm2%j.out         ### File in which to store job output
#SBATCH --error=Hi_trimm2%j.err          ### File in which to store job error messages
#SBATCH --time=0-1:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission


# input_R1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/27_4C_mbnl_S19_L008_R1_001_trimmed.fastq.gz"
# input_R2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/27_4C_mbnl_S19_L008_R2_001_trimmed.fastq.gz"
# output_1P="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R1_001_surviving.fastq.gz"
# output_1U="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R1_001_orphaned.fastq.gz"
# output_2P="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R2_001_surviving.fastq.gz"
# output_2U="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R2_001_orphaned.fastq.gz"


input_R1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/28_4D_mbnl_S20_L008_R1_001_trimmed.fastq.gz"
input_R2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/cutadapt/28_4D_mbnl_S20_L008_R2_001_trimmed.fastq.gz"
output_1P="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R1_001_surviving.fastq.gz"
output_1U="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R1_001_orphaned.fastq.gz"
output_2P="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R2_001_surviving.fastq.gz"
output_2U="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R2_001_orphaned.fastq.gz"

conda activate QAA

module load easybuild
module load eb-hide/1

/usr/bin/time -v trimmomatic PE $input_R1 $input_R2 $output_1P $output_1U $output_2P $output_2U ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35