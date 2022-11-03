## object for object
x <- rnorm(100)
y <- sum(x)

y <- sum(rnorm(100))

rnorm(100) |>
  sum() -> y


really_long_pip

url <- "https://lesmaterialen.rstudio.hu.nl/intro_into_R/downloaddata/heights2.txt"
download.file(url = url, destfile = here::here("data", "heights2.txt"))

read_delim(file = url, delim = "\t", comment = "#")
read_delim(file = url, delim = "\t", skip = 2)

table_4a_tidy <- table4a |>
  janitor::clean_names() |>
  pivot_longer(col = c(x1999, x2000), names_to = "year", values_to = "cases")


table_4a_tidy |>
  names()





############################
## demo list-columns, using the `gapminder` dataset
############################

## plot population size over time
gapminder %>%
  dplyr::filter(continent == "Americas" | continent == "Africa") %>%
  ggplot(aes(x = year,
             y = log(population))) +
  geom_point(aes(colour = country), size = 0.5) +
  theme(legend.position="none") +
  facet_wrap( ~ continent) +
  theme(legend.position="none") +
  toolboxr::rotate_axis_labels("x", 45)

## explain map function
?map # lapply

mean_1 <- rnorm(10, mean = 1)
mean_2 <- rnorm(10, mean = 2)
mean_3 <- rnorm(10, mean = 3)

1:10 %>%
  map(rnorm, n = 10)

## group_by
gapminder_nested <- gapminder |>
  group_by(country) |>
  nest()

## write plot function for one country
plot_pop_year <- function(df){
  df |>
    ggplot(aes(x = year,
               y = log(population))) +
    geom_point() +
    theme(legend.position="none") +
    theme(legend.position="none") +
    toolboxr::rotate_axis_labels("x", 45) -> p
  return(p)
}

## test
albania_plt <- plot_pop_year(df = gapminder_nested$data[[1]])

## nest data with nest()

## map plot function with mutate
gapminder_nested <- gapminder_nested |>
  mutate(pop_plots = map(
    .x = data,
    .f = plot_pop_year
  ))

names(gapminder_nested$pop_plots) <- gapminder_nested$country

gapminder_nested$pop_plots$Netherlands



## name list-column, using another column

## get plot for one country





