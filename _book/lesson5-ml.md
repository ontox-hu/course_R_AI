# Lesson 5 - Answering research questions



<img src="images/04_1_ggplot.png" width="50%" style="display: block; margin: auto;" />

## Learning objectives

After this lesson:

- 

## Packages

```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
## ✔ readr   2.1.2     ✔ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
#remotes::install_github("biobricks-ai/biobricks-R")
library(biobricks)
```

```
## 
## Attaching package: 'biobricks'
```

```
## The following object is masked from 'package:methods':
## 
##     initialize
```

## Data 
For this lesson we will use a number of different datasets. Because we need datasets that include somewhat larger volumes of data, we also download dat on the fly.

Let's get the datasets 
Tox21 end Chembl, using the [biobricks.ai bricks]() 


```r
biobricks::local_bblib()
initialize()
brick_install("tox21")
brick_pull("tox21") # OR build it with brick_repro("HGNC")
tbls <- brick_load_arrow("tox21")
names(tbls) # "hgnc_complete_set.parquet"

## look at one table

tox21_tbls  <- purrr::imap_dfr(tbls,~ tibble(tbl=.y,rows=nrow(.x))) |> arrange(desc(rows))
tox21_names <- purrr::imap_dfr(tbls,~ tibble(tbl=.y,name=names(.x)))

ids <- tox21_names |> filter(grepl("ID$",name))
ids <- ids |> split(ids$name) |> discard(~nrow(.)<2) 
names(ids)
tox21_names 

## look at one table
x <- tbls$`tox21-ache-p3.aggregrated.parquet` |> dplyr::collect()
x

data_all <- 
  map(
    .x = tbls,
    .f = dplyr::collect
  )
```

## Comptox

https://clowder.edap-cluster.com/datasets/61147fefe4b0856fdc65639b#folderId=631759a1e4b04f6bb1324618&page=0



## QSAR data

[From the UCL repository](https://archive.ics.uci.edu/ml/datasets/QSAR+oral+toxicity)

Metadata:
Attribute Information:

1024 binary molecular fingerprints and 1 experimental class:
1-1024) binary molecular fingerprint
1025) experimental class: positive (very toxic) and negative (not very toxic)

Relevant Papers:

[D. Ballabio, F. Grisoni, V. Consonni, R. Todeschini (2019), Integrated QSAR models to predict acute oral systemic toxicity, Molecular Informatics, 38, 180012; doi: 10.1002/minf.201800124](https://doi.org/10.1002/minf.201800124)


```r
library(archive)
tf <- tempfile()
td <- tempdir()
file.path <- here::here(
  "data",
  "lesson5",
  "qsar",
  "qsar_oral_toxicity.zip"
)

download.file(url = "https://archive.ics.uci.edu/ml/machine-learning-databases/00508/qsar_oral_toxicity.zip", destfile = file.path)

unzip(zipfile = file.path, exdir = td)
td
```

```
## [1] "/var/folders/jj/ry0brsx507v_fwkldz1ghz7r0000gn/T//RtmpJDWyQP"
```

```r
list.files(td)
```

```
## [1] "file6e605e52eb92"       "qsar_oral_toxicity.csv"
```

```r
data_qsar <- read_csv2(
  file.path(td, "qsar_oral_toxicity.csv"),
  col_names = FALSE)
```

```
## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
```

```
## Rows: 8992 Columns: 1025
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ";"
## chr    (1): X1025
## dbl (1024): X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

## EXERCISE
 
 1. Inspect the file `qsar_oral_toxicity.csv`, using the `head` command the terminal, or on Windows: open the file with Notepad. Are there headers in this file? 
 2. Rename the columns with a string from "f1" to "f1025"
 3. Reorder the classification column ("f1025") to be the first column
 4. Look at the dataset
 5. Tally the classification column, how many observations of each class do we have? Does this correspond with the meta data on UCL? Do you see a potential problem?
 6. Isolate the classification column in a new R object
 7. Remove the row with classifications ("f1025") from the data
 

```r
# answer
names_new <- paste0("f", 1:1025)
names(data_qsar) <- names_new
data_qsar <- data_qsar |>
  dplyr::relocate(f1025, .before = f1)

data_qsar |> 
  group_by(f1025) |>
  tally()
```

```
## # A tibble: 2 × 2
##   f1025        n
##   <chr>    <int>
## 1 negative  8251
## 2 positive   741
```

```r
classes <- data_qsar$f1025
```
 
## Unsupervised machine learning
Before we plan to do any kind of classification task on our data, it is good to consider doing an exploratory data analysis to learn more about our data.
Here we use a principal component analysis and a k-means clustering to learn some patterns.

## Principal Component Analysis




 
 


