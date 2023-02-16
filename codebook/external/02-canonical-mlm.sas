options nocenter nodate nonumber linesize=max pagesize=max formdlim=' '; title;
proc datasets lib=work kill; run;

data  executive;
infile  "\path\to\file\02-executive-function.csv" 
     dsd 
     lrecl= 28 ;
input id wave dlpfc;
run;
proc print data=executive; run;

/* Canonical Multilevel Model */
proc mixed data=executive method=reml covtest cl order=data noclprint;
	class id;
	model dlpfc = wave /solution ddfm=bw;
	random intercept wave / type=un subject=id gcorr;
run;
