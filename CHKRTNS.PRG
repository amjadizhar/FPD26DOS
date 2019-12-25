* Revised again on : 18-01-2001


SET DATE TO BRITISH
SDATE = {01/07/96}
LDATE = {07/10/96}
MC1 = 59
MC2 = 70
MC3 = 2

SELECT SUM(dr_amount) AS "mTdr",;
	   SUM(cr_amount) AS "mTcr";
FROM master;
WHERE date>=sdate.and.date<=ldate.and.c1=mc1.and.c2=mc2.and.c3=mc3;
INTO CURSOR sumdrcr