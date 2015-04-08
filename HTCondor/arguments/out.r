
R version 3.0.1 (2013-05-16) -- "Good Sport"
Copyright (C) 2013 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> print(ls())
character(0)
> 
> args <- commandArgs(TRUE) 
> 
> print(args)
[1] "PAYDIS='gamma'"     "COMP=TRUE"          "queue=1+1"         
[4] "DEGREE=c(2,4,6,20)"
> 
> 
> if(length(args)!=0){ # CSF hands over a process number, if there is a queue variable we are in CONDOR, otherwise we work locally; Note: in CSF the varaiables are already in the right shape
+ 	for(i in 1:length(args)){
+ 		eval(parse(text=args[[i]]))
+ 	}
+ }
> 	
> 	print(ls())
[1] "COMP"   "DEGREE" "PAYDIS" "args"   "i"      "queue" 
> 	print(PAYDIS)
[1] "gamma"
> 	print(DEGREE)
[1]  2  4  6 20
> 	print(COMP)
[1] TRUE
> 	
> 
> DF<-c(queue)
> 
> if(!file.exists('output')) dir.create(path = 'output'); setwd('output')
> if(length(queue)!=0) { # BEGIN CONDOR
+ 	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree,setup$graphType,queue, sep="_"), sep='/'))
+ } else { # END CONDOR
+ 	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree, sep="_"), sep='/'))
+ }
