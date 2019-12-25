
*************************
* PROGRAM: ATNDV2.PRG
* Program to paint a brow for attendence register
* with complete 31 days
* Programmer: Amjad Izhar
* This update: 22-Sep-2017
**************************

DO mainprog

**************************
PROCEDURE mainprog
**************************
DO iniset
DO SetVars
DO paintbrow
DO endprog
RETURN
**************************


*************************
PROCEDURE iniset
*************************
CLEAR
*HIDE POPUP mainmenu
SET TALK OFF
SET SAFETY OFF

ON KEY LABEL F1 DO Ord1
ON KEY LABEL F2 DO Ord2
ON KEY LABEL F3 DO Ord3

SET FUNCTION F4 TO
SET FUNCTION F5 TO
SET FUNCTION F6 TO
SET FUNCTION F7 TO
SET FUNCTION F8 TO
SET FUNCTION F9 TO
SET FUNCTION F10 TO
SET FUNCTION F11 TO
SET FUNCTION F12 TO

PUBLIC mMcode,mYear
mMcode = 0
mYear = 0

SELECT 1
USE attend.dbf
SET ORDER TO empno 

STORE mcode TO mMcode
STORE year TO mYear


SELECT 2
USE employee.dbf
SET ORDER TO empno 

SELECT 3
USE month
SET ORDER TO mcode 

SELECT 4
USE ovtime
SET ORDER TO empno 

SELECT 5
USE deptt
SET ORDER TO deptcode 

SELECT 6
USE salary ORDER empno2


SELECT 7
USE saldtail ORDER empno

SET FILTER TO
SET FILTER TO mcode = mMcode AND year = mYear


SELECT 1
SET RELATION TO str(deptcode)+str(empno) INTO employee ADDITIVE
SET RELATION TO str(deptcode)+str(empno) INTO salary ADDITIVE

SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year);
				INTO saldtail ADDITIVE

SET RELATION TO mcode INTO month ADDITIVE
SET RELATION TO str(deptcode)+str(empno)+str(mcode)+str(year) INTO ovtime ADDITIVE
SET RELATION TO deptcode INTO deptt ADDITIVE

goto top


RETURN
*************************


*************************
PROCEDURE SetVars
*************************
PUBLIC CurFld
CurFld = space(3)
RETURN
*************************


******************************************
PROCEDURE paintbrow
******************************************
PUBLIC Pal

*@ 0,0,40,120 BOX

DEFINE WINDOW b FROM 0,0 TO 54,129

mrecord = RECNO()

SCAN
Pal = d1+d2+d3+d4+d5+d6+d7+d8+d9+d10+d11+d12+d13+d14+d15+;
	  d16+d17+d18+d19+d20+d21+d22+d23+d24+d25+d26+d27+d28+;
	  d29+d30+d31


REPLACE present WITH OCCURS("P",Pal)
REPLACE absent WITH OCCURS("A",Pal)
REPLACE leave WITH OCCURS("L",Pal)
REPLACE late WITH OCCURS("T",Pal)
ENDSCAN

GOTO mrecord

BROWS FIELDS;
	Eno = str(deptcode,2)+"-"+;
		str(empno,3)+"³";
		:R :H = "Code" :W=.F.,;
	employee.name :18 :R :W=.F.,;
	L1 = "³" :1 :R :H = "" :W=.F.,D1:H="1 ":P="@!":V=UP(),;
	D2:H="2 ":P="@!":V=UP(),D3:H="3 ":P="@!":V=UP(),;
	D4:H="4 ":P="@!":V=UP(),D5:H="5 ":P="@!":V=UP(),;
	D6:H="6 ":P="@!":V=UP(),D7:H="7 ":P="@!":V=UP(),;
	D8:H="8 ":P="@!":V=UP(),D9:H="9 ":P="@!":V=UP(),;
	D10:H="10":P="@!":V=UP(),D11:H="11":P="@!":V=UP(),;
	D12:H="12":P="@!":V=UP(),D13:H="13":P="@!":V=UP(),;
	D14:H="14":P="@!":V=UP(),D15:H="15":P="@!":V=UP();
WINDOW b;
NOAPPEND NODELETE


BROWS FIELDS;
	Eno = str(deptcode,2)+"-"+;
		str(empno,3)+"³";
		:R :H = "Code" :W=.F.,;
	employee.name :16 :R:W=.F.,;
	L1 = "³" :1 :R :H = "":W=.F.,;
	D16:H="16":P="@!":V=UP(),D17:H="17":P="@!":V=UP(),;
	D18:H="18":P="@!":V=UP(),D19:H="19":P="@!":V=UP(),;
	D20:H="20":P="@!":V=UP(),D21:H="21":P="@!":V=UP(),;
	D22:H="22":P="@!":V=UP(),D23:H="23":P="@!":V=UP(),;
	D24:H="24":P="@!":V=UP(),D25:H="25":P="@!":V=UP(),;
	D26:H="26":P="@!":V=UP(),;
	D27:H="27":P="@!":V=UP(),;
	D28:H="28":P="@!":V=UP(),;
	D29:H="29":P="@!":V=UP(),;
	D30:H="30":P="@!":V=UP(),;
	D31:H="31":P="@!":V=UP();
WINDOW b;
NOAPPEND NODELETE



ON KEY
SET INDEX TO attend.cdx
SET ORDER TO empno

RETURN
***************************************
***********************
PROCEDURE below			&& Browse When clause
***********************

@ 22,2 SAY deptcode
@ 22,4 SAY "-"
@ 22,5 SAY empno PICT "@L"

*@ 22,9 SAY employee.salutation+"."
@ 22,12 SAY employee.name
@ 22,35 SAY deptt.deptname

@ 23,9 SAY "P="
@ 23,11 SAY present
@ 23,15 SAY "A="
@ 23,17 SAY absent
@ 23,21 SAY "L="
@ 23,23 SAY leave
@ 23,27 SAY "T="
@ 23,29 SAY late



IF ovtime.totalot <> 0
	@ 23,35 SAY "Tot.OT="
	@ 23,42 SAY ovtime.totalot
ELSE
	@ 23,32 TO 23,48 CLEAR

ENDIF

@ 22,60 SAY ALLTRIM(month.month)+","+ALLTRIM(STR(attend.year));
	COLOR GR+/B

@ 23,60 SAY "Payable Days: "
@ ROW(),COL() SAY pbldays

@ 24,9 SAY "F1=Attendence Wise        F2=Emp.No Wise           F3=Name Wise"

RETURN .T.
******************************


****************************
PROCEDURE Up
****************************

STORE VARREAD() TO CurFld

IF INLIST(&CurFld,'P','A','L','T',' ','F','H') = .F.
WAIT WINDOW "(P)resent,(A)bsent,(L)eave,La(T)e" TIMEOUT 3
RETURN .F.
ENDIF

Pal = d1+d2+d3+d4+d5+d6+d7+d8+d9+d10+d11+d12+d13+d14+d15+;
	  d16+d17+d18+d19+d20+d21+d22+d23+d24+d25+d26+d27+d28+;
	  d29+d30+d31

REPLACE present WITH OCCURS("P",Pal)
REPLACE absent WITH OCCURS("A",Pal)
REPLACE leave WITH OCCURS("L",Pal)
REPLACE late WITH OCCURS("T",Pal)

PUBLIC mPblDysS,mPblDysW,mPblDysP
mPblDysS = 0
mPblDysW = 0
mPblDysP = 0

IF present <> 0
mPblDysS = month.mdays-absent
mPblDysW = present+late
mPblDysP = month.mdays-absent
ENDIF

DO CASE
CASE salary.mpay AND NOT employee.probation
	
	REPLACE pbldays WITH mPblDysS

CASE salary.mpay AND employee.probation
	
	REPLACE pbldays WITH mPblDysP

CASE salary.mpay = .f. ;
	AND salary.wrdaily = .f. AND NOT employee.probation;
	AND NOT EMPTY(salary.dwratem)
	
	REPLACE pbldays WITH mPblDysS

CASE salary.mpay = .f. ;
	AND salary.wrdaily = .f. AND employee.probation;
	AND NOT EMPTY(salary.dwratem)

	REPLACE pbldays WITH mPblDysP

OTHERWISE

	REPLACE pbldays WITH mPblDysW

ENDCASE


REPLACE saldtail.days WITH pbldays


RETURN .T.
***************************


**************
PROCEDURE Ord1
**************

STORE RECNO() TO mRecord
WAIT WINDOW "Changing Order to Attendence Wise" TIMEOUT 1
SET INDEX TO attend.cdx
SET ORDER TO empno
KEYBOARD '{PGUP}'
KEYBOARD '{PGUP}'
GOTO mRecord

RETURN
********

**************
PROCEDURE Ord2
**************

STORE RECNO() TO mRecord
WAIT WINDOW "Changing Order to Emp. No. Wise" TIMEOUT 1
SET INDEX TO attend.cdx
SET ORDER TO empno2
KEYBOARD '{PGUP}'
KEYBOARD '{PGUP}'
GOTO mRecord

RETURN
***********

**************
PROCEDURE Ord3
**************

STORE RECNO() TO mRecord
WAIT WINDOW "Changing Order to Name Wise" TIMEOUT 1

INDEX ON employee.name TO atname.idx
SET INDEX TO atname.idx

KEYBOARD '{PGUP}'
KEYBOARD '{PGUP}'
GOTO mRecord

RETURN
***********




************************
PROCEDURE endprog
************************
CLEAR
CLOSE DATABASES
CLEAR WINDOWS
*SHOW POPUP mainmenu

IF _DOS
RESTORE SCREEN FROM backgrnd
ENDIF

RETURN
**********************

