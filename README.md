
[![rmotifx](https://rawgit.com/omarwagih/rmotifx/master/inst/extdata/rmotifx-logo.svg)](https://github.com/omarwagih/rmotifx)

## Introduction
This package contains a useable implementation the motif-x tool in the R programming language. motif-x (short for motif extractor) is a software tool designed to extract overrepresented patterns from any sequence data set. The algorithm is an iterative strategy which builds successive motifs through comparison to a dynamic statistical background. For more information, please refer to the original [motif-x resource](http://motif-x.med.harvard.edu/). Please note that the current implementation only supports sequences with a fixed length (i.e. pre-aligned) and have a fixed central residue. For example, phosphorylation sites. 

## How to install?
The motif-x R package can be directly installed from github. First, ensure the `devotools` package is installed:

```splus
install.packages('devtools')
```

Then install rmotifx:

```splus
require(devtools)
install_github('omarwagih/rmotifx')
```

## How to use?
To get started, fire up the motif-x package:

```splus
require(rmotifx)
```

The package contains the function `motifx` which does everything. For a simple run, you will need a foreground and background set of sequences. 

We can go ahead and use the sample data provided with the package: 

```splus
# Get paths to sample files
fg.path = system.file("extdata", "fg-data-ck2.txt", package = "rmotifx")
bg.path = system.file("extdata", "bg-data-serine.txt", package = "rmotifx")

# Read in sequences
fg.seqs = readLines(fg.path)
bg.seqs = readLines(bg.path)

# You can take a look at the format of the sample data
head(fg.seqs)
head(bg.seqs)
```

Here, the foreground data represents phosphorylation binding sites of Casein Kinase 2. The negative data represents 10,000 random serine-centered sites.

To start the program, run the following:

```splus
mot = motifx(fg.seqs, bg.seqs, central.res = 'S', min.seqs = 20, pval.cutoff = 1e-6)
print(mot)
```

The results returned should have the following format:

```
| motif           | score            | fg.matches | fg.size | bg.matches | bg.size | fold.increase    |
|-----------------|------------------|------------|---------|------------|---------|------------------|
| .......SD.E.... | 615.305311137178 | 57         | 399     | 23         | 6039    | 37.5093167701863 |
| .......S..EE... | 318.377804126939 | 37         | 342     | 37         | 6016    | 17.5906432748538 |
| .......SD.D.... | 615.305311137178 | 39         | 305     | 12         | 5979    | 63.7106557377049 |
| .......SE.E.... | 314.760503514246 | 24         | 266     | 32         | 5967    | 16.8242481203008 |
| .......S..E.... | 307.652655568589 | 56         | 242     | 325        | 5935    | 4.22581055308328 |
| .......SE.D.... | 315.866504156853 | 21         | 186     | 26         | 5610    | 24.3610421836228 |
| .......S..D.... | 10.915342261675  | 30         | 165     | 233        | 5584    | 4.35739367928209 |
| .......SD...... | 9.3715112092424  | 25         | 135     | 224        | 5351    | 4.42377645502645 |
| .......S.E..... | 7.27014238663954 | 25         | 110     | 342        | 5127    | 3.40709728867624 |
```

It's that easy!

For detailed explanations of all parameters and output, check out the documentation by typing `?motifx`. You can also refer to the original motif-x [resource](http://motif-x.med.harvard.edu/motif-x.html) or [paper](http://motif-x.med.harvard.edu/publications/Chou_Schwartz_motif-x_CPBI_2011.pdf). 


## Citation
If you use rmotifx please do cite the following paper:


Wagih O, Sugiyama N, Ishihama Y, Beltrao P. (2015) Uncovering phosphorylation-based specificities through functional interaction networks (2015). *Mol. Cell. Proteomics* [PUBMED](http://www.ncbi.nlm.nih.gov/pubmed/26572964)

## Todo

- Add support for degenerate motifs
- Add support for DNA sequences. Currently, only protein supported.
- Allow motif discovery in non-centered k-mers

## Feedback
If you have any feedback or suggestions, please drop me a line at (wagih(at)ebi.ac.uk) or open an issue on github.
