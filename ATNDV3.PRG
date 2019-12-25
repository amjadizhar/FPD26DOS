* This update: 22-Sep-2017

clear
@ 0,0,21,79 BOX
DEFINE WINDOW bratnd FROM 1,1 TO 20,78

SET VIEW TO attend





BROWS FIELDS;
	Ename = employee.name :H = "Employee Name",;
	L1 = "³" :1 :R :H = "",;
	D1 :H = "1 ",;
	D2 :H = "2 ",;
	D3 :H = "3 ",;
	D4 :H = "4 ",;
	D5 :H = "5 ",;
	D6 :H = "6 ",;
	D7 :H = "7 ",;
	D8 :H = "8 ",;
	D9 :H = "9 ",;
	D10 :H = "10",;
	D11 :H = "11",;
	D12 :H = "12",;
	D13 :H = "13",;
	D14 :H = "14",;
	D15 :H = "15",;
	D16 :H = "16",;
	D17 :H = "17",;
	D18 :H = "18",;
	D19 :H = "19",;
	D20 :H = "20",;
	D21 :H = "21",;
	D22 :H = "22",;
	D23 :H = "23",;
	D24 :H = "24",;
	D25 :H = "25",;
	D26 :H = "26",;
	D27 :H = "27",;
	D28 :H = "28",;
	D29 :H = "29",;
	D30 :H = "30",;
	D31 :H = "31";
	WINDOW bratnd;
	WHEN below();
	TITLE "Daily Attendence Register";
	NOAPPEND NOEDIT

CLEAR ALL
CLEAR
CANCEL

RETURN

PROCEDURE below

@ 22,2 SAY deptcode
@ 22,4 SAY "-"
@ 22,5 SAY empno PICT "@L"

@ 22,9 SAY employee.salutation+"."
@ 22,12 SAY employee.name
@ 22,35 SAY deptt.deptname




RETURN 
