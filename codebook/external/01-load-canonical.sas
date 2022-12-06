* Written by R;
*  write.foreign(canonical.long, datafile = paste0("external/",  ;

DATA  rdata ;
INFILE  "external/01-canonical.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 id
 wave
 dlpfc
;
RUN;
