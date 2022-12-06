* Written by R;
*  foreign::write.foreign(executive.function.long, datafile = paste0("external/",  ;

DATA  rdata ;
INFILE  "external/executive-function.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 id
 wave
 dlpfc
;
RUN;
