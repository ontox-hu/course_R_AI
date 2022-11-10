library(tidyverse)

df <- tribble(
  ~id,     ~source,        ~pfos_lb,    ~pfos_mb,   ~pfos_ub,
   "AXC",    "fish",        0,           1,          2,
   "RSA",    "fish",        1,           2,          3,
   "TSX",    "waterflee",   NA,          1,          2
)

## put column names in tibble for later use
column_names <- names(df) |>
  enframe(name = "col_position", value = "col_name")

## find those columns containing a 'bound'
pattern <- c("(.*lb|.*mb$|.*ub$)") # regular expression

test_string1 <- c("pfos_lb")
test_string2 <- c("pfas_lb")

str_view(string = test_string1, pattern = pattern)
str_view(string = test_string2, pattern = pattern)

ind <- str_detect(
  string = column_names$col_name,
  pattern = pattern)

## get col_indexes for xfas_xb columns
xfas_xb_positions <- column_names$col_position[ind]

## pivot longer, only the xfas_xb columns
df_tidy <- df |>
  pivot_longer(
    cols = xfas_xb_positions,
    names_to = "xfas_xb",
    values_to = "bound"
  )

## separate "xfas_xb"
df_tidy <- df_tidy |>
  separate(col = xfas_xb, into = c("compound", "bound_type"))

df_tidy
