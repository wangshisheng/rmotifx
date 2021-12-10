\name{FindMotif}
\alias{FindMotif}
\title{Find overrepresented sequence motifs}
\usage{
FindMotif(fg.seqs, bg.seqs, min.seqs=20, pval.cutoff=0.05, cent.regex='[ST]', verbose=F, perl.impl=F)
}
\arguments{
  \item{fg.seqs}{Foreground k-mer sequences in a
  pre-aligned format. All k-mers must have same lengths.}

  \item{bg.seqs}{Background k-mer sequences in a
  pre-aligned format. All k-mers must have same lengths.}

  \item{cent.regex}{Central amino acid of the k-mer.
  Sequences without this amino acid in the centre position
  are filtered out. This can be one or more letter. For
  example, 'S', 'ST', 'Y', or 'STY'.}

  \item{min.seqs}{This threshold refers to the minimum
  number of times you wish each of your extracted motifs to
  occur in the data set. An occurrence threshold of 20
  usually is appropriate, although this parameter may be
  adjusted to yield more specific or less specific motifs.}

  \item{pval.cutoff}{The p-value threshold for the binomial
  probability. This is used for the selection of
  significant residue/position pairs in the motif. A
  threshold of 0.000001 is suggested to maintain a low
  false positive rate in standard protein motif analyses.}

  \item{verbose}{If true, motifx will show textual details
  of the steps while running.}

  \item{perl.impl}{The original implementation of motifx in
  perl, P-values below 1e-16 cannot be computed and are
  thus set to zero. Motifx therefore sets any P-values of
  zero to the minimal P-value of 1e-16. In R, the minimal
  P-value is much lower (depending on the machine). If this
  option is set to TRUE, P-values with a value of zero are
  set to 1e-16, as in perl. Otherwise, the R P-value
  minimum will be used. For results identical to that of
  the webserver implementation, set to TRUE.}
}

