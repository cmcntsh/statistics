# get packages
library(tidyverse)

# make some data
tstdata <- tibble(id=1:30
                  ,fakeinst1 = sample(c(1:7), replace = TRUE, size=30)
                  ,fakeinst2 = sample(c(1:7), replace = TRUE, size=30)
                  ,fakeinst3 = sample(c(1:7), replace = TRUE, size=30))

# turn fakeinst variables to ordinal
tstdata %>% mutate(fakeinst1f = as_factor(fakeinst1)) -> tstdata
tstdata %>% mutate(fakeinst2f = as_factor(fakeinst2)) -> tstdata
tstdata %>% mutate(fakeinst3f = as_factor(fakeinst3)) -> tstdata
tstdata %>% mutate(fakeinst1f = recode_factor(fakeinst1f, "1"="first",.ordered = TRUE)) -> tstdata
tstdata %>% mutate(fakeinst2f = recode_factor(fakeinst2f, "1"="first",.ordered = TRUE)) -> tstdata
tstdata %>% mutate(fakeinst3f = recode_factor(fakeinst3f, "1"="first",.ordered = TRUE)) -> tstdata

# create composite variables from ordinal
tstdata %>% group_by(id) %>% mutate(fakeinstsum = sum(c(fakeinst1f,fakeinst2f,fakeinst3f),na.rm = TRUE)) %>% ungroup() -> tstdata
tstdata %>% group_by(id) %>% mutate(fakeinstmean = mean(c(fakeinst1f,fakeinst2f,fakeinst3f),na.rm = TRUE)) %>% ungroup() -> tstdata

# calculate z-scores
tstdata %>% mutate(fakeinstsumz = scale(fakeinstsum,center = TRUE, scale = TRUE)) -> tstdata
tstdata %>% mutate(fakeinstmeanz = scale(fakeinstmean,center = TRUE, scale = TRUE)) -> tstdata

# see tibble metadata
str(tstdata)
