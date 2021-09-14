# Packages
```
update.packages(repos='http://cran.us.r-project.org',ask = FALSE)
install.packages('xml2', repos='http://cran.us.r-project.org')
install.packages('devtools', repos='http://cran.us.r-project.org')
devtools::install_github(repo="knausb/vcfR")
devtools::install_github("jhavsmith/startmrca")
library(vcfR)
library(startmrca) 

```

# R-mode on Emacs
```
M-x package-refresh-contents ENTER
M-x package-install ENTER ess ENTER
```

# Argument 1
```
$ Rscript test.R pbmc.rda
```
```
#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
    stop("At least one argument is needed.", call.=FALSE)
} else if (length(args)==1) {
    args[2] = "out.txt"
}

data <- get(load(args[1]))
```

# Argument 2
```
$ ./test.R -i pbmc.rda
```
```
#!/usr/bin/env Rscript
library("optparse")
 
option_list = list(
    make_option(c("-i", "--input"), type="character", default=NULL, 
                help="input file name", metavar="character"), 
    make_option(c("-o", "--out"), type="character", default="out.txt", 
                help="output file name [default= %default]", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$input)){
    print_help(opt_parser)
    stop("At least one argument is needed.", call.=FALSE)
}

data <- get(load(opt$input))
```
