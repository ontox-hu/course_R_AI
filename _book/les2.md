# Lesson 2 - Data types and structures in R



![](images/02_1_rlogo.png)

## Contents day 2

 - Reading and cleaning data
 - Visualizations

## Learning objectives

After this lesson:

- You can import data into the R environment
- You know how to inspect your data
- You can make your data "tidy"
- You can visualize categorical data with ggplot.
- You can visualize continuous data with ggplot.
- You can summarize data using boxplots.
- you can perform the most common statistical tests with R.

## Importing text files

So far, we have worked with built-in datasets. In real life you will generate data yourself or you will obtain data from other researchers or public sources such as [NCBI](https://www.ncbi.nlm.nih.gov/).

To start working with your own datasets, data needs to be read by R and stored as R objects. We can use a variety of  `read_function()` from the the [tidyverse](https://www.tidyverse.org/) packages to import plain text datafiles as tibbles (sort of like a data table). These functions work the same. If you have mastered one  you can use the other functions in a similar way:


```r
read_csv()       ## comma separated values
read_csv2()      ## semicolon separated values
read_tsv()       ## tab separated values
read_delim()     ## custom defined delimiter, for example: 
read_delim("voorbeeld.csv", delim="&")
read_fwf()       ## fixed width fields
read_table()     ## white space separated 
```

### separators 

Before choosing the right `read_function()` you need to know how the values of your dataset are separated. 

You can view files by clicking on them in the files tab (lower right corner of the screen). 
<img src="images/01_3_Rstudio.jpg" width="80%" />

**download the datasets for this lesson here: [click](data/lesson3.zip)**

**unzip the folder and place it within your project folder**

**click on heights.csv, select view**

Values of the heights.csv file are separated by comma's. Even though the filename ends on csv (comma separated values) always inspect the contents of a datafile before loading it into R! 

We can use the read_csv() function:

###### Example

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
heights <- read_csv("data/lesson3/heights.csv")
```

```
## Rows: 1192 Columns: 6
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (2): sex, race
## dbl (4): earn, height, ed, age
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

you can view the data by typing the object name in the console (or in a script and run that line):


```r
heights
```

R assumes the decimal separator is a "point". If your datafile has a comma as a decimal separator (most european datafiles) you have to tell the `read_function()` this!

We will use a datafile which is present in the server folder **data/lesson3** named **heights3.txt**. Inspect the datafile heights3.txt. As you can see, 
the values are tab separated and the decimal separator is a comma.

We will first use the `read_tsv()` function with default settings:

###### Example

```r
heights_3 <- read_tsv("data/lesson3/heights3.txt")
```

```
## Rows: 1192 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: "\t"
## chr (2): sex, race
## dbl (3): earn, ed, age
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
heights_3
```

```
## # A tibble: 1,192 × 6
##     earn  height sex       ed   age race    
##    <dbl>   <dbl> <chr>  <dbl> <dbl> <chr>   
##  1 50000 7.44e14 male      16    45 white   
##  2 60000 6.55e14 female    16    58 white   
##  3 30000 6.36e14 female    16    29 white   
##  4 50000 6.31e14 female    16    91 other   
##  5 51000 6.34e14 female    17    39 white   
##  6  9000 6.44e14 female    15    26 white   
##  7 29000 6.17e14 female    12    49 white   
##  8 32000 7.27e14 male      17    46 white   
##  9  2000 7.20e14 male      15    21 hispanic
## 10 27000 7.22e14 male      12    26 white   
## # … with 1,182 more rows
```

The values of variable height are not shown correctly:

* row1 original value = 74,4244387818035. 
* row1 converted value = 7.44e14

We have to instruct `read_tsv()` that the comma acts a decimal separator by using the locale argument in combination with the `locale()` function:

###### Example

```r
heights_3 <- read_tsv("data/lesson3/heights3.txt", 
                      locale = locale(decimal_mark = ","))
```

```
## Rows: 1192 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: "\t"
## chr (2): sex, race
## dbl (4): earn, height, ed, age
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
heights_3
```

```
## # A tibble: 1,192 × 6
##     earn height sex       ed   age race    
##    <dbl>  <dbl> <chr>  <dbl> <dbl> <chr>   
##  1 50000   74.4 male      16    45 white   
##  2 60000   65.5 female    16    58 white   
##  3 30000   63.6 female    16    29 white   
##  4 50000   63.1 female    16    91 other   
##  5 51000   63.4 female    17    39 white   
##  6  9000   64.4 female    15    26 white   
##  7 29000   61.7 female    12    49 white   
##  8 32000   72.7 male      17    46 white   
##  9  2000   72.0 male      15    21 hispanic
## 10 27000   72.2 male      12    26 white   
## # … with 1,182 more rows
```

Now the values of the height variable are read in correctly.
