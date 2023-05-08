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

#convert DELs to biallelic with G as ref allele and C as alternate allele
sed 's/\.\//m\//g' clean_DELs.vcf | sed 's/\/\./\/m/g' | sed 's/0\//n\//g' | sed 's/\/0/\/n/g' | sed -r 's/[0-9]+\//1\//g' | sed -r 's/\/[0-9]+/\/1/g' | sed 's/m\//\.\//g' | sed 's/\/m/\/\./g'  | sed 's/n\//0\//g' | sed 's/\/n/\/0/g' | sed 's/10\//1\//g' | sed 's/\/10/\/1/g' | sed 's/01\//1\//g' | sed 's/\/01/\/1/g' | sed 's/\.\t[^\t]*\t[^\t]*/.\tG\tC/' > Gref_Calt_DELs.vcf
#add 'DEL_' prefix to ID 
bcftools annotate --set-id +'DEL_%POS' Aref_Talt_DELs.vcf > biallelic_DELs.vcf
#filter using whatever parameters you want
vcftools --vcf biallelic_DELs.vcf --maf 0.01 --recode --out maf0.01_biallelic_DELs
mv maf0.01_biallelic_DELs.recode.vcf maf0.01_biallelic_DELs.vcf


#convert INs to biallelic with G as ref allele and C as alternate allele
sed 's/\.\//m\//g' clean_INs.vcf | sed 's/\/\./\/m/g' | sed 's/0\//n\//g' | sed 's/\/0/\/n/g' | sed -r 's/[0-9]+\//1\//g' |  sed -r 's/\/[0-9]+/\/1/g' | sed 's/m\//\.\//g' | sed 's/\/m/\/\./g' | sed 's/n\//0\//g' | sed 's/\/n/\/0/g' | sed 's/01\//1\//g' | sed 's/\/01/\/1/g' | sed -e 's/\/..$/\/1/' | sed 's/\t[^\t].\//\t1\//g' | sed 's/\.\t[^\t]*\t[^\t]*/.\tA\tT/' > Aref_Talt_INs.vcf
#add 'INS_' prefix to ID 
bcftools annotate --set-id +'INS_%POS' Aref_Talt_INs.vcf
#filter using whatever parameters you want
vcftools --vcf Aref_Talt_INs.vcf  --maf 0.01 --recode --out maf0.01_biallelic_INs
mv maf0.01_biallelic_INs.recode.vcf maf0.01_biallelic_INs.vcf

#At this point you can run the files separately through different software that takes SNPs
#You can maybe combine them into a single VCF but from memory they might need a bit of tweaking for that.
#Good luck!
