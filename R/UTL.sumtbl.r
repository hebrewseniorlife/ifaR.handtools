#' Summary Statistics Table
#' 
#' @description This function will generate a common statistical summary table after you select 
#' a dataset, select targeting variables, select grouping variables, select whether you want 
#' number, mean, standard deviation and quantile. 
#' 
#' @param dataset Select the dataset you are working on
#' @param variable Select the variables you want to analyze
#' @param grp.by Select grouping variables
#' @param n Whether the number of non-missing/null values will be displayed
#' @param mu Whether the value of mean will be calculated
#' @param s Whether the value of standard deviation will be calculated
#' @param q A list of quantiles
#' @param q.type Quantile type
#' @param round.N Round digits
#' 
#' @examples
#' library(data.table)
#' library(ifaR.handtool)
#' dt<-data.table(grp=rep(c("Control", "Treatment"), each=50),
#'                time=rep(c("Base", "Follow", "Base", "Follow"), each=25),
#'                age=rnorm(100, mean=65, sd=10),bmi=rnorm(100, mean=28, sd=4),
#'                leanmass=rnorm(100, mean=65, sd=6))
#' dt$leanmass[95]<-NA
#' 
#' sumtbl(dt, c("age", "bmi"), c("grp"), n=F, mu=T, s=T, q=c(.25, .5, .75))
#' sumtbl(dt, c("age", "bmi", "leanmass"), c("grp", "time"), n=T, mu=T, s=T, q=c(.25, .5, .75))
#' 
#' @export
sumtbl<-function (dataset, variable, grp.by, n=F, mu=F, s=F, q=NULL, q.type=8, mdn=F, mnm=F, sem=F, round.N=3) {
  dt.local<-as.data.table(dataset)
  raw.table<-dt.local[, lapply(.SD, sumstat, n=n, mu=mu, s=s, q=q, q.type=q.type, mdn=mdn, mnm=mnm, sem=sem, round.N=round.N), by=grp.by, .SDcols=variable]
  return(raw.table)
}