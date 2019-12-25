SET TALK OFF
SET STAT ON
SELE 1
USE SlryDat Alia SlryDat
Set filter to ((year=1997 .and. mcode>05) .or. (year=1998 .and. mcode<07)) .and. (tot_pay>0 .and. tot_pay<=3000)
SET ORDER TO DEmpNo

Sele 2
Use 1997-98

Sele SlryDat
GOTO TOP
MDeptCode=0
MEmpNo=0
MName=Spac(20)
Store 0 To MJul97, MAug97, MSep97, MOct97, MNov97, MDec97, MJan98, MFeb98, MMar98, MApr98, MMay98, MJun98

DO WHILE .NOT. EOF()
	MDeptCode=DeptCode
	MEmpNo=EmpNo	
	MName=Name
	Do While DeptCode=MDeptCode .And. EmpNo=MEmpNo
		If MCode=1
			MJan98=Tot_Pay						
		Endif
		If MCode=2
			MFeb98=Tot_Pay						
		Endif
		If MCode=3
			MMar98=Tot_Pay						
		Endif
		If MCode=4
			MApr98=Tot_Pay						
		Endif
		If MCode=5
			MMay98=Tot_Pay						
		Endif
		If MCode=6
			MJun98=Tot_Pay						
		Endif
		If MCode=7
			MJul97=Tot_Pay						
		Endif
		If MCode=8
			MAug97=Tot_Pay						
		Endif
		If MCode=9
			MSep97=Tot_Pay						
		Endif
		If MCode=10
			MOct97=Tot_Pay						
		Endif
		If MCode=11
			MNov97=Tot_Pay						
		Endif
		If MCode=12
			MDec97=Tot_Pay						
		Endif
		Skip
	Enddo
	Sele 2
	Append Blank
	Replace Name With MName
	Replace Deptcode With MDeptcode
	Replace Empno With MEmpNo
	Replace Jul97 With MJul97
	Replace Aug97 With MAug97
	Replace Sep97 With MSep97
	Replace Oct97 With MOct97
	Replace Nov97 With MNov97
	Replace Dec97 With MDec97
	Replace Jan98 With MJan98
	Replace Feb98 With MFeb98
	Replace Mar98 With MMar98
	Replace Apr98 With MApr98
	Replace May98 With MMay98
	Replace Jun98 With MJun98


	MDeptCode=0
	MEmpNo=0
	MName=Spac(20)
	Store 0 To MJul97, MAug97, MSep97, MOct97, MNov97, MDec97, MJan98, MFeb98, MMar98, MApr98, MMay98, MJun98

	Sele SlryDat
ENDDO
CLOSE ALL
CLEAR ALL
RETURN
