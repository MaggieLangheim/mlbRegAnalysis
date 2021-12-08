---
title: "NPF Regression Analysis"
author: "MAL"
date: "10/30/2021"
output: rmarkdown::github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
```

### This analysis utilizes a data file I compiled myself based on public data on the National Pro Fastpitch website

```{r}
npf <- read.csv('https://raw.githubusercontent.com/MaggieLangheim/mlbRegAnalysis/main/npfData.csv')
```

### The three variables we will be looking at are W (Wins), SB (Stolen bases on offense), and CSB (Times caught stealing on offense). For all three variables, each point is the total number for a team in a single season.

### I'm going to start by mutating some of the data so that it shows an accurate visual representation. I transformed the CSB variable to a negative to demonstrate the inverse relationship between CSB and W.

```{r}
npf2 <- npf %>%
  mutate(CSB = CS*-1)
```



### Now we'll begin the data analysis by creating a scatterplot to determine the type of relationship bewteen stolen bases on offense and total wins. Based on the plot below, there is a positive linear relationship between the two.

```{r}
ggplot(npf,
       aes(x=SB, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Stolen Bases", y = "Wins")
```
![](unnamed-chunk-4-1.png)<!-- -->

### Next, we fit a model to the data. Below is a simple linear model of the relationship between stolen bases and total wins.

```{r}
sb_model <- lm(npf$W ~ npf$SB)
summary(sb_model)
```


### The model includes p-values, multiple R square, and coefficients which are all beneficial to describing the effect stolen bases have on total wins. 

### First, p-values indicate whether or not the relationship is caused by something other than chance, and the typical cutoff is 0.05. For the relationship between stolen bases and total wins, the p-value is very small (< 0.01), so this stolen bases is very meaningful when looking at what effects wins.

### The multiple R square shows how much the number of stolen bases effect the total number of wins. 41.3% of the variation in wins can be explained by stolen bases.

### Lastly, the coefficient which shows how many stolen bases it takes for one additional win. So based on this NPF data, it takes 3 additional stolen bases on the season to win an extra game.


### Next, is a scatterplot to determine the type of relationship bewteen being caught stealing and total wins. Based on the plot below, there is a negative linear relationship between the two.

```{r}
ggplot(npf2,
       aes(x=CSB, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Runners Caught Stealing", y = "Wins")
```

### Next, we fit a model to the data. Below is a simple linear model of the relationship between caught stealing and total wins.

```{r}
csb_model <- lm(npf2$W ~ npf2$CSB)
summary(csb_model)
```

### First, the relationship between runners caught stealing and total wins is significant because the p-value is less than 0.05, but not as significant as stolen bases.
### The multiple R square shows how much the number of runners caught stealing effect the total number of wins. In this data, only about a fourth (22.2%) of the variation can be attributed to runners caught stealing.
### The last important aspect to look at is the coefficient which shows how many runners caught stealing it takes to affect the number of wins in a season. Based on this data, every two times a team got caught trying to steal a base, they lost one win from their season total.
