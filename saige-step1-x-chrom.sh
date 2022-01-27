
################################################################################
## CREATE VARIABLES
################################################################################

# get unrelated samples for creating x-chromosome pruned variants
/nas/ADMI_t1/rklinner/rklinner/145k_imp_prep/03_RELATEDNESS/OUT.GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR/GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR.sample15k.fam

# create a bfile of unrelated x-chromosome samples from x-chromosome plink file
/nas/ADMI_t1/rklinner/rklinner/145k_imp_prep/02_MERGE_BGEN_GSA_OMNI/OUT.BGEN.PREANNOTATION.MERGE.BED/GHS145k.hg38.GSA.OMNI.chrX

# create list of pruned x-chromosme variants
~/app/plink2 \
--memory  65534 \
--threads 24 \
--bfile ../03_RELATEDNESS/OUT.GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR/GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR.sample15k # this should be a plink file of x-chromsome variants restricted to unrelated individuals  
--maf 0.01 \
--indep-pairwise 1000 80 0.1 \
--geno 0.05 \
--remove  IN.CHIP_QC/chip_qc.GSA.OMNI.exclude.FID.IID.txt \
--out OUT.IndepPairwise/GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR.sample15k

# create a plink file of pruned x-chromosome variants  
plink
--bfile ../02_MERGE_BGEN_GSA_OMNI/OUT.BGEN.PREANNOTATION.MERGE.BED.chr1_22/GHS145k.hg38.GSA.OMNI.chr1_22 # this should just be the x chromosome
--extract ../04_LDPRUNE/OUT.IndepPairwise/GHS145k.hg38.GSA.OMNI.chr1_22.RelPrune.EUR.sample15k.VAR.prune.in # this should be pruned x chromosome variants
--make-bed
--memory 65534
--out OUT.PLINK_VARIANCE_COMPONENT/GHS145k.hg38.GSA.OMNI.chr1_22.VAR
--threads 12

# merge pruned x-chromosome plink file with pruned autosome plink file

# rerun step 1 with pruned autosome+x-chromosome plink file

# rerun step 2 with autosome+x-chromosome plink file