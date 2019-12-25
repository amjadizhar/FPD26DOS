CLEAR
CLOSE DATA

PUBLIC mmcode, myear
mmcode = 5
myear = 2014

DEFINE WINDOW dedbrow FROM 1,1 TO 20,120 FLOAT GROW



SELECT 1
USE deduct EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno
SET FILTER TO
SET FILTER TO mcode = mmcode AND year = myear
GOTO TOP

SELECT 2
USE employee EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno

SELECT 3
USE month EXCLUSIVE
INDEX ON mcode TAG mcode
SET ORDER TO mcode

SELECT 4
USE instded EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno

SELECT 5
USE salary EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
INDEX ON STR(deptcode)+STR(empno) TAG empno2
SET ORDER TO empno

SELECT 6
USE saldtail EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
INDEX ON STR(deptcode)+STR(empno) TAG empno2
SET ORDER TO empno
SET FILTER TO
SET FILTER TO mcode = mmcode AND year = myear

SELECT 7
USE salcode EXCLUSIVE
INDEX ON salcode TAG salcode
SET ORDER TO salcode

SELECT 8
USE advded EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno

SELECT 9
USE adcmnth EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno

SELECT 10
USE advance EXCLUSIVE
INDEX ON STR(deptcode)+STR(empno)+STR(mcode)+STR(year) TAG empno
SET ORDER TO empno

SELECT 5
SET RELATION TO salcode INTO salcode


SELECT 1
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO employee ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO instded ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO salary ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO saldtail ADDITIVE
SET RELATION TO mcode INTO month ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO advded ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO adcmnth ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO advance ADDITIVE


BROWS FIELDS;
	Eno = RIGHT(str(deptcode),2)+"-"+;
		RIGHT(str(empno),3) :R :H = "Code",;
	Ename = employee.name :H = "Employee Name",;
	advance :V = chkadv() :H = "Inst.Adv" :P = "@Z",;
	midadv :V = ChkMidAdv() :F :H = "Mid.Adv" :P = "@Z",;
	pfund :H = "P.Fund" :P = "@Z",;
	other :V = ChkOther() :H = "Other" :P = "@Z",;
	itax :H = "I.Tax" :P = "@Z";
	WINDOW dedbrow;
	PREF brded1;
	WHEN ShowSal();
	TITLE "Data Input for Deductions"+"  "+RTRIM(month.month)+;
		  ","+ALLTRIM(str(year));
	COLOR RGB(0,0,0,255,255,0);
	FONT "Arial",10


***************************
PROCEDURE chkadv   && Brows field advance Valid clause
***************************

DO CASE

CASE advance > instded.inst
	?? chr(7)
	WAIT WINDOW "Invalid Amount"
	REPLACE advance WITH instded.inst
CASE advance = instded.inst
	REPLACE advance WITH instded.inst
ENDCASE


RETURN .T.
***************************

***************************
PROCEDURE ChkMidAdv
***************************
PUBLIC GrossPay, DStrength
GrossPay = 0
DStrength = 0

IF salary.mpay = .T.

GrossPay = salary.basic+salary.hrent+salary.convy+salary.medical+;
		   salary.cma+salary.pma+salary.other+salary.special
ENDIF

IF salary.mpay = .F. AND salary.wrdaily = .T. ;
   AND NOT EMPTY(salary.dwrate)

GrossPay = (salary.dwrate * saldtail.days) +;
		   (salary.otrated * saldtail.othrs)+;
	       (saldtail.bonday * salary.dwrate)

ENDIF

IF salary.mpay = .F. AND salary.wrdaily = .F. AND EMPTY(salary.dwrate) ;
	AND NOT EMPTY(salary.dwratem)
   
GrossPay = salary.dwratem

ENDIF




DStrength = GrossPay - (advance+pfund+itax+other)

IF midadv >  DStrength
	?? chr(7)
	WAIT WINDOW "You can only Deduct amount upto Rs."+ALLTRIM(STR(DStrength))
	REPLACE midadv WITH 0
	RETURN .F.

ELSE
RETURN .T.
ENDIF

*****************************************************
PROCEDURE ChkOther && Valid Clause for Other in Brows
*****************************************************

GrossPay = salary.basic+salary.hrent+salary.convy+salary.medical+;
		   salary.cma+salary.pma+salary.other+salary.special+;
		   (salary.dwrate*saldtail.days)+(salary.otrated*saldtail.othrs)+;
		   salary.dwratem

DStrength = GrossPay - (advance+pfund+itax+midadv)

IF other >  DStrength
	
	?? chr(7)
	WAIT WINDOW "You can only Deduct amount upto Rs."+ALLTRIM(STR(DStrength))
	RETURN .F.

ENDIF

RETURN
**********************************************************


******************
PROCEDURE ShowSal
******************


DO CASE

CASE salary.mpay

GrossPay = ROUND(salary.basic / month.mdays * saldtail.days,0)+;
		   ROUND(salary.hrent / month.mdays * saldtail.days,0)+;
		   ROUND(salary.convy / month.mdays * saldtail.days,0)+;
		   ROUND(salary.medical / month.mdays * saldtail.days,0)+;
		   ROUND(salary.cma / month.mdays * saldtail.days,0)+;
		   ROUND(salary.pma / month.mdays * saldtail.days,0)+;
		   ROUND(salary.other / month.mdays * saldtail.days,0)+;
		   ROUND(salary.special / month.mdays * saldtail.days,0)+;
		   ROUND(salary.dwratem / month.mdays * saldtail.days,0)

CASE NOT salary.mpay AND salary.dwrate <> 0

GrossPay = ROUND(salary.dwrate*saldtail.days,0)+ROUND(salary.otrated*saldtail.othrs,0)+;
		   salary.dwratem+(saldtail.bonday * salary.dwrate)


CASE NOT salary.mpay AND salary.dwratem <> 0

GrossPay = ROUND(salary.dwratem / month.mdays * saldtail.days,0)+ROUND(salary.otrated*saldtail.othrs,0)
		   

ENDCASE


IF _DOS
@ 1,0 TO 8,76 CLEAR
ENDIF


IF _WINDOWS
@ 0,0 TO 100,200 CLEAR
ENDIF



IF _DOS
@ 1,0 FILL TO 8,76 COLOR GR+/RB
ENDIF


DO CASE

CASE salary.mpay AND salary.working AND salary.salcode = 0

	IF _DOS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name+SPACE(33);
		COLOR W+/R
	ENDIF


	IF _WINDOWS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name
		
	ENDIF


	IF _DOS
		@ 1,1 SAY "The employee is on Monthly Pay";
		COLOR GR+/RB
	ENDIF

	IF _WINDOWS
		@ 1,1 SAY "The employee is on Monthly Pay"
		
	ENDIF



	IF _DOS
		@ 2,1 SAY "The employee is Working";
		COLOR GR+/RB
		@ 3,1 SAY "No Salary Sheet Code allocated";
		COLOR GR+/RB
	ENDIF
	

	IF _WINDOWS
		@ 2,1 SAY "The employee is Working"
		
		@ 3,1 SAY "No Salary Sheet Code allocated"
		
	ENDIF

	

CASE salary.mpay AND NOT salary.working AND salary.salcode = 0

	IF _DOS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name
		
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name
		
	ENDIF


	IF _DOS
		@ 1,1 SAY "The employee is on Monthly Pay";
		COLOR GR+/RB
	ENDIF


	IF _WINDOWS
		@ 1,1 SAY "The employee is on Monthly Pay"
		
	ENDIF


	IF _DOS
		@ 2,1 SAY "The employee is Not Working";
		COLOR GR+/RB
	ENDIF
	

	IF _WINDOWS
		@ 2,1 SAY "The employee is Not Working"
		
	ENDIF



	IF _DOS
		@ 3,1 SAY "No Salary Sheet Code allocated";
		COLOR GR+/RB
	ENDIF

	IF _WINDOWS
		@ 3,1 SAY "No Salary Sheet Code allocated"
		
	ENDIF



CASE salary.mpay AND NOT salary.working AND salary.salcode <> 0



	IF _DOS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name+SPACE(33);
		COLOR W+/R
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name
		
	ENDIF

	IF _DOS
		@ 1,1 SAY "The employee is on Monthly Pay";
		COLOR GR+/RB
	ENDIF
	
	IF _WINDOWS
		@ 1,1 SAY "The employee is on Monthly Pay"
		
	ENDIF

	IF _DOS
		@ 2,1 SAY "The employee is Not Working";
		COLOR GR+/RB
	ENDIF
	
	IF _WINDOWS
		@ 2,1 SAY "The employee is Not Working"
		
	ENDIF

	IF _DOS
		@ 3,1 SAY "Salary Sheet Code allocated:  "+;
		ALLTRIM(STR(salcode.salcode))+"-"+salcode.descrip;
		COLOR GR+/RB
	ENDIF
	
	IF _WINDOWS
		@ 3,1 SAY "Salary Sheet Code allocated:  "+;
		ALLTRIM(STR(salcode.salcode))+"-"+salcode.descrip
		
	ENDIF



CASE salary.mpay AND salary.working AND salary.salcode <> 0
		
	IF _DOS
*		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
*		"."+employee.name+" "+;
*		salcode.descrip+SPACE(6) COLOR W+/R
	ENDIF
	
	IF _WINDOWS
		@ 0,0 SAY " Salary Calculation: "+employee.salutation+;
		"."+employee.name+" "+;
		salcode.descrip+SPACE(42);
		COLOR RGB(255,255,0,255,0,0)
	ENDIF

	
	IF _DOS
		IF salary.basic <> 0
		@ 1,1 SAY "Basic" COLOR GR+/RB
		@ 2,1 SAY ROUND(salary.basic / month.mdays * saldtail.days,0);
		          PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF
	
	IF _WINDOWS
		IF salary.basic <> 0
		@ 1,1 SAY "Basic"
		@ 2,1 SAY ROUND(salary.basic / month.mdays * saldtail.days,0);
		          PICT "9999"
		ENDIF
	ENDIF



	IF _DOS
		IF salary.hrent <> 0
		@ 1,7 SAY "H.R." COLOR GR+/RB
		@ 2,6 SAY "+" COLOR GR+/RB
		@ 2,7 SAY ROUND(salary.hrent / month.mdays * saldtail.days,0);
				  PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _WINDOWS
		IF salary.hrent <> 0
		@ ROW()-1,COL()+2 SAY "H.R."
		@ ROW()+1,COL()-5 SAY ROUND(salary.hrent / month.mdays * saldtail.days,0);
				  PICT "9999"
		ENDIF
	ENDIF


	IF _DOS
		IF salary.convy <> 0
		@ 1,14 SAY "Conv" COLOR GR+/RB
		@ 2,13 SAY "+" COLOR GR+/RB
		@ 2,14 SAY ROUND(salary.convy / month.mdays * saldtail.days,0);
		           PICT "9999" COLOR GR+/RB
		ENDIF

	ENDIF

	IF _WINDOWS
		IF salary.convy <> 0
		@ ROW()-1,COL()+2 SAY "Conv"
		@ ROW()+1,COL()-6 SAY ROUND(salary.convy / month.mdays * saldtail.days,0);
		           PICT "9999"
		ENDIF

	ENDIF


	IF _DOS
		IF salary.medical <> 0
		@ 1,19 SAY "Med." COLOR GR+/RB
		@ 2,18 SAY "+" COLOR GR+/RB
		@ 2,19 SAY ROUND(salary.medical / month.mdays * saldtail.days,0);
		           PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.medical <> 0
		@ ROW()-1,COL()+2 SAY "Med."
		@ ROW()+1,COL()-6 SAY ROUND(salary.medical / month.mdays * saldtail.days,0);
		           PICT "9999"
		ENDIF
	ENDIF


	IF _DOS
		IF salary.cma <> 0
		@ 1,24 SAY "Cma" COLOR GR+/RB
		@ 2,23 SAY "+" COLOR GR+/RB
		@ 2,24 SAY ROUND(salary.cma / month.mdays * saldtail.days,0);
				   PICT "9999" COLOR GR+/RB
		ENDIF

	ENDIF

	IF _WINDOWS
		IF salary.cma <> 0
		@ ROW()-1,COL()+3 SAY "Cma"
		@ ROW()+1,COL()-4 SAY ROUND(salary.cma / month.mdays * saldtail.days,0);
				   PICT "9999"
		ENDIF

	ENDIF



	IF _DOS
		IF salary.pma <> 0
		@ 1,29 SAY "Pma" COLOR GR+/RB
		@ 2,28 SAY "+" COLOR GR+/RB
		@ 2,29 SAY ROUND(salary.pma / month.mdays * saldtail.days,0);
				   PICT "9999" COLOR GR+/RB
		ENDIF
		
	ENDIF

	IF _WINDOWS
		IF salary.pma <> 0
		@ ROW()-1,COL()+2 SAY "Pma"
		@ ROW()+1,COL()-4 SAY ROUND(salary.pma / month.mdays * saldtail.days,0);
				   PICT "9999"
		ENDIF
		
	ENDIF



	IF _DOS
		IF salary.other <> 0
		@ 1,34 SAY "Oth." COLOR GR+/RB
		@ 2,33 SAY "+" COLOR GR+/RB
		@ 2,34 SAY ROUND(salary.other / month.mdays * saldtail.days,0);
				   PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.other <> 0
		@ ROW()-1,COL()+2 SAY "Oth."
		@ ROW()+1,COL()-5 SAY ROUND(salary.other / month.mdays * saldtail.days,0);
				   PICT "9999"
		ENDIF
	ENDIF

	IF _DOS
		IF salary.special <> 0
		@ 1,39 SAY "Spec" COLOR GR+/RB
		@ 2,38 SAY "+" COLOR GR+/RB
		@ 2,39 SAY ROUND(salary.special / month.mdays * saldtail.days,0);
				   PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.special <> 0
		@ ROW()-1,COL()+2 SAY "Spec"
		@ ROW()+1,COL()-5 SAY ROUND(salary.special / month.mdays * saldtail.days,0);
				   PICT "9999"
		ENDIF
	ENDIF


	IF _DOS
		IF GrossPay <> 0
		@ 1,46 SAY "Gross" COLOR GR+/RB
		@ 2,44 SAY "=" COLOR GR+/RB
		@ 2,46 SAY GrossPay PICT "99,999" COLOR GR+/RB                          
		ENDIF
	ENDIF
	

	IF _WINDOWS
		IF GrossPay <> 0
		@ ROW()-1,COL()+9 SAY "Gross"
		@ ROW()+1,COL()-11 SAY "="
		@ ROW(),COL()+3 SAY GrossPay PICT "99,999"
		ENDIF
	ENDIF



	IF _DOS
		@ 1,55 SAY "Days: "+;
			       ALLTRIM(STR(saldtail.days));
			       COLOR GR+/RB

		@ 2,55 SAY "Net Pay: " COLOR GR+/RB
		@ 2,64 SAY GrossPay - (advance+midadv+other+pfund+itax);
				   PICT "99,999";
				   COLOR GR+/RB
	ENDIF


	IF _WINDOWS
		@ ROW()-1,COL()+9 SAY "Days: "+;
			       ALLTRIM(STR(saldtail.days))
			       

		@ ROW()+1,COL()-9 SAY "Net Pay: "
		@ ROW(),COL()+2 SAY GrossPay - (advance+midadv+other+pfund+itax);
				   PICT "99,999"
				   
	ENDIF


	IF _DOS
		IF advded.deptcode <> 0
			@ 3,55 SAY "Adv.Bal: "
			
			@ 3,64 SAY advance.advamt - advded.tadvded;
				   PICT "99,999";
				   COLOR GR+/RB
		ENDIF

	ENDIF


	IF _WINDOWS
		IF advded.deptcode <> 0
			@ 3,55 SAY "Adv.Bal: "
			
			@ 3,64 SAY advance.advamt - advded.tadvded;
				   PICT "99,999"
				   
		ENDIF

	ENDIF


	IF _DOS
		IF saldtail.othrs <> 0 
			@ 3,1 SAY " Over Time Calculation"+space(20) COLOR W/G+
		ENDIF
	ENDIF
	
	IF _WINDOWS
		IF saldtail.othrs <> 0 
			@ 3,1 SAY " Over Time Calculation"
		ENDIF
	ENDIF


	IF _DOS
		IF saldtail.othrs <> 0 
		@ 4,1 SAY "OT Hrs" COLOR GR+/RB
		@ 5,1 SAY saldtail.othrs PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF
	
	IF _WINDOWS
		IF saldtail.othrs <> 0 
		@ 4,1 SAY "OT Hrs"
		@ 5,1 SAY saldtail.othrs PICT "999.99"
		ENDIF
	ENDIF

	IF _DOS
		IF salary.otrated <> 0 .AND. saldtail.othrs <> 0
		@ 4,12 SAY "OT Rate" COLOR GR+/RB
		@ 5,10 SAY "x" COLOR GR+/RB
		@ 5,12 SAY salary.otrated PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.otrated <> 0 .AND. saldtail.othrs <> 0
		@ 4,12 SAY "OT Rate"
		@ 5,10 SAY "x"
		@ 5,12 SAY salary.otrated PICT "999.99"
		ENDIF
	ENDIF


	IF _DOS
		IF saldtail.othrs <> 0 .AND. salary.otrated <> 0
		@ 4,46 SAY "Tot.OT" COLOR GR+/RB
		@ 5,44 SAY "=" COLOR GR+/RB
		@ 5,46 SAY ROUND(salary.otrated * saldtail.othrs,0);
			 PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.othrs <> 0 .AND. salary.otrated <> 0
		@ 4,46 SAY "Tot.OT"
		@ 5,44 SAY "="
		@ 5,46 SAY ROUND(salary.otrated * saldtail.othrs,0);
			 PICT "99,999"
		ENDIF
	ENDIF

	IF _DOS
		IF (advance+midadv+other+pfund+itax) <> 0
			@ 6,1 SAY " Deductions"+space(31) COLOR W/G+
		ENDIF
	ENDIF

	IF _WINDOWS
		IF (advance+midadv+other+pfund+itax) <> 0
			@ 6,1 SAY " Deductions"
		ENDIF
	ENDIF


	IF _DOS
		IF advance <> 0
		@ 7,1 SAY "Inst.Adv" COLOR GR+/RB
		@ 8,1 SAY advance COLOR GR+/RB
		@ 8,8 SAY "+" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF advance <> 0
		@ 7,1 SAY "Inst.Adv"
		@ 8,1 SAY advance
		@ 8,8 SAY "+"
		ENDIF
	ENDIF


	IF _DOS
		IF midadv <> 0
		@ 7,11 SAY "Mid.Adv" COLOR GR+/RB
		@ 8,12 SAY midadv COLOR GR+/RB
			IF other <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		ENDIF
	ENDIF

	IF _WINDOWS
		IF midadv <> 0
		@ 7,11 SAY "Mid.Adv"
		@ 8,12 SAY midadv
			IF other <> 0
			@ 8,18 SAY "+"
			ENDIF
		ENDIF
	ENDIF



	IF _DOS
		IF pfund <> 0
		@ 7,20 SAY "P.Fund" COLOR GR+/RB
			IF midadv <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,21 SAY pfund COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF pfund <> 0
		@ 7,20 SAY "P.Fund"
			IF midadv <> 0
			@ 8,18 SAY "+"
			ENDIF
		@ 8,21 SAY pfund
		ENDIF
	ENDIF


	IF _DOS
		IF other <> 0
		@ 7,27 SAY "Other" COLOR GR+/RB
			IF pfund <> 0
			@ 8,25 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,26 SAY other COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF other <> 0
		@ 7,27 SAY "Other"
			IF pfund <> 0
			@ 8,25 SAY "+"
			ENDIF
		@ 8,26 SAY other
		ENDIF
	ENDIF


	IF _DOS
		IF itax <> 0
		@ 7,34 SAY "I.Tax" COLOR GR+/RB
		@ 8,32 SAY "+" COLOR GR+/RB
		@ 8,35 SAY itax COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF itax <> 0
		@ 7,34 SAY "I.Tax"
		@ 8,32 SAY "+"
		@ 8,35 SAY itax
		ENDIF
	ENDIF


	IF _DOS
		IF (advance+midadv+other+pfund+itax) <> 0
		@ 7,46 SAY "Tot.Ded" COLOR GR+/RB
		@ 8,44 SAY "=" COLOR GR+/RB
		@ 8,46 SAY (advance+midadv+other+pfund+itax);
			PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF (advance+midadv+other+pfund+itax) <> 0
		@ 7,46 SAY "Tot.Ded"
		@ 8,44 SAY "="
		@ 8,46 SAY (advance+midadv+other+pfund+itax);
			PICT "99,999"
		ENDIF
	ENDIF


	IF _DOS
		IF GrossPay <> 0
			@ 6,55 SAY " Net Payable Amount " COLOR W+/G
			@ 7,55 SAY " Rs." COLOR N/BG
			@ 7,59 SAY GrossPay;
			+ROUND(salary.otrated * saldtail.othrs,0);
			-(advance+midadv+other+pfund+itax) PICT "999,999" COLOR N/BG
			@ 7,66 SAY "         " COLOR N/BG
		ENDIF
	ENDIF

	IF _WINDOWS
		IF GrossPay <> 0
			@ 6,55 SAY " Net Payable Amount "
			@ 7,55 SAY " Rs."
			@ 7,59 SAY GrossPay;
			+ROUND(salary.otrated * saldtail.othrs,0);
			-(advance+midadv+other+pfund+itax) PICT "999,999" COLOR N/BG
			@ 7,66 SAY "         "
		ENDIF
	ENDIF


CASE NOT salary.mpay AND NOT salary.working AND salary.salcode = 0


	IF _DOS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name+SPACE(33);
		COLOR W/GR+
		@ 1,1 SAY "The employee is on Daily Wages";
		COLOR GR+/RB
		@ 2,1 SAY "The employee is not Working";
		COLOR GR+/RB
		@ 3,1 SAY "No Salary Sheet Code allocated";
		COLOR GR+/RB
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name
		
		@ 1,1 SAY "The employee is on Daily Wages"
		
		@ 2,1 SAY "The employee is not Working"
		
		@ 3,1 SAY "No Salary Sheet Code allocated"
		
	ENDIF


CASE NOT salary.mpay AND salary.working AND salary.salcode = 0

	IF _DOS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name+SPACE(33);
		COLOR W/GR+
		@ 1,1 SAY "The employee is on Daily Wages";
		COLOR GR+/RB
		@ 2,1 SAY "The employee is Working";
		COLOR GR+/RB
		@ 3,1 SAY "No Salary Sheet Code allocated";
		COLOR GR+/RB
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name
		
		@ 1,1 SAY "The employee is on Daily Wages"
		
		@ 2,1 SAY "The employee is Working"
		
		@ 3,1 SAY "No Salary Sheet Code allocated"
		
	ENDIF


CASE NOT salary.mpay AND NOT salary.working AND salary.salcode <> 0

	IF _DOS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name+SPACE(33);
		COLOR W/GR+
		@ 1,1 SAY "The employee is on Daily Wages";
		COLOR GR+/RB
		@ 2,1 SAY "The employee is Not Working";
		COLOR GR+/RB
		@ 3,1 SAY "Salary Sheet Code allocated:  "+;
		ALLTRIM(STR(salcode.salcode))+" "+salcode.descrip;
		COLOR GR+/RB
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name
		
		@ 1,1 SAY "The employee is on Daily Wages"
		
		@ 2,1 SAY "The employee is Not Working"
		
		@ 3,1 SAY "Salary Sheet Code allocated:  "+;
		ALLTRIM(STR(salcode.salcode))+" "+salcode.descrip
		
	ENDIF



CASE NOT salary.mpay AND salary.working AND salary.salcode <> 0

	IF _DOS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name+" "+salcode.descrip+space(7) COLOR W/GR+
	ENDIF

	IF _WINDOWS
		@ 0,0 SAY " Wages Calculation: "+employee.salutation+;
		"."+employee.name+" "+salcode.descrip
	ENDIF


	IF _DOS
		IF saldtail.days <> 0
		@ 1,2 SAY "Days" COLOR GR+/RB
		@ 2,0 SAY "(" COLOR GR+/RB
		@ 2,2 SAY saldtail.days PICT "99" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.days <> 0
		@ 1,2 SAY "Days" COLOR GR+/RB
		@ 2,0 SAY "(" COLOR GR+/RB
		@ 2,2 SAY saldtail.days PICT "99" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF salary.dwrate <> 0 .AND. saldtail.days <> 0
		@ 1,8 SAY "Rate" COLOR GR+/RB
		@ 2,6 SAY "x" COLOR GR+/RB
		@ 2,8 SAY salary.dwrate PICT "999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.dwrate <> 0 .AND. saldtail.days <> 0
		@ 1,8 SAY "Rate" COLOR GR+/RB
		@ 2,6 SAY "x" COLOR GR+/RB
		@ 2,8 SAY salary.dwrate PICT "999" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF salary.dwrate = 0 .AND. saldtail.days <> 0;
				 AND salary.dwratem <> 0
		@ 1,8 SAY "Wages" COLOR GR+/RB
		@ 2,6 SAY "  " COLOR GR+/RB
		@ 2,8 SAY ROUND(salary.dwratem / month.mdays * saldtail.days,0);
				  PICT "99999" COLOR GR+/RB
		@ 3,2 SAY "Fixed Monthly Lump Sum Wages Rate: ";
			 +ALLTRIM(STR(salary.dwratem)) COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF salary.dwrate = 0 .AND. saldtail.days <> 0;
				 AND salary.dwratem <> 0
		@ 1,8 SAY "Wages" COLOR GR+/RB
		@ 2,6 SAY "  " COLOR GR+/RB
		@ 2,8 SAY ROUND(salary.dwratem / month.mdays * saldtail.days,0);
				  PICT "99999" COLOR GR+/RB
		@ 3,2 SAY "Fixed Monthly Lump Sum Wages Rate: ";
			 +ALLTRIM(STR(salary.dwratem)) COLOR GR+/RB
		ENDIF
	ENDIF



	IF _DOS
		IF saldtail.days <> 0 .AND. salary.dwrate <> 0
		@ 1,13 SAY "Wages" COLOR GR+/RB
		@ 2,12 SAY "=" COLOR GR+/RB
		@ 2,13 SAY salary.dwrate * saldtail.days PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.days <> 0 .AND. salary.dwrate <> 0
		@ 1,13 SAY "Wages" COLOR GR+/RB
		@ 2,12 SAY "=" COLOR GR+/RB
		@ 2,13 SAY salary.dwrate * saldtail.days PICT "9999" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF saldtail.othrs <> 0 
		@ 1,22 SAY "OT Hrs" COLOR GR+/RB
		@ 2,18 SAY ")" COLOR GR+/RB
		@ 2,19 SAY "+" COLOR GR+/RB
		@ 2,20 SAY "(" COLOR GR+/RB
		@ 2,22 SAY saldtail.othrs PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.othrs <> 0 
		@ 1,22 SAY "OT Hrs" COLOR GR+/RB
		@ 2,18 SAY ")" COLOR GR+/RB
		@ 2,19 SAY "+" COLOR GR+/RB
		@ 2,20 SAY "(" COLOR GR+/RB
		@ 2,22 SAY saldtail.othrs PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF



	IF _DOS
		IF salary.otrated <> 0 .AND. saldtail.othrs <> 0
		@ 1,30 SAY "OT Rate" COLOR GR+/RB
		@ 2,29 SAY "x" COLOR GR+/RB
		@ 2,30 SAY salary.otrated PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _WINDOWS
		IF salary.otrated <> 0 .AND. saldtail.othrs <> 0
		@ 1,30 SAY "OT Rate" COLOR GR+/RB
		@ 2,29 SAY "x" COLOR GR+/RB
		@ 2,30 SAY salary.otrated PICT "999.99" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF saldtail.othrs <> 0 .AND. salary.otrated <> 0
		@ 1,38 SAY "Tot.OT" COLOR GR+/RB
		@ 2,37 SAY "=" COLOR GR+/RB
		@ 2,38 SAY ROUND(salary.otrated * saldtail.othrs,0) PICT "9999" COLOR GR+/RB
		@ 2,43 SAY ")" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.othrs <> 0 .AND. salary.otrated <> 0
		@ 1,38 SAY "Tot.OT" COLOR GR+/RB
		@ 2,37 SAY "=" COLOR GR+/RB
		@ 2,38 SAY ROUND(salary.otrated * saldtail.othrs,0) PICT "9999" COLOR GR+/RB
		@ 2,43 SAY ")" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF saldtail.bonday = 0
		@ 1,46 SAY "Gross" COLOR GR+/RB
		@ 2,44 SAY "=" COLOR GR+/RB
		@ 2,46 SAY GrossPay PICT "99,999" COLOR GR+/RB
		ELSE
		@ 1,45 SAY "Bns" COLOR GR+/RB
		@ 2,44 SAY "+" COLOR GR+/RB
		@ 2,45 SAY saldtail.bonday * salary.dwrate PICT "999" COLOR GR+/RB
		@ 1,50 SAY "Gross" COLOR GR+/RB
		@ 2,49 SAY "=" COLOR GR+/RB
		@ 2,50 SAY GrossPay PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF saldtail.bonday = 0
		@ 1,46 SAY "Gross" COLOR GR+/RB
		@ 2,44 SAY "=" COLOR GR+/RB
		@ 2,46 SAY GrossPay PICT "99,999" COLOR GR+/RB
		ELSE
		@ 1,45 SAY "Bns" COLOR GR+/RB
		@ 2,44 SAY "+" COLOR GR+/RB
		@ 2,45 SAY saldtail.bonday * salary.dwrate PICT "999" COLOR GR+/RB
		@ 1,50 SAY "Gross" COLOR GR+/RB
		@ 2,49 SAY "=" COLOR GR+/RB
		@ 2,50 SAY GrossPay PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF (advance+midadv+other+pfund+itax) <> 0
			@ 6,1 SAY " Deductions"+space(31) COLOR W/G+
		ENDIF
	ENDIF

	IF _WINDOWS
		IF (advance+midadv+other+pfund+itax) <> 0
			@ 6,1 SAY " Deductions"+space(31) COLOR W/G+
		ENDIF
	ENDIF


	IF _DOS
		IF advance <> 0
		@ 7,1 SAY "Inst.Adv" COLOR GR+/RB
		@ 8,1 SAY advance COLOR GR+/RB
		@ 8,8 SAY "+" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF advance <> 0
		@ 7,1 SAY "Inst.Adv" COLOR GR+/RB
		@ 8,1 SAY advance COLOR GR+/RB
		@ 8,8 SAY "+" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF midadv <> 0
		@ 7,11 SAY "Mid.Adv" COLOR GR+/RB
		@ 8,12 SAY midadv COLOR GR+/RB
			IF other <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		ENDIF
	ENDIF

	IF _WINDOWS
		IF midadv <> 0
		@ 7,11 SAY "Mid.Adv" COLOR GR+/RB
		@ 8,12 SAY midadv COLOR GR+/RB
			IF other <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		ENDIF
	ENDIF


	IF _DOS
		IF pfund <> 0
		@ 7,20 SAY "P.Fund" COLOR GR+/RB
			IF midadv <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,21 SAY pfund COLOR GR+/RB
		ENDIF
	ENDIF


	IF _WINDOWS
		IF pfund <> 0
		@ 7,20 SAY "P.Fund" COLOR GR+/RB
			IF midadv <> 0
			@ 8,18 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,21 SAY pfund COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF other <> 0
		@ 7,27 SAY "Other" COLOR GR+/RB
			IF pfund <> 0
			@ 8,25 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,26 SAY other COLOR GR+/RB
		ENDIF
	ENDIF


	IF _WINDOWS
		IF other <> 0
		@ 7,27 SAY "Other" COLOR GR+/RB
			IF pfund <> 0
			@ 8,25 SAY "+" COLOR GR+/RB
			ENDIF
		@ 8,26 SAY other COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF itax <> 0
		@ 7,34 SAY "I.Tax" COLOR GR+/RB
		@ 8,32 SAY "+" COLOR GR+/RB
		@ 8,35 SAY itax COLOR GR+/RB
		ENDIF
	ENDIF


	IF _WINDOWS
		IF itax <> 0
		@ 7,34 SAY "I.Tax" COLOR GR+/RB
		@ 8,32 SAY "+" COLOR GR+/RB
		@ 8,35 SAY itax COLOR GR+/RB
		ENDIF
	ENDIF

	IF _DOS
		IF (advance+midadv+other+pfund+itax) <> 0
		@ 7,46 SAY "Tot.Ded" COLOR GR+/RB
		@ 8,44 SAY "=" COLOR GR+/RB
		@ 8,46 SAY (advance+midadv+other+pfund+itax);
			PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF

	IF _WINDOWS
		IF (advance+midadv+other+pfund+itax) <> 0
		@ 7,46 SAY "Tot.Ded" COLOR GR+/RB
		@ 8,44 SAY "=" COLOR GR+/RB
		@ 8,46 SAY (advance+midadv+other+pfund+itax);
			PICT "99,999" COLOR GR+/RB
		ENDIF
	ENDIF


	IF _DOS
		IF GrossPay <> 0
			@ 6,55 SAY " Net Payable Amount " COLOR W+/G
			@ 7,55 SAY " Rs." COLOR N/BG
			@ 7,59 SAY GrossPay;
			-(advance+midadv+other+pfund+itax) PICT "999,999" COLOR N/BG
			@ 7,66 SAY "         " COLOR N/BG
		ENDIF
	ENDIF

	IF _WINDOWS
		IF GrossPay <> 0
			@ 6,55 SAY " Net Payable Amount " COLOR W+/G
			@ 7,55 SAY " Rs." COLOR N/BG
			@ 7,59 SAY GrossPay;
			-(advance+midadv+other+pfund+itax) PICT "999,999" COLOR N/BG
			@ 7,66 SAY "         " COLOR N/BG
		ENDIF
	ENDIF



ENDCASE



RETURN
******************
