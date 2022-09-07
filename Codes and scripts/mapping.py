#!/usr/bin/env python

#sam_file="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/27_4C_mbnl_S19_L008_star_alignment_filesAligned.out.sam"
sam_file="/projects/bgmp/luizah/bioinfo/Bi622/QAA/Part3/28_4D_mbnl_S20_L008_star_alignment_filesAligned.out.sam"

flag = 0
mapped_seq = 0
unmapped_seq = 0
with open(sam_file, "r") as fh:
    for line in fh:
        if not line.startswith("@"):
            header = line.split("\t")
            flag = int(header[1])
            if ((flag & 256) != 256):  ##removing reads that have more than one alignment
                if((flag & 4) != 4):
                    mapped = True
                    mapped_seq +=1
                else: 
                    unmapped_seq +=1

print("Mapped sequences:", mapped_seq)
print("Unmapped sequences:", unmapped_seq)
