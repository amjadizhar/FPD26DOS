*-----------------------------------*
*Program to Create The Database File*
*Author		:	Muhammad Usman		*
*Date		:	24-06-1999			*
*Prog		:	C-File				*
*Last Modify:	24-06-1999			*
*-----------------------------------*
* Window Defination
	DEFINE WINDOW cfile ;
		FROM INT((SROW()-15)/1),INT((SCOL()-68)/1) ;
		TO INT((SROW()-15)/1)+6,INT((SCOL()-68)/1)+50 ;
		NOFLOAT ;
		NOCLOSE ;
		SHADOW ;
		NOMINIMIZE ;
		PANEL ;
		Color R/G
		
	ACTIVATE WINDOW cfile SAME
*-----------------------------------
Clear
@ 01,10 SAY "Checking The Database Files"
@ 03,13 SAY "Please Don't Distrub"

If File("Week.Dbf")=.F.
	Create Table Week (Sr_No C(3), Ws_Date D(8), We_Date D(8))
Endif
If File("Week.Cdx")=.F.
	Use Week Excl
	Index On SR_No Tag SR_No
	Index On WS_Date Tag WS_Date
	Index On WE_Date Tag WE_Date
Endif

If File("Shop.Dbf")=.F.
	Create Table Shop (Sur_Code C(2), Sh_Code C(3), Sh_Name C(30), Sh_Add C(50), Sh_Contact C(10), Sh_Phone C(15), C_Code C(2), S_Categ C(2), Retail C(1))
Endif
If File("Shop.Cdx")=.F.
	Use Shop Excl
	Index On Sur_Code+Sh_Code Tag SS_Code
	Index On C_Code Tag C_Code
	Index On Sh_Code Tag Sh_Code
Endif

If File("Attend.Dbf")=.F.
	Create Table Attend (A_Date D(8), R_Code C(3))
Endif
If File("Attend.Cdx")=.F.
	Use Attend Excl
	Index On DtoC(A_Date)+R_Code Tag AR
Endif

If File("Sale.Dbf")=.F.
	Create Table Sale (S_Date D(8), Sa_Code C(3), Sa_Name C(15), Sur_Code C(2), Sh_Code C(3), Sale C(1), Baskit N(2), Bag N(3), R_Code C(3))
Endif
If File("Sale.Cdx")=.F.
	Use Sale Excl
	Index On DTOC(S_Date)+Sur_Code+Sh_Code Tag DRSH
	Index On Sa_Code Tag Sa_Code
	Index On Sur_Code+Sh_Code Tag SS_Code
	Index On S_Date Tag S_Date
	Index On Sh_Code Tag Sh_Code
	Index On R_Code Tag R_Code
	Index On Dtoc(S_Date)+R_Code Tag SR_Code
	Index On Sur_Code+Sh_Code+Dtoc(S_Date) Tag SSS_Date
	Index On Sur_Code+Sh_Code+R_Code Tag SSR_Code
	Index On R_Code+Sa_Code Tag RS_Code
Endif

If File("RWS.Dbf")=.F.
	Create Table RWS (R_Code C(3), Sa_Code C(3), RDate D(8), Bag N(5), Basket N(5), Sale N(5), Visit N(5), Visitable N(4), Sr_No C(3), Sur_Code C(2), Sh_Code C(3), S_Categ C(2), S_Date D(8), Week1 N(3), Week2 N(3), Week3 N(3), Week4 N(3), Week5 N(3), Week6 N(3), Week7 N(3), Week8 N(3), WSSale N(4), CSale N(4), Desc C(11))
Endif

If File("Routes.Dbf")=.F.
	Create Table Routes (R_Code C(3), Route C(20), RDesc C(60), T_Surv N(4), T_Visit N(4), Sa_Code C(3), Day C(15))
Endif
If File("Routes.Cdx")=.F.
	Use Routes Excl
	Index On R_Code Tag R_Code
Endif

If File("Salesmen.Dbf")=.F.
	Create Table Salesmen (Sa_Code C(3), Sa_Name C(15))
Endif
If File("Salesmen.Cdx")=.F.
	Use Salesmen Excl
	Index On Sa_Code Tag Sa_Code
Endif

If File("Sunday.Dbf")=.F.
	Create Table Sunday (Sr_No C(3), Date D(8))
Endif
If File("Sunday.Cdx")=.F.
	Use Sunday Excl
	Index On Sr_No Tag Sr_No
	Index On Date Tag Date
Endif

If File("Pass.Dbf")=.F.
	Create Table Pass (Sr_No N(1), Pass C(6))
	Use Pass Excl
	Append Blank
	Replace Sr_No With 1
	Replace Pass With ":>=53-"
	Append Blank
	Replace Sr_No With 2
	Replace Pass With ":>=53-"
	Append Blank
	Replace Sr_No With 3
	Replace Pass With ":>=53-"
	Append Blank
	Replace Sr_No With 4
	Replace Pass With ":>=53-"
	Append Blank
	Replace Sr_No With 5
	Replace Pass With ":>=53-"
	Append Blank
	Replace Sr_No With 6
	Replace Pass With ":>=53-"
Endif
If File("Pass.Cdx")=.F.
	Use Pass Excl
	Index On Sr_No Tag Sr_No
Endif

If File("Licen.Dbf")=.F.
	Create Table Licen (L_Date D(8), Ok C(1))
Endif
If File("Licen.Cdx")=.F.
	Use Licen Excl
	Index On Ok Tag Ok Desc
Endif

If File("Holiday.Dbf")=.F.
	Create Table Holiday (H_Date D(8), H_Desc C(20))
Endif
If File("Holiday.Cdx")=.F.
	Use Holiday Excl
	Index On DtoC(H_Date) Tag H_Date
Endif

If File("Day.Dbf")=.F.
	Create Table Day (Day C(15), D_Date D(8))
Endif
If File("Day.Cdx")=.F.
	Use Day Excl
	Index On Day Tag Day
Endif

If File ("Categ.Dbf")=.F.
	Create Table Categ (C_Code C(2), C_Cate C(20))
Endif
If File ("Categ.Cdx")=.F.
	Use Categ Excl
	Index On C_Code Tag C_Code
Endif

If File ("SRout.Dbf")=.F.
	Create Table SRout (Sr_Date D(8), Sur_Code C(2), Sh_Code C(3), R_Code C(3), Sign C(1))
Endif
If File ("SRout.Cdx")=.F.
	Use SRout Excl
	Index On DTOC(SR_Date)+Sur_Code+Sh_Code+R_Code Tag SSSR
	Index On DTOC(SR_Date)+Sur_Code+Sh_Code Tag SSS
	Index On Sur_Code+Sh_Code Tag SS_Code
	Index On Sur_Code+Sh_Code Tag SSC_Desc Desc
	Index On Sur_Code+Sh_Code+DtoC(Sr_Date) Tag SSSD Desc
Endif
If File ("Unactiv.Dbf")=.F.
	Create Table Unactiv (R_Code C(3), Sur_Code C(2), Sh_Code C(3), Week N(3), Sale N(4))
Endif
Rele wind cfile
Close All
Return