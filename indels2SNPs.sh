
#extract indels only from VCF
vcftools --vcf in.vcf --keep-only-indels --recode

#clean FORMAT to only keep genotype information for each allele
bcftools annotate -x 'fmt' out.recode.vcf > clean_indels.vcf

