## SNIPPETS


```{r}
library(archive)
tf <- tempfile()
td <- tempdir()

download.file(url = "http://bioinf.jku.at/research/DeepTox/tox21.zip", destfile = tf)

tf

unzip(zipfile = file.path(tf), exdir = td)
tox21_files <- list.files(
  td,
  full.names = TRUE,
  pattern =
    "(^tox21.*\\.csv.gz|^tox21.*\\.csv|^tox21.*\\.txt.gz|^tox21.*\\.mtx.gz)"
  ## starts with 'tox21, ends with .csv.gz, or .csv, or etc...
)

tox21_files
## let's read all tox21 files into R, using a regular expression

data_all_tox21 <- map(
  tox21_files,
  readr::read_csv
)

## putting some names to the objects in the list
names(data_all_tox21) <- basename(tox21_files)

## pull out 1 table for inspection. Let's focus on
dense_test <- data_all_tox21$tox21_dense_test.csv.gz

## can we learn more?
labels_test <- data_all_tox21$tox21_labels_test.csv.gz

```
