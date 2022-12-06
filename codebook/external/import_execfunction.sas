* Written by R;
*  foreign::write.foreign(canonical.long, datafile = paste0("external/",  ;

DATA  rdata ;
INFILE  "external/execfunction.txt" 
     DSD 
     LRECL= 28 ;
INPUT
 id
 wave
 dlpfc
;
RUN;
