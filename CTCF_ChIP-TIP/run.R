library(MotifPeeker)

# Load the data
alignments <- c("./CTCF_ChIP-TIP/input/1A_CTCF_TIPSeq_alignment_firstmate.bam",
                "./CTCF_ChIP-TIP/input/1A_CTCF_ChIPSeq_alignment_ENCFF172XLC.bam",
                "./CTCF_ChIP-TIP/input/1B_CTCF_ChIPSeq_alignment_ENCFF411OOS.bam",
                "./CTCF_ChIP-TIP/input/1C_CTCF_ChIPSeq_alignment_ENCFF091ODJ.bam")

peaks <- c("./CTCF_ChIP-TIP/input/1A_CTCF_TIPSeq_alignment_firstmate_peaks_qvalue0.01.narrowPeak",
            "./CTCF_ChIP-TIP/input/1A_CTCF_ChIPSeq_alignment_ENCFF172XLC_peaks_qvalue0.01.narrowPeak",
            "./CTCF_ChIP-TIP/input/1B_CTCF_ChIPSeq_alignment_ENCFF411OOS_peaks_qvalue0.01.narrowPeak",
            "./CTCF_ChIP-TIP/input/1C_CTCF_ChIPSeq_alignment_ENCFF091ODJ_peaks_qvalue0.01.narrowPeak")

motifs <- c("./CTCF_ChIP-TIP/input/1A_motif_MA1930.2.jaspar",
            "./CTCF_ChIP-TIP/input/1B_motif_MA1102.3.jaspar")

result <- MotifPeeker::MotifPeeker(
    peak_files = peaks,
    reference_index = 1,
    alignment_files = alignments,
    exp_labels = c("TIPSeq", "ChIPSeq1", "ChIPSeq2", "ChIPSeq3"),
    exp_type = c("tipseq", "chipseq", "chipseq", "chipseq"),
    genome_build = "hg38",
    motif_files = motifs,
    motif_labels = c("MA1930.2", "MA1102.3"),
    motif_discovery_count = 5,
    out_dir = "./CTCF_ChIP-TIP/output",
    save_runfiles = TRUE,
    BPPARAM = BiocParallel::MulticoreParam(4),
    quiet = TRUE,
    debug = FALSE,
    verbose = FALSE
)
