* Written by R;
*  write.foreign(canonical.long, datafile = paste0(datadir, filename,  ;

DATA  rdata ;
INFILE  "~/Dropbox/Professional/projects/quant/primer/github/1.data/01-canonical.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 id
 wave
 dlpfc
;
RUN;
