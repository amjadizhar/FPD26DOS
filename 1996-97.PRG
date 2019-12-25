SET TALK OFF
SET STAT ON
SELE 1
USE SlryDat Alia SlryDat
Set filter to ((year=1996 .and. mcode>05) .or. (year=1997 .and. mcode<07)) .and. (tot_pay>0 .and. tot_pay<=3000)
SET ORDER TO DEmpNo

Sele 2
Use 1996-97

Sele SlryDat
GOTO TOP
MDeptCode=0
MEmpNo=0
MName=Spac(20)
Store 0 To MJul96, MAug96, MSep96, MOct96, MNov96, MDec96, MJan97, MFeb97, MMar97, MApr97, MMay97, MJun97

DO WHILE .NOT. EOF()
	MDeptCode=DeptCode
	MEmpNo=EmpNo	
	MName=Name
	Do While DeptCode=MDeptCode .And. EmpNo=MEmpNo
		If MCode=1
			MJan97=Tot_Pay						
		Endif
		If MCode=2
			MFeb97=Tot_Pay						
		Endif
		If MCode=3
			MMar97=Tot_Pay						
		Endif
		If MCode=4
			MApr97=Tot_Pay						
		Endif
		If MCode=5
			MMay97=Tot_Pay						
		Endif
		If MCode=6
			MJun97=Tot_Pay						
		Endif
		If MCode=7
			MJul96=Tot_Pay						
		Endif
		If MCode=8
			MAug96=Tot_Pay						
		Endif
		If MCode=9
			MSep96=Tot_Pay						
		Endif
		If MCode=10
			MOct96=Tot_Pay						
		Endif
		If MCode=11
			MNov96=Tot_Pay						
		Endif
		If MCode=12
			MDec96=Tot_Pay						
		Endif
		Skip
	Enddo
	Sele 2
	Append Blank
	Replace Name With MName
	Replace Deptcode With MDeptcode
	Replace Empno With MEmpNo
	Replace Jul96 With MJul96
	Replace Aug96 With MAug96
	Replace Sep96 With MSep96
	Replace Oct96 With MOct96
	Replace Nov96 With MNov96
	Replace Dec96 With MDec96
	Replace Jan97 With MJan97
	Replace Feb97 With MFeb97
	Replace Mar97 With MMar97
	Replace Apr97 With MApr97
	Replace May97 With MMay97
	Replace Jun97 With MJun97


	MDeptCode=0
	MEmpNo=0
	MName=Spac(20)
	Store 0 To MJul96, MAug96, MSep96, MOct96, MNov96, MDec96, MJan97, MFeb97, MMar97, MApr97, MMay97, MJun97

	Sele SlryDat
ENDDO
CLOSE ALL
CLEAR ALL
RETURN
