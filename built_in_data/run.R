library(MotifPeeker)

# Load the data
data("CTCF_ChIP_peaks", package = "MotifPeeker")
data("CTCF_TIP_peaks", package = "MotifPeeker")
data("motif_MA1102.3", package = "MotifPeeker")
data("motif_MA1930.2", package = "MotifPeeker")
CTCF_ChIP_alignment <- system.file("extdata", "CTCF_ChIP_alignment.bam",
                                    package = "MotifPeeker")
CTCF_TIP_alignment <- system.file("extdata", "CTCF_TIP_alignment.bam",
                                    package = "MotifPeeker")

# Prepare the data
peak_files <- list(CTCF_ChIP_peaks, CTCF_TIP_peaks)
alignment_files <- list(CTCF_ChIP_alignment, CTCF_TIP_alignment)
motif_files <- list(motif_MA1102.3, motif_MA1930.2)

# Run MotifPeeker
result <- MotifPeeker(
    peak_files = peak_files,
    reference_index = 2,  # Set TIP-seq experiment as reference
    alignment_files = alignment_files,
    exp_labels = c("ChIP", "TIP"),
    exp_type = c("chipseq", "tipseq"),
    genome_build = "hg38",  # Use hg38 genome build
    motif_files = motif_files,
    cell_counts = NULL,  # No cell-count information
    motif_discovery = TRUE,
    motif_discovery_count = 3,  # Discover top 3 motifs
    motif_db = NULL,  # Use default motif database (JASPAR)
    download_buttons = TRUE,
    out_dir = "./built_in_data/output",
    save_runfiles = TRUE,
    BPPARAM = BiocParallel::MulticoreParam(2),  # Use two CPU cores on a 16GB RAM machine
    debug = FALSE,
    quiet = TRUE,
    verbose = TRUE
)
