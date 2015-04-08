print(args())

args <- commandArgs(TRUE) 
if( (csf<-(length(args)!=0)) | (cnd<-(!any(installed.packages()[,1]=='igraph')))){
	
	print(args())
	print(csf)
	print(cnd)
	
	### CSF
	if(csf){
		for(i in 1:length(args)){
			eval(parse(text=args[[i]]))
		}
	}
	
	### HTCONDOR:
	if(cnd){
		DEGREE<-as.numeric(unlist(strsplit(Sys.getenv(c('DEGREE')),split=' ')))
		queue<-as.numeric(unlist(strsplit(Sys.getenv(c('queue')),split=' '))) + 1
		COMP<-as.logical(unlist(strsplit(Sys.getenv(c('COMP')),split=' ')))
		PAYDIS<-as.character(unlist(strsplit(Sys.getenv(c('PAYDIS')),split=' ')))
		## now load packages into session
		.libPaths(c("Rpackages", .libPaths()))
		install.packages("igraph", lib="Rpackages", dependencies="Depends",quiet = TRUE)
	}
	
	print(DEGREE)
	print(queue)
	print(COMP)
	print(PAYDIS)
	
	library(igraph, quietly = TRUE)
	
#	if(file.exists('methods.tar')) untar(tarfile="methods.tar", exdir=".")
#	setwd('./methods')
#	l <- lapply(list.files()), source)
#	setwd('../')
#	if(file.exists('methods.tar'))	unlink('methods',recursive=TRUE)
	
}

DF<-c(queue)

if(!file.exists('output')) dir.create(path = 'output'); setwd('output')
if(length(queue)!=0) { # BEGIN CONDOR
	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree,setup$graphType,queue, sep="_"), sep='/'))
} else { # END CONDOR
	save(DF, file=paste(paste(format(Sys.time(), '%y%m%d'),'degree',setup$degree, sep="_"), sep='/'))
}
