#########################
## Enrichting the QSAR dataset:
## original data from:
## [From the UCL repository](https://archive.ics.uci.edu/ml/datasets/QSAR+oral+toxicity)
## Author: Marc A.T. Teunis
## Date Nov. 2022
#########################

## Packages
library(tidyverse)
library(webchem)

## Read original datasets

# fingerprints
data_fp <- read_csv(
  here::here(
    "data",
    "lesson5",
    "qsar",
    "X.csv"
  ), col_names = paste0("f", 1:1024)
)

# row id
data_rows <- read_csv(
  here::here(
    "data",
    "lesson5",
    "qsar",
    "ID.txt"
  ), col_names = c(
    "IDS",
    "CASRN",
    "DTXSID",
    "Chemical_Name",
    "Structure_Source",
    "Canonical_QSARr",
    "Salt_Solvent",
    "InChI_Code_QSARr",
    "InChI_Key_QSARr",
    "LD50_mgkg",
    "toxic"
    ) |> tolower()
)

## enrich data
names(data_rows)
data_rows <- data_rows |>
  mutate(
    cid = map(
      inchi_key_qsarr,
      get_cid,
      verbose = TRUE,
      from = "inchikey"
    )
  )


# Class
data_classes <- read_csv(
  here::here(
    "data",
    "lesson5",
    "qsar",
    "class.csv"
  ), col_names = FALSE
)





