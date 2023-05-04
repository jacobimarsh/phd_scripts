
#extract indels only from VCF
vcftools --vcf in.vcf --keep-only-indels --recode

#clean FORMAT to only keep genotype information for each allele
bcftools annotate -x 'fmt' out.recode.vcf > clean_indels.vcf

#split multiallelic sites into multi-line biallelic sites, then split insertions and deletions into separate files
bcftools norm -m - clean_indels.vcf | bcftools filter --include 'strlen(REF)<strlen(ALT)' >> split_clean_INs.vcf
bcftools norm -m - clean_indels.vcf | bcftools filter --include 'strlen(REF)>strlen(ALT)' >> split_clean_DELs.vcf

#combine 
bcftools norm -m + split_clean_INs.vcf > clean_INs.vcf
bcftools norm -m + split_clean_DELs.vcf > clean_DELs.vcf

#rename alleles to combine as biallelic
sed 's/\.\//m\//g' clean_DELs.vcf | sed 's/\/\./\/m/g' > mm_clean_DELs.vcf
sed 's/0\//n\//g' mm_clean_DELs.vcf | sed 's/\/0/\/n/g' >> nn_mm_clean_DELs.vcf
sed -r 's/[0-9]+\//1\//g' nn_mm_clean_DELs.vcf | sed -r 's/\/[0-9]+/\/1/g' > 11_nn_mm_clean_DELs.vcf
