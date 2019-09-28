# Skewness and Kurtosis like SPSS
# http://www.stat.cmu.edu/~hseltman/files/spssSkewKurtosis.R
spssSkewKurtosis=function(x) {
  w=length(x)
  m1=mean(x)
  m2=sum((x-m1)^2)
  m3=sum((x-m1)^3)
  m4=sum((x-m1)^4)
  s1=sd(x)
  skew=w*m3/(w-1)/(w-2)/s1^3
  sdskew=sqrt( 6*w*(w-1) / ((w-2)*(w+1)*(w+3)) )
  kurtosis=(w*(w+1)*m4 - 3*m2^2*(w-1)) / ((w-1)*(w-2)*(w-3)*s1^4)
  sdkurtosis=sqrt( 4*(w^2-1) * sdskew^2 / ((w-3)*(w+5)) )
  mat=matrix(c(skew,kurtosis, sdskew,sdkurtosis), 2,
             dimnames=list(c("skew","kurtosis"), c("estimate","se")))
  return(mat)
}

# I split these into separate functions to use with dplyr
# http://www.stat.cmu.edu/~hseltman/files/spssSkewKurtosis.R
skewFunct=function(x, na.rm=FALSE){
  w = ifelse(na.rm==TRUE,length(x)-sum(is.na(x),na.rm=TRUE),length(x))
  m1=mean(x,na.rm=na.rm)
  m2=sum((x-m1)^2,na.rm=na.rm)
  m3=sum((x-m1)^3,na.rm=na.rm)
  m4=sum((x-m1)^4,na.rm=na.rm)
  s1=sd(x,na.rm=na.rm)
  skew=w*m3/(w-1)/(w-2)/s1^3
  return(skew)
}
kurtosisFunct=function(x, na.rm=FALSE){
  w = ifelse(na.rm==TRUE,length(x)-sum(is.na(x),na.rm=TRUE),length(x))
  m1=mean(x)
  m2=sum((x-m1)^2)
  m3=sum((x-m1)^3)
  m4=sum((x-m1)^4)
  s1=sd(x)
  kurtosis=(w*(w+1)*m4 - 3*m2^2*(w-1)) / ((w-1)*(w-2)*(w-3)*s1^4)
  return(kurtosis)
}
SEskewFunct=function(x, na.rm=FALSE){
  w = ifelse(na.rm==TRUE,length(x)-sum(is.na(x),na.rm=TRUE),length(x))
  m1=mean(x)
  m2=sum((x-m1)^2)
  m3=sum((x-m1)^3)
  m4=sum((x-m1)^4)
  s1=sd(x)
  sdskew=sqrt( 6*w*(w-1) / ((w-2)*(w+1)*(w+3)) )                          
  return(sdskew)
}
SEkurtosisFunct=function(x, na.rm=FALSE){
  w = ifelse(na.rm==TRUE,length(x)-sum(is.na(x),na.rm=TRUE),length(x))
  m1=mean(x)
  m2=sum((x-m1)^2)
  m3=sum((x-m1)^3)
  m4=sum((x-m1)^4)
  s1=sd(x)
  sdskew=sqrt( 6*w*(w-1) / ((w-2)*(w+1)*(w+3)) )
  sdkurtosis=sqrt( 4*(w^2-1) * sdskew^2 / ((w-3)*(w+5)) )
  return(sdkurtosis)
}


# Example of getting useful descriptive statistics for numeric variables.
dataset %>%
  dplyr::select(interval,ratio) %>%
  dplyr::summarise_each(funs(class = class
                             , valid = sum(!is.na(.),na.rm = TRUE)
                             , missing = sum(is.na(.))
                             , misspercent = scales::percent(round(sum(is.na(.))/sum(!is.na(.),na.rm = TRUE),2))
                             , min = min(.,na.rm = TRUE)
                             , q25 = quantile(., 0.25,na.rm = TRUE)
                             , median = median(.,na.rm = TRUE)
                             , q75 = quantile(., 0.75,na.rm = TRUE)
                             , max = max(.,na.rm = TRUE)
                             , range = diff(range(.))
                             , mean = round(mean(.,na.rm = TRUE),2)
                             , sd = round(sd(.,na.rm = TRUE),2)
                             , variance = round(var(.,na.rm = TRUE),2)
                             , skewness = round(skewFunct(.,na.rm = TRUE),2)
                             , SEskewness = round(SEskewFunct(.,na.rm = TRUE),2)
                             , kurtosis = round(kurtosisFunct(.,na.rm = TRUE),2)
                             , SEkurtosis = round(SEkurtosisFunct(.,na.rm = TRUE),2)
                             , ShapWilk = ifelse(sd(.)!=0,round(shapiro.test(.)$statistic,2),NA)
                             , ShapWilkp = ifelse(sd(.)!=0,round(shapiro.test(.)$p.value,2),NA))) %>%
  tidyr::gather(stat,val) %>%
  tidyr::separate(stat, into = c("var", "stat"), sep = "_") %>%
  tidyr::spread(stat, val) %>%
  dplyr::select(var
                , class
                , valid
                , missing
                , misspercent
                , min
                , q25
                , median
                , q75
                , max
                , range
                , mean
                , sd
                , variance
                , skewness
                , SEskewness
                , kurtosis
                , SEkurtosis
                , ShapWilk
                , ShapWilkp) %>% # reorder
  print()