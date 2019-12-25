SET TALK OFF
SET STAT ON
SELE 1
USE SlryDat Alia SlryDat
Set filter to ((year=1998 .and. mcode>05) .or. (year=1999 .and. mcode<07)) .and. (tot_pay>0 .and. tot_pay<=3000)
SET ORDER TO DEmpNo

Sele 2
Use 1998-99

Sele SlryDat
GOTO TOP
MDeptCode=0
MEmpNo=0
MName=Spac(20)
Store 0 To MJul98, MAug98, MSep98, MOct98, MNov98, MDec98, MJan99, MFeb99, MMar99, MApr99, MMay99, MJun99

DO WHILE .NOT. EOF()
	MDeptCode=DeptCode
	MEmpNo=EmpNo	
	MName=Name
	Do While DeptCode=MDeptCode .And. EmpNo=MEmpNo
		If MCode=1
			MJan99=Tot_Pay						
		Endif
		If MCode=2
			MFeb99=Tot_Pay						
		Endif
		If MCode=3
			MMar99=Tot_Pay						
		Endif
		If MCode=4
			MApr99=Tot_Pay						
		Endif
		If MCode=5
			MMay99=Tot_Pay						
		Endif
		If MCode=6
			MJun99=Tot_Pay						
		Endif
		If MCode=7
			MJul98=Tot_Pay						
		Endif
		If MCode=8
			MAug98=Tot_Pay						
		Endif
		If MCode=9
			MSep98=Tot_Pay						
		Endif
		If MCode=10
			MOct98=Tot_Pay						
		Endif
		If MCode=11
			MNov98=Tot_Pay						
		Endif
		If MCode=12
			MDec98=Tot_Pay						
		Endif
		Skip
	Enddo
	Sele 2
	Append Blank
	Replace Name With MName
	Replace Deptcode With MDeptcode
	Replace Empno With MEmpNo
	Replace Jul98 With MJul98
	Replace Aug98 With MAug98
	Replace Sep98 With MSep98
	Replace Oct98 With MOct98
	Replace Nov98 With MNov98
	Replace Dec98 With MDec98
	Replace Jan99 With MJan99
	Replace Feb99 With MFeb99
	Replace Mar99 With MMar99
	Replace Apr99 With MApr99
	Replace May99 With MMay99
	Replace Jun99 With MJun99


	MDeptCode=0
	MEmpNo=0
	MName=Spac(20)
	Store 0 To MJul98, MAug98, MSep98, MOct98, MNov98, MDec98, MJan99, MFeb99, MMar99, MApr99, MMay99, MJun99

	Sele SlryDat
ENDDO
CLOSE ALL
CLEAR ALL
RETURN
