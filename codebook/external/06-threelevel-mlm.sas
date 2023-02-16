options nocenter nodate nonumber linesize=max pagesize=max formdlim=' '; title;
proc datasets lib=work kill; run;

data achieve;
infile  "\path\to\data\06-achieve.csv" 
     dsd 
     lrecl= 30 ;
input site school id wave male math sci;
run;
proc print data=achieve; run;

/* Three-Level Model */
proc mixed data=achieve method=ml covtest noclprint maxiter=100;
	class id school;
	model sci = wave / solution ddfm=bw notest;
	random intercept wave / subject=id(school) type=un g gcorr;
	random intercept wave / subject=school type=un gcorr;
run;
