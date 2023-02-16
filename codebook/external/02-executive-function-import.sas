* Written by R;
*  foreign::write.foreign(executive.function.long, datafile = paste0("external/",  ;

DATA  rdata ;
INFILE  "external/02-executive-function.csv" 
     DSD 
     LRECL= 28 ;
INPUT
 id
 wave
 dlpfc
;
RUN;
