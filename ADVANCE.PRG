PUBLIC mmcode,myear

mmcode = 0
myear = 0


USE attend
STORE mcode TO mmcode
STORE year TO myear



SELECT STR(deptcode,2,0)+" -"+STR(empno,3,0) AS "CodAdv",;
	   sum(advance) AS "TAdvDed",;
	   deptcode,;
	   empno;
FROM deduct;
WHERE advance <> 0;
ORDER BY CodAdv;
GROUP BY CodAdv;
INTO CURSOR advded


SELECT STR(deptcode,2,0)+" -"+STR(empno,3,0) AS "CodCmnth",;
	   sum(advance) AS "CmDed",;
	   deptcode,;
	   empno;
FROM deduct;
WHERE advance <> 0 AND mcode = mmcode;
ORDER BY CodCmnth;
GROUP BY CodCmnth;
INTO CURSOR adcmnth


