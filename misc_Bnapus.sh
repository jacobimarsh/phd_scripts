
for i in {1..19}; do head -n 12 Chr${i}_LepR1.Darmorv9.vcf | awk '{print $1,$2}' | tail -n 1; tail -n 1 Chr${i}_LepR1.Darmorv9.vcf | awk '{print $1,$2}'; done

vcftools --thin 100 --vcf Chr1.region.vcf --out thin100bp_Chr1__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr2.region.vcf --out thin100bp_Chr2__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr3.region.vcf --out thin100bp_Chr3__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr4.region.vcf --out thin100bp_Chr4__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr5.region.vcf --out thin100bp_Chr5__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr7.region.vcf --out thin100bp_Chr7__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr8.region.vcf --out thin100bp_Chr8__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr9.region.vcf --out thin100bp_Chr9__LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr10.region.vcf --out thin100bp_Chr10_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr11.region.vcf --out thin100bp_Chr11_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr12.region.vcf --out thin100bp_Chr12_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr13.region.vcf --out thin100bp_Chr13_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr14.region.vcf --out thin100bp_Chr14_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr15.region.vcf --out thin100bp_Chr15_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr16.region.vcf --out thin100bp_Chr16_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr17.region.vcf --out thin100bp_Chr17_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr18.region.vcf --out thin100bp_Chr18_LepR1.Darmorv9 --recode
vcftools --thin 100 --vcf Chr19.region.vcf --out thin100bp_Chr19_LepR1.Darmorv9 --recode
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr1_LepR1.Darmorv9.recode.vcf -OutPut Chr1 -Region 1:2861:36333985 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr2_LepR1.Darmorv9.recode.vcf -OutPut Chr2 -Region 2:295:33945973 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr3_LepR1.Darmorv9.recode.vcf -OutPut Chr3 -Region 3:2653:33598983 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr4_LepR1.Darmorv9.recode.vcf -OutPut Chr4 -Region 4:2820:24842908 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr5_LepR1.Darmorv9.recode.vcf -OutPut Chr5 -Region 5:271:29921815 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr7_LepR1.Darmorv9.recode.vcf -OutPut Chr7 -Region 7:2222:34503196 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr8_LepR1.Darmorv9.recode.vcf -OutPut Chr8 -Region 8:36559:25663697 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr9_LepR1.Darmorv9.recode.vcf -OutPut Chr9 -Region 9:20056:49484206 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr10_LepR1.Darmorv9.recode.vcf -OutPut Chr10 -Region 10:513:27481238 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr11_LepR1.Darmorv9.recode.vcf -OutPut Chr11 -Region 11:582:55060640 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr12_LepR1.Darmorv9.recode.vcf -OutPut Chr12 -Region 12:11433:105679320 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr13_LepR1.Darmorv9.recode.vcf -OutPut Chr13 -Region 13:139:78038929 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr14_LepR1.Darmorv9.recode.vcf -OutPut Chr14 -Region 14:5725:74629118 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr15_LepR1.Darmorv9.recode.vcf -OutPut Chr15 -Region 15:54792:57504492 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr16_LepR1.Darmorv9.recode.vcf -OutPut Chr16 -Region 16:17474:50311421 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr17_LepR1.Darmorv9.recode.vcf -OutPut Chr17 -Region 17:77723:66390744 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr18_LepR1.Darmorv9.recode.vcf -OutPut Chr18 -Region 18:7291:54293458 -SeleVar 2
LDBlockShow/LDBlockShow -InVCF thin100bp_Chr19_LepR1.Darmorv9.recode.vcf -OutPut Chr19 -Region 19:23857:64058590 -SeleVar 2


library(data.table)
library(tidyverse)
alldat <- fread("bash_misc/aldrin/decayplotbox/allChr.temp")

alldat %>% ggplot(aes(x=V2, y=V3, col = V1)) + geom_line()

all_plotted <- alldat %>% ggplot(aes(x=V2, y=V3, col = V1)) + geom_line()


