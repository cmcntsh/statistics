## exams ----------------------------------------------------------------------------

## load package
library("exams")

## exam with a simple vector of exercises in R/Markdown (.Rmd) format
## -> alternatively try a list of vectors of more exercises
myexam <- c("tstat.Rmd", "tstat2.Rmd", "boxplots.Rmd", "function.Rmd", "boxhist.Rmd", "currency8.Rnw")
## note that the currency exercise is in UTF-8 encoding


## exams2pdf ------------------------------------------------------------------------
## PDF output (1 file per exam)
## -> typically used for quickly checking if an exercise can be converted to PDF
## -> or customized via suitable templates

## generate the PDF version of a single exercise (shown in PDF viewer)
## with default settings
exams2pdf("exercises/tstat.Rmd")

## generate a single PDF exam (shown in PDF viewer)
## with specification of a template (for an exam) %s encoding
exams2pdf(myexam, n = 1,
  encoding = "UTF-8",
  edir = "exercises",
  template = "templates/solution.tex")

## generate three PDF exams and corresponding solutions in output directory
## (with the header used to set a custom Date and ID for the exam)
exams2pdf(myexam, n = 3, name = c("pdf-exam", "pdf-solution"),
  encoding = "UTF-8",
  dir = "output",
  edir = "exercises",
  template = c("templates/exam.tex", "templates/solution.tex"),
  header = list(
    Date = "2019-03-14",
    ID = function(i) formatC(i, width = 5, flag = "0")
  ))


## ----------------------------------------------------------------------------------
library("exams")
setwd("~/GitHub/statistics/materials")

wk1stats <- c('w01001stats.Rmd', 'w01002stats.Rmd', 'w01003stats.Rmd', 'w01004stats.Rmd', 'w01005stats.Rmd', 'w01006stats.Rmd', 'w01007stats.Rmd', 'w01008stats.Rmd', 'w01009stats.Rmd', 'w01010stats.Rmd', 'w01011stats.Rmd', 'w01069stats.Rmd')
wk1R <- c('w01012R.Rmd', 'w01013R.Rmd', 'w01014R.Rmd', 'w01015R.Rmd', 'w01016R.Rmd', 'w01017R.Rmd', 'w01018R.Rmd', 'w01019R.Rmd', 'w01020R.Rmd', 'w01021R.Rmd', 'w01022R.Rmd', 'w01023R.Rmd', 'w01024R.Rmd', 'w01032R.Rmd', 'w01033R.Rmd', 'w01034R.Rmd', 'w01035R.Rmd', 'w01036R.Rmd', 'w01037R.Rmd')
wk1vars <- c('w01038vars.Rmd', 'w01039vars.Rmd', 'w01040vars.Rmd', 'w01041vars.Rmd', 'w01042vars.Rmd', 'w01043vars.Rmd', 'w01044vars.Rmd', 'w01045vars.Rmd', 'w01046vars.Rmd', 'w01047vars.Rmd', 'w01048vars.Rmd', 'w01049vars.Rmd', 'w01050vars.Rmd', 'w01051vars.Rmd', 'w01052vars.Rmd', 'w01053vars.Rmd', 'w01054vars.Rmd', 'w01070vars.Rmd', 'w01071vars.Rmd', 'w01072vars.Rmd', 'w01073vars.Rmd')
wk1valid <- c('w01025valid.Rmd', 'w01026valid.Rmd', 'w01027valid.Rmd', 'w01028valid.Rmd', 'w01029valid.Rmd', 'w01030valid.Rmd', 'w01031valid.Rmd', 'w01082valid.Rmd', 'w01083valid.Rmd', 'w01084valid.Rmd', 'w01085valid.Rmd', 'w01086valid.Rmd', 'w01087valid.Rmd', 'w01088valid.Rmd', 'w01089valid.Rmd', 'w01090valid.Rmd', 'w01091valid.Rmd', 'w01092valid.Rmd', 'w01093valid.Rmd', 'w01094valid.Rmd')
wk1LoM <- c('w01055LoM.Rmd', 'w01056LoM.Rmd', 'w01057LoM.Rmd', 'w01058LoM.Rmd', 'w01059LoM.Rmd', 'w01060LoM.Rmd', 'w01061LoM.Rmd', 'w01062LoM.Rmd', 'w01063LoM.Rmd', 'w01064LoM.Rmd', 'w01065LoM.Rmd', 'w01066LoM.Rmd', 'w01067LoM.Rmd', 'w01068LoM.Rmd', 'w01074LoM.Rmd', 'w01075LoM.Rmd', 'w01076LoM.Rmd', 'w01077LoM.Rmd', 'w01078LoM.Rmd', 'w01079LoM.Rmd', 'w01080LoM.Rmd', 'w01081LoM.Rmd', 'w01095LoM.Rmd', 'w01096LoM.Rmd', 'w01097LoM.Rmd', 'w01098LoM.Rmd', 'w01099LoM.Rmd', 'w01100LoM.Rmd', 'w01101LoM.Rmd', 'w01102LoM.Rmd', 'w01103LoM.Rmd', 'w01104LoM.Rmd', 'w01105LoM.Rmd', 'w01106LoM.Rmd', 'w01107LoM.Rmd', 'w01108LoM.Rmd', 'w01109LoM.Rmd', 'w01110LoM.Rmd', 'w01111LoM.Rmd', 'w01112LoM.Rmd', 'w01113LoM.Rmd', 'w01114LoM.Rmd', 'w01115LoM.Rmd', 'w01116LoM.Rmd', 'w01117LoM.Rmd', 'w01118LoM.Rmd', 'w01119LoM.Rmd', 'w01120LoM.Rmd', 'w01121LoM.Rmd', 'w01122LoM.Rmd', 'w01123LoM.Rmd', 'w01124LoM.Rmd', 'w01125LoM.Rmd', 'w01126LoM.Rmd')

myexam <- c(sample(wk1stats,2,replace=FALSE),sample(wk1R,3,replace=FALSE),sample(wk1vars,3,replace=FALSE),sample(wk1valid,3,replace=FALSE),sample(wk1LoM,9,replace=FALSE))

exams2pdf(myexam, n = 3, name = c("Week 1 Quiz", "Week 1 Solutions"),
          encoding = "UTF-8",
          dir = "~/GitHub/statistics/quizzes",
          edir = "R exams exercises",
          template = c("R exams templates/exam.tex", "R exams templates/solution.tex"),
          header = list(
            Date = "2019-03-14",
            ID = function(i) formatC(i, width = 5, flag = "0")
          ))


single <- c("w01035R.Rmd")
exams2pdf(single, n=1,name = c("Week 1 Quiz", "Week 1 Solutions"),
          encoding = "UTF-8",
          dir = "~/GitHub/statistics/quizzes",
          edir = "R exams exercises",
          template = c("R exams templates/exam.tex", "R exams templates/solution.tex"),
          header = list(
            Date = "2019-03-14",
            ID = function(i) formatC(i, width = 5, flag = "0")
          ))
