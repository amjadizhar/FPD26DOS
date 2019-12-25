* program: ACCBAL.prg
* Programmer: AMJAD IZHAR
* WRITTEN ON 23-12-2000
*************************

DO RepBal


****************
PROCEDURE RepBal
****************
set cent on
set date to brit
public mdate
mdate = {  /  /  }

clear
@ 10,5 say "ENTER the Last Date of the month for which you want BALANCES" GET mdate pict "@E"
READ

SELECT c1,c2,c3,;
	date,doc_type,doc_no,cr_dr,;
	amount AS "Cr_amount",;
	000000000000.00 AS "amount",;
	disc;
FROM tran;
WHERE cr_dr="CR" AND date <= mdate;
INTO DBF master.dbf

CLOSE ALL

USE master.dbf
APPEND FROM tran FOR cr_dr="DR" AND date <=mdate

SELECT c1,c2,c3,;
	SUM(amount) AS "DR",;
	SUM(cr_amount) AS "CR",;
	sum(-amount) + sum(cr_amount) AS "BAL";
FROM master;
GROUP BY c1,c2,c3;
ORDER BY c1,c2,c3;
INTO CURSOR rep10

SELECT c1,c2,c3,;
	dr,cr,bal;
FROM rep10;
WHERE bal <> 0 


RETURN
**********************