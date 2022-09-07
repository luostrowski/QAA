#!/usr/bin/env python
import matplotlib.pyplot as plt
import gzip

# file_R1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R1_001_surviving.fastq.gz"
# file_R2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/27_4C_mbnl_S19_L008_R2_001_surviving.fastq.gz"
file_R1="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R1_001_surviving.fastq.gz"
file_R2="/projects/bgmp/luizah/bioinfo/Bi622/QAA/trimmomatic/28_4D_mbnl_S20_L008_R2_001_surviving.fastq.gz"

i=0
length_R1=[]
length_R2=[]

with gzip.open(file_R1,"rt") as fh:
    for line in fh:
        i+=1
        if i%4 == 2:
            line = line.strip()
            length_R1.append(len(line))


with gzip.open(file_R2,"rt") as fq:
    for line in fq:
        i+=1
        if i%4 == 2:
            line = line.strip()
            length_R2.append(len(line))

new_file=open("Read_lengths_28_4D_mbnl_S20_L008_reads.tsv", "w")
for length in length_R1:
    print(f'{length}\tR1', file=new_file)
for length in length_R2:
    print(f'{length}\tR2', file=new_file)
new_file.close()

# ##plotting graph
# plt.hist(length_R2, color="blue", label="R1", alpha=0.3)
# plt.hist(length_R1, color="pink", label="R2", alpha=0.3)
# # plt.xlim(0, 46000)
# # plt.ylim(0, 75)
# plt.xlabel('Read length')
# #plt.ylabel('Number of contigs in this category')
# plt.title('Distribution of trimmed read length for 27_4C_mbnl_S19_L008 sample')
# plt.savefig("27_4C_mbnl_S19_L008_graph.png")
