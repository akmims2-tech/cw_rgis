library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)
filter(iris_sub, Species == "virginica")
filter(iris_sub, Species %in% c("virginica", "versicolor"))
filter(iris_sub, Species != "setosa")
filter(iris_sub, Petal.Length > 5 | Sepal.Length >5)
filter(iris_sub, Petal.Length > 5, Sepal.Length >5)
filter(iris_sub, Petal.Length > 5, ! Sepal.Length >5)

arrange(iris_sub, Sepal.Width)
arrange(iris_sub, desc(Sepal.Width))

#Assignment
iris_3 <- filter(iris_sub, Sepal.Width > 3)

#Select()
select(iris_sub, Sepal.Length)
select(iris_sub, Sepal.Length, Sepal.Width)
select(iris_sub, -Sepal.Length, -Sepal.Width)
select(iris_sub, -c(Sepal.Length, Sepal.Width))

select(iris_sub, starts_with("Sepal"))
select(iris_sub, contains("al"))

# Mutate()
x_max <- nrow(iris_sub)
x <- 1:x_max

mutate(iris_sub, row_id = 1:nrow(iris_sub))
mutate(iris_sub, mu_s1 = mean(Sepal.Length)) 
mutate(iris_sub, sep.area = Sepal.Length * Sepal.Width / 2) 
mutate(group_by(iris_sub, Species), mu_s1 = mean(Sepal.Length))

#Pipe 
iris_sub %>%
  filter(Species == "virginica")
iris_sub <- iris_sub %>%
  group_by(Species) %>%
  mutate(mu_s1 = mean(Sepal.Length)) %>%
  ungroup()

iris_pipe <- iris_sub %>% 
  filter(Species == "setosa") %>%
  mutate(pw_2times = 2*Petal.Width)
  
mean(iris_sub$Sepal.Length)

iris_sub %>%
  group_by(Species) %>%
  summarise(mu_s1 = mean(Sepal.Length), sum_s1 = sum(Sepal.Length))
