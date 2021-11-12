---
title: "NPF Regression Analysis"
author: "MAL"
date: "10/30/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
```

## Before beginning, this analysis utilizes the following packages: tidy verse

```{r}
npf <- read.csv('https://raw.githubusercontent.com/MaggieLangheim/mlbRegAnalysis/main/npfData.csv')
```

```{r}
ggplot(npf,
       aes(x=SB, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Stolen Bases", y = "Wins")
```
```{r}
ggplot(npf,
       aes(x=SB, y= W, color = OBP)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Stolen Bases", y = "Wins")
```

```{r}
sb_model <- lm(npf$W ~ npf$SB)
summary(sb_model)
```


### The multiple R square indicates how well stolen base explains any change in wins. From between each season and team, the number of wins per season varies quite a bit, but this data shows that about 41.3% of the variation in wins can be explained by stolen bases.
### Coefficients is the estimate of the betas, or coefficients in the equation. 
### On average, if a team was to have three more stolen base on the season, it would be expected for them to have one additional win. This is shown mathematically by: 0.313 x 3 = 0.939
### The P-values measure the significance of these statistics. In this case, the p-value is very small (< 0.01), so this variable is very meaningful when it comes to evaluates what effects wins.



```{r}
ggplot(npf,
       aes(x=CS, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Runners Caught Stealing", y = "Wins")
```
```{r}
ggplot(npf,
       aes(x=CS, y= W)) +
  geom_jitter(aes(color = Team)) +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Runners Caught Stealing", y = "Wins")
```

```{r}
csb_model <- lm(npf$W ~ npf$CS)
summary(csb_model)
```

### The multiple R square for this data is relatively low, 0.262, which means that only about a fourth of the variation in wins can be explained by the number of runners caught stealing. 
### This data suggests that with each runner that the defense catches stealing, their wins actually decrease by 0.838.
### Lastly, the p-values for CSB are larger than the p-values for SB which indicates that CSB is less significant in determining what affects the number of wins each season.

### In conclusion, there are many other factors that affect wins, but this specific data set suggests that the amount of stolen bases on offense has a larger impact than the amount of runners caught stealing defensively on the number of wins per season. We can see that stolen bases are in fact relevant because of its extremely low p-value, and its impact on wins is considerable shown by the large r-square.



