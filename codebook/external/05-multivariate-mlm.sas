options nocenter nodate nonumber linesize=max pagesize=max formdlim=' '; title;
proc datasets lib=work kill; run;

proc format;
value dv_factr 
     1 = "DLPFC" 
     2 = "EF";
data  multivar;
infile  "\path\to\data\multivar-long.csv" 
     dsd 
     lrecl= 105;
input id sex tx wave dlpfc ef age dlpfc_lag dv ef_dummy dlpfc_dummy dv_factor;
label dlpfc_lag = "dlpfc.lag";
format dv_factor dv_factr.;
waveclass = wave + 1;
keep id dv wave waveclass dv dv_factor ef_dummy dlpfc_dummy;
run;
proc print data=multivar; run;

/* Multivariate Model */
proc mixed data=multivar method=ml covtest noclprint maxiter=100;
	class id dv_factor waveclass;
	model dv = ef_dummy ef_dummy*wave dlpfc_dummy dlpfc_dummy*wave / solution ddfm=bw notest;
	repeated dv_factor / group=waveclass type=un subject=id rcorr=16; 	
	random ef_dummy ef_dummy*wave dlpfc_dummy dlpfc_dummy*wave / type=un subject=id g gcorr;
run;
