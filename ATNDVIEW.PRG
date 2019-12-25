* this update: 22-Sep-2017

clear
DEFINE WINDOW fullview FROM 0,0 TO 24,79
SET VIEW TO attend

BROWS FIELDS;
	Ename = employee.name :H = "Employee Name",;
	L1 = "³" :1 :R :H = "",;
	D1;
	WINDOW fullview;
	TITLE "Daily Attendence Register"
