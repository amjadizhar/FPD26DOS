clear
sELE 2
uSE TMP
Zap

SELE 1
use tran
Set Order To Tranent
goto top

set talk off
set stat on
MVch_Type=0
MVch_No2=0
MSr_No=0
clear
Do While .Not. EOF()
	MVch_Type=Vch_Type
	MVch_No2=Vch_No2
	MSr_No=Sr_No
	Skip
	
	If str(Vch_Type)+str(Vch_No2)+str(Sr_No)=str(MVch_Type)+str(MVch_No2)+str(MSr_No)
	Sele 2
	append blank
	Replace Vch_type with mvch_type
	replace vch_no2 with mvch_no2
	replace sr_no with msr_no
	sele 1
	Endif

	MVch_Type=0
	MVch_No2=0
	MSr_No=0
Enddo
Return
Close all
Clear all
