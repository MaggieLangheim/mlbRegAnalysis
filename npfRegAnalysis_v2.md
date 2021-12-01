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

### First, plot a scatterplot to determine the type of relationship bewteen stolen bases on offense and total wins. Based on the plot below, there is a positive linear relationship between the two.

```{r}
ggplot(npf,
       aes(x=SB, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Stolen Bases", y = "Wins")
```
![](/unnamed-chunk-2-1.png)<!-- -->

### Next, we fit a model to the data. Below is a simple linear model of the relationship between stolen bases and total wins.

```{r}
sb_model <- lm(npf$W ~ npf$SB)
summary(sb_model)
```


### The model includes multiple R square, coefficients, and p-values which are all beneficial to describing the effect stolen bases have on total wins. 
### The multiple R square shows how much the number of stolen bases effect the total number of wins. Since each season in the NPF did not have a uniform number of games for every team each season. However, 41.3% of the variation in wins can be explained by stolen bases.
### The next important point to look at is the coefficient which shows how many stolen bases it takes for one additional win. So based on this NPF data, it takes 3 additional stolen bases on the season to win an extra game.
### The last statistic to look is the p-value which indicates whether or not the relationship is caused by something other than chance. For the relationship between stolen bases and total wins, the p-value is very small (< 0.01), so this stolen bases is very meaningful when looking at what effects wins.

```{r}
#ggplot(npf,
#      aes(x=SB, y= W, color = OBP)) +
  #geom_point() +
  #geom_smooth(method='lm') +
  #theme(text = element_text(size = 14)) +
  #labs(x = "Stolen Bases", y = "Wins")
```

### Next is a scatterplot to determine the type of relationship bewteen runners caught stealing on defense and total wins. Based on the plot below, there is a positive linear relationship between the two.

```{r}
ggplot(npf,
       aes(x=CS, y= W)) +
  geom_point() +
  geom_smooth(method='lm') +
  theme(text = element_text(size = 14)) +
  labs(x = "Runners Caught Stealing", y = "Wins")
```
![](/unnamed-chunk-5-1.png)<!-- -->

### Next, we fit a model to the data. Below is a simple linear model of the relationship between caught stealing and total wins.

```{r}
csb_model <- lm(npf$W ~ npf$CS)
summary(csb_model)
```

### The multiple R square shows how much the number of runners caught stealing effect the total number of wins. In this data, only about a fourth (26.%) of the variation can be attributed to runners caught stealing.
### **The next important point to look at is the coefficient which shows how many runners caught stealing it takes to gain one additional win.**
### Lastly, for the relationship between runners caught stealing and total wins, the p-value is very small (< 0.01), but are larger than the p-value for stolen bases, so runners caught stealing is not as large of a factor on total wins than stolen bases.

```{r}
#ggplot(npf,
#       aes(x=CS, y= W)) +
  #geom_jitter(aes(color = Team)) +
  #geom_smooth(method='lm') +
  #theme(text = element_text(size = 14)) +
  #labs(x = "Runners Caught Stealing", y = "Wins")
```

```{r}
##mod1 <- lm(W ~ CS + SB, data = npf)
##mod2 <- lm(W ~ CS, data = npf)
##aov(mod1, mod2)
```




