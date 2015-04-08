print(ls())

args <- commandArgs(TRUE) 

print(args)


if(length(args)!=0){ # CSF hands over a process number, if there is a queue variable we are in CONDOR, otherwise we work locally; Note: in CSF the varaiables are already in the right shape
	for(i in 1:length(args)){
		eval(parse(text=args[[i]]))
	}
}
	
	print(ls())
	print(PAYDIS)
	print(DEGREE)
	print(COMP)
	
	any(installed.packages()[,1]=='igraph')
	
	if(!any(installed.packages()[,1]=='igraph')){
	.libPaths(c("Rpackages", .libPaths()))
	install.packages("igraph", lib="Rpackages", dependencies="Depends",quiet = TRUE)
	}
	
	library(igraph, quietly = TRUE)

	any(installed.packages()[,1]=='igraph')

DF<-c(queue)

if(!file.exists('output')) dir.create(path = 'output'); setwd('output')
if(length(queue)!=0) { # BEGIN CONDOR
	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree,setup$graphType,queue, sep="_"), sep='/'))
} else { # END CONDOR
	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree, sep="_"), sep='/'))
}
