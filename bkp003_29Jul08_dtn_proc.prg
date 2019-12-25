***********************************************
* PROGRAM : DTN_PROC.PRG					  *
* Author : Amjad Izhar 						  *
* Daily Transactions Procedures  			  *
* Written : 19-9-96  						  *
* Revised again on : 25-07-2008  PM  *
***********************************************


*   Daily Transactions
* 1 - Vouchers ....... Entry       	PROCEDURE vch_ent
* 2 - Vouchers ....... Entry - 2 
* 3 - Vouchers ....... Correction 
* 4 - Vouchers ....... Deletion   
* ------------- Printing --------- 
* 5 - Vouchers ....... Date Wise     
* 6 - Vouchers ....... Type Wise     
* 7 - Complete Voucher Printing - I  
* 8 - Complete Voucher Printing - II 
* ---------- View On Screen ------ 
* 9 - Vouchers ....... Type Wise   
* 10 - Vouchers ....... Date Wise   


**********************************
* 1 - Vouchers ....... Entry New Voucher     * 
**********************************
PROCEDURE vch_ent
********************

IF _DOS
	CLEAR
	CLOSE DATABASES 
ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	CLEAR
	CLOSE DATABASES 
ENDIF

IF _DOS
	SET DELETED ON
	SET EXCLUSIVE ON
	SET DATE brit
	SET CENT ON
ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	SET DELETED ON
	SET EXCLUSIVE ON
	SET DATE brit
	SET CENT ON
ENDIF

IF _DOS
	*SET CLOCK ON
	*SET CLOCK TO 24,68
ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	*SET CLOCK ON
	*SET CLOCK TO 29,100
ENDIF


IF _DOS
	SET COLOR TO 7/1
ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	SET COLOR TO
ENDIF

IF _DOS
	CLEAR
ELSE
	CLEAR
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
ENDIF

* Used databases
* Area 3 - ldgrcode.dbf
* Area 4 - tran-key.dbf
* Area 5 - master.dbf

IF _DOS
	
	SELECT 3
	USE ldgrcode ALIAS ldgrcode EXCLUSIVE
	INDEX ON STR(C1,2)+STR(C2,2)+STR(C3,3) TAG ac1
	SET ORDER TO ac1

	SELECT 5
	USE master ALIAS master EXCLUSIVE
	INDEX ON STR(C1,2)+STR(C2,2)+STR(C3,3) TAG ac2 
	SET ORDER TO ac2

ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	SELECT 3
	USE ldgrcode ALIAS ldgrcode EXCLUSIVE
	INDEX ON STR(C1,2)+STR(C2,2)+STR(C3,3) TAG ac1
	SET ORDER TO ac1

	SELECT 5
	USE master ALIAS master EXCLUSIVE
	INDEX ON STR(C1,2)+STR(C2,2)+STR(C3,3) TAG ac2 
	SET ORDER TO ac2

ENDIF


			*****  Vouchers Types Array  *****

* Memory Array Voucher Type

IF _DOS

	DECLARE MAVT( 7)

ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	DECLARE MAVT( 7)

ENDIF

			******  Initialize Variables for Voucher Types *****
IF _DOS

	MAVT( 1)= 'CR'
	MAVT( 2)= 'CP'
	MAVT( 3)= 'BR'
	MAVT( 4)= 'BP'
	MAVT( 5)= 'JV'
	MAVT( 6)= 'SV'
	MAVT( 7)= 'PV'

ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	MAVT( 1)= 'CR'
	MAVT( 2)= 'CP'
	MAVT( 3)= 'BR'
	MAVT( 4)= 'BP'
	MAVT( 5)= 'JV'
	MAVT( 6)= 'SV'
	MAVT( 7)= 'PV'

ENDIF


IF _DOS

	MVCH1= '  '  && Variable for vch_no1  N   2   0
	MVCH2= '    '  && Variable for vch_no2  N  5   0

	STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
	STORE 0 TO MC1, MC2, MC3, MVCH_NO1, MVCH_NO2

	STORE DATE() TO MDATE
	STORE SPACE(1) TO CANS, MQES

	STORE SPACE(30) TO MTITLE
	STORE SPACE(42) TO MDESCRIP, MDESCRIP1

	STORE SPACE(1) TO Y, MDR_CR, MANS
	STORE 0 TO MVCH_TYPE, AMT1, AMT2

ELSE
	@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
    MVCH1= '  '  && Variable for vch_no1  N   2   0
    MVCH2= '    '  && Variable for vch_no2  N  5   0

      STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
      STORE 0 TO MC1, MC2, MC3, MVCH_NO1, MVCH_NO2

		STORE DATE() TO MDATE
		STORE SPACE(1) TO CANS, MQES

      STORE SPACE(30) TO MTITLE
      STORE SPACE(42) TO MDESCRIP, MDESCRIP1

      STORE SPACE(1) TO Y, MDR_CR, MANS
      STORE 0 TO MVCH_TYPE, AMT1, AMT2

ENDIF



			***  Main Loop  ***
			***  Do While Loop  A-1 / vch_ent ***



DO WHILE .T.  && MAIN LOOP


   IF CANS<>'Y'

			*******  Initializing Variables  *******

      PAGE= 1

      CLEAR

      MVCH1= '  '  && Variable for vch_no1  N   2   0
      MVCH2= '    '  && Variable for vch_no2  N  5   0

      STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
      STORE 0 TO MC1, MC2, MC3, MVCH_NO1, MVCH_NO2

      STORE SPACE(30) TO MTITLE
*      STORE SPACE(42) TO MDESCRIP, MDESCRIP1

      M= 6
      L= 16

      STORE SPACE(1) TO Y, MDR_CR, MANS
      STORE 0 TO MVCH_TYPE, AMT1, AMT2

   ENDIF


   R= 1  && Row

	IF _DOS
   		@ 2, 1 TO 2, 79 DOUBLE
   		@ 21, 1 TO 21, 79 DOUBLE
   		@ 1, 30 SAY 'VOUCHER  ENTRY'
   		@ 1, 60 SAY 'PAGE #'
   	
   		@ 1, 67 SAY PAGE ;
   		PICTURE '999';
   		SIZE 1,4
	ENDIF

	IF _WINDOWS
   		@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
   		@ 2, 1 TO 2, 120 DOUBLE
   		@ 21, 1 TO 21, 120 DOUBLE
   		@ 1, 30 SAY 'VOUCHER  ENTRY' FONT 'FoxFont',11
   		@ 1, 90 SAY 'PAGE #' FONT 'FoxFont',11
   	
   		@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
   		@ 1, 100 SAY PAGE FONT 'FoxFont',11;
   		PICTURE '9999';
   		SIZE 1,5
	ENDIF


	IF _DOS
	   	@ 22, 50 SAY 'Press Esc to Return'

   		R= 3  && Row

   		@ R, 5 SAY 'Date       ' GET MDATE  && Voucher Date

   		READ
	ENDIF


*Amended on Sunday 02-07-2006

	IF _WINDOWS
		@ 0, 125 SAY "Windows" FONT 'Arial Narrow',8
	   	@ 30, 90 SAY 'Press Esc to Return' FONT 'FoxFont',11

   		R= 3  && Row

   		@ R, 5 SAY 'Date' FONT 'FoxFont',11
   		@ R, 15 GET MDATE FONT 'FoxFont',11  && Voucher Date

   		READ
	ENDIF


	**** If Esc key is pressed Return to Daily Transactions Menu ***

   IF READKEY()=12  && If Esc key is pressed
      CLEAR
      CLOSE DATA
      RETURN
   ENDIF

		***** Check date is not of the next year *****

   DO chk IN tbl_proc.prg

	IF _DOS
	   @ 22, 45 CLEAR TO 22, 79  && Clear the words 'Press Esc to Return'
	ENDIF
	
	IF _WINDOWS
	   @ 30, 1 CLEAR TO 30, 120  && Clear the words 'Press Esc to Return'
	ENDIF


   * (R) Row is 3
   * getting mVch_Type Variable for vch_type  N  1  0



IF _DOS

   @ R, 32 SAY 'Voucher Type  ' GET MVCH_TYPE PICTURE '9'
   
   
   * Screen's Bottom 3 lines Below double line at Row 21

   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

ENDIF


IF _WINDOWS

   @ R, 40 SAY 'Voucher Type' FONT 'FoxFont',11
   @ R, 60 GET MVCH_TYPE PICTURE '9' FONT 'FoxFont',11
   
   
   * Screen's Bottom 3 lines Below double line at Row 21

   @ 22, 1 SAY 'Voucher Types:' FONT 'FoxFont',11
   @ 23, 1 SAY '1 - ' FONT 'FoxFont',11
   @ 24, 1 SAY '2 - ' FONT 'FoxFont',11
   @ 25, 1 SAY '3 - ' FONT 'FoxFont',11
   @ 26, 1 SAY '4 - ' FONT 'FoxFont',11
   @ 27, 1 SAY '5 - ' FONT 'FoxFont',11
   @ 28, 1 SAY '6 - ' FONT 'FoxFont',11
   @ 29, 1 SAY '7 - ' FONT 'FoxFont',11
   @ 23, 10 SAY 'Cash Receipt - ' FONT 'FoxFont',11
   @ 24, 10 SAY 'Cash Payment - ' FONT 'FoxFont',11
   @ 25, 10 SAY 'Bank Receipt - ' FONT 'FoxFont',11
   @ 26, 10 SAY 'Bank Payment - ' FONT 'FoxFont',11
   @ 27, 10 SAY 'Journal      - ' FONT 'FoxFont',11
   @ 28, 10 SAY 'Sales        - ' FONT 'FoxFont',11
   @ 29, 10 SAY 'Purchase     - ' FONT 'FoxFont',11

ENDIF

   * Set Background to White and letters to black

IF _DOS
   SET COLOR TO /w 
ENDIF



IF _DOS
   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'
ELSE
   @ 23, 30 SAY 'CR' FONT 'FoxFont',11
   @ 24, 30 SAY 'CP' FONT 'FoxFont',11
   @ 25, 30 SAY 'BR' FONT 'FoxFont',11
   @ 26, 30 SAY 'BP' FONT 'FoxFont',11
   @ 27, 30 SAY 'JV' FONT 'FoxFont',11
   @ 28, 30 SAY 'SV' FONT 'FoxFont',11
   @ 29, 30 SAY 'PV' FONT 'FoxFont',11
ENDIF


IF _DOS
   SET COLOR TO 7/1 && Blue BackGround White letters
ELSE
	SET COLOR TO
ENDIF


   READ

   IF MVCH_TYPE=0
      LOOP  && Loop back to TOP MAIN Do While Loop  A-1 / vch_ent
   ENDIF

   IF MVCH_TYPE>=8


		IF _DOS
      		@ R, 55 SAY '  '
      		@ R, 30 SAY 'No such Voucher type exist -- Press any key'
      		WAIT ''
	  		* Clear words 'No such Voucher type exist -- Press any key'
      		@ R, 30 SAY SPACE(55)
		ENDIF


		IF _WINDOWS
      		@ R, 55 SAY '  ' FONT 'FoxFont',11
      		@ R, 30 SAY 'No such Voucher type exist -- Press any key' FONT 'FoxFont',11
      		WAIT ''
	  		* Clear words 'No such Voucher type exist -- Press any key'
      		@ R, 30 SAY SPACE(55) FONT 'FoxFont',11
		ENDIF


      LOOP  && Loop back to TOP MAIN Do While Loop  A-1 / vch_ent

   ENDIF


IF _DOS
   * Clear after first double line
   @ 21, 1 CLEAR TO 24, 79
ENDIF


IF _WINDOWS
   * Clear after first double line
   @ 21, 1 CLEAR TO 24, 120
ENDIF


IF _DOS
   SET COLOR TO /w  && Set Background to White
ENDIF


IF _DOS
   @ R, 50 SAY MAVT(MVCH_TYPE)  && Give voucher type its characters Like "CP" etc.
ENDIF

IF _WINDOWS
   @ R, 65 SAY MAVT(MVCH_TYPE) FONT 'FoxFont',11  && Give voucher type its characters Like "CP" etc.

	DO CASE
		CASE MVCH_TYPE = 1
			@ R, 75 SAY 'Cash Receipt Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 2
			@ R, 75 SAY 'Cash Payment Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 3
			@ R, 75 SAY 'Bank Receipt Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 4
			@ R, 75 SAY 'Bank Payment Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 5
			@ R, 75 SAY 'Journal Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 6
			@ R, 75 SAY 'Sales Voucher' FONT 'FoxFont',11
		CASE MVCH_TYPE = 7
			@ R, 75 SAY 'Purchase Voucher' FONT 'FoxFont',11
	ENDCASE
	
ENDIF


IF _DOS
   SET COLOR TO 7/1 && Blue Background white letters
ENDIF


   ABC= 0

			***  Do While Loop  A-2 / vch_ent ***

   DO WHILE ABC=0

		IF _DOS
      		@ 23, 50 SAY 'Press Esc to Return'
      		@ 5, 22 SAY '          '
      		@ 5, 5 SAY 'Voucher No '
		ENDIF


*Amended on Sunday 02-07-2006
		IF _WINDOWS
      		@ 30, 90 SAY 'Press Esc to Return' FONT 'FoxFont',11
      		@ 5, 22 SAY SPACE(15) FONT 'FoxFont',11
      		@ 5, 4 SAY 'Voucher No ' FONT 'FoxFont',11
		ENDIF


IF _DOS
      SET COLOR TO /w
ENDIF


	IF _DOS
      @ 5, 17 SAY MAVT(MVCH_TYPE)
      @ 5, 20 SAY '  -     '
	ENDIF


	IF _WINDOWS
      @ 5, 26 SAY MAVT(MVCH_TYPE) FONT 'FoxFont',11
      @ 23, 1 TO 30,70 CLEAR
	ENDIF


IF _DOS
      SET COLOR TO 7/1
ENDIF


	IF _DOS
		MVCH_NO1 = MONTH(DATE())
      @ 5, 20 GET MVCH_NO1 PICTURE '@z 99'
	ENDIF


	IF _WINDOWS
      MVCH_NO1 = MONTH(DATE())
      @ 5, 32 GET MVCH_NO1 PICTURE '@z 99' FONT 'FoxFont',11
	  @ 4, 32 SAY 'Enter Month Number' FONT 'FoxFont',11
	ENDIF


      READ
      
      IF _WINDOWS
      	@ 4, 32 SAY SPACE(40)
      ENDIF

      IF READKEY()=12
         CLEAR
         CLOSE ALL
         RETURN
      ENDIF


	IF _DOS
      @ 23, 50 SAY SPACE(26)
	ENDIF


	IF _WINDOWS
      @ 23, 1 TO 30,70 CLEAR
	ENDIF


      IF MVCH_NO1=0
         LOOP && Loop back to SECOND Do While Loop  A-2 / vch_ent
      ENDIF

      MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
      SET COLOR TO /w
ENDIF


	IF _DOS
      @ 5, 20 SAY MVCH1
	ENDIF


	IF _WINDOWS
      @ 5, 32 SAY MVCH1 FONT 'FoxFont',11
	ENDIF


IF _DOS
      SET COLOR TO 7/1   
ENDIF


      SELECT 4
      USE tran-key ORDER key

	  * Set filter to go to the last voucher entered of this type

      SET FILTER TO VCH_TYPE=MVCH_TYPE .and. VCH_NO1=MVCH_NO1
      GOTO BOTTOM

	  * Give the next number to this voucher adding +1 to the last voucher

      MVCH_NO2 = VCH_NO2+1


	IF _DOS
      @ 5, 23 GET MVCH_NO2 PICTURE '@z 99999'
      READ
	ENDIF



	IF _WINDOWS
      @ 5, 40 GET MVCH_NO2 PICTURE '@z 99999' FONT 'FoxFont',11
      READ
		@ 5,39 SAY SPACE(30)
	ENDIF


   IF READKEY()=12  && If Esc key is pressed
      CLEAR
      CLOSE DATA
      CLOSE ALL
      RETURN
   ENDIF


      IF MVCH_NO2=0
         LOOP  && SECOND Do While Loop  A-2 / vch_ent
      ENDIF

      MVCH2 = REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
      SET COLOR TO /w
ENDIF


	IF _DOS
      @ 5, 23 SAY MVCH2
	ENDIF


	IF _WINDOWS
      @ 5, 22 TO 5,120 CLEAR
      @ 5, 22 SAY MAVT(MVCH_TYPE)+"-"+MVCH1+"-"+MVCH2 FONT 'FoxFont',11
	ENDIF

IF _DOS
      SET COLOR TO 7/1
ENDIF


      SELECT 4  && tran-key order key
      USE tran-key ORDER key
      
      SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)

      IF FOUND()

			IF _DOS
         		?? CHR(7)
         		@ 23, 1 SAY SPACE(78)
         		@ 23, 15 SAY 'This Voucher Already Exists  -- Press any key'
         		WAIT ''
         		@ 23, 10 SAY SPACE(75)
			ENDIF

			IF _WINDOWS
         		@ 23, 1 SAY SPACE(78) FONT 'FoxFont',11
         		@ 23, 15 SAY 'This Voucher Already Exists  -- Press any key' FONT 'FoxFont',11
         		WAIT ''
         		@ 23, 10 SAY SPACE(75) FONT 'FoxFont',11
			ENDIF


         LOOP
      ELSE

         APPEND BLANK && Add voucher type and voucher no to tran-key
         REPLACE VCH_TYPE WITH MVCH_TYPE
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         FLUSH

      ENDIF

      ABC= 1 && Exiting this Do while Loop   A-2 / vch_ent


   ENDDO

			****  End of Do While Loop  A-2 / vch_ent ****

   SELECT 4  && tran-key.dbf
   USE


	IF _DOS
   		R= 5
   		R= R+1
   		@ R, 1 TO R, 79
   		R= R+1
   		@ R, 2 SAY 'Sr  Acct-No.  Title                        Dr/Cr   Dr-Amt       Cr-Amt   More'
   		R= R+1
   		@ R, 1 TO R, 79 DOUBLE

   		R= 8
   		PAGE= 1
	ENDIF


	IF _WINDOWS
   		R= 5
   		R= R+1
   		@ R, 1 TO R, 120 CLEAR
   		R= R+1
   		@ R, 2 SAY 'Sr' FONT 'FoxFont',11
   		@ R, 10 SAY 'Acct-No.' FONT 'FoxFont',11
   		@ R, 30 SAY 'Title' FONT 'FoxFont',11
   		@ R, 65 SAY 'Dr/Cr' FONT 'FoxFont',11
   		@ R, 80 SAY 'Dr-Amt' FONT 'FoxFont',11
   		@ R, 100 SAY 'Cr-Amt' FONT 'FoxFont',11
   		@ R, 120 SAY 'More' FONT 'FoxFont',11
   		R= R+1
   		@ R, 1 TO R, 120 DOUBLE

   		R= 8
   		PAGE= 1
	ENDIF


   MANS= 'Y'

			***  Do While Loop  A-3 / vch_ent ***

	** Do while Loop for getting multiline entries of voucher **

   DO WHILE .T.  && THIRD LOOP
      IF MANS='Y'.or.MQES='N'
         MQES= ' '
         R= R+1  && Initialy R = 8
         IF R>19
            PAGE= PAGE+1

			IF _DOS
	            @ 1, 67 SAY PAGE PICTURE '99'
    	        @ 9, 0 CLEAR TO 19, 79  && Clear the body of voucher
			ENDIF
			
			IF _WINDOWS
	            @ 1, 67 SAY PAGE PICTURE '9999' FONT 'FoxFont',11
    	        @ 9, 0 TO 22, 120 CLEAR  && Clear the body of voucher
			ENDIF


            R= 9

         ENDIF

         STORE 0 TO MCODE, MAMOUNT
         STORE 0 TO MC1, MC2, MC3
         STORE SPACE(30) TO MTITLE
*         STORE SPACE(42) TO MDESCRIP, MDESCRIP1
         STORE SPACE(1) TO MDR_CR, MANS

      ENDIF

      MSRNO= 1+MSRNO

      *@ 23, 50 SAY 'Press Esc to Return'

      
      	IF _DOS
      		@ R, 1 SAY MSRNO PICTURE '999'
		ENDIF


      	IF _WINDOWS
      		@ R, 1 SAY MSRNO PICTURE '999' FONT 'FoxFont',11
		ENDIF



      ABC= 0

			***  Do While Loop  A-4 / vch_ent ***



	 DO WHILE ABC=0 && fourth loop A-4


* AMENDMENT MADE ON 22-AUG-2005
********************************


	IF _DOS
			DEFINE WINDOW LdgrPop001;
				FROM 10,25 TO 22,78
	
			ACTIVATE WINDOW LdgrPop001 	

				SELECT * FROM ldgrcode;
					ORDER BY title;
					WHERE C3<>0;
					INTO CURSOR Ldgr0001

			DEFINE POPUP POPUP001 ;
			PROMPT FIELD SPACE(2)+Ldgr0001.title+SPACE(5)+STR(Ldgr0001.C1,2)+"-"+STR(Ldgr0001.C2,2)+"-"+STR(Ldgr0001.C3,3) ;
			SCROLL

			@ 1,1 GET mAccNo ;
 			PICTURE "@&N" ;
			POPUP POPUP001 ;
			SIZE 9,52 ;
			VALID VPOP001();
			DEFAULT " " 
			READ

			DEACTIVATE WINDOW LdgrPop001 	
       		@ R, 5 GET MC1 PICTURE '99'
	ENDIF


* Amending on 6th June, 2006

	IF _WINDOWS
       		@ R, 10 GET MC1 PICTURE '99' FONT 'FoxFont',11
	ENDIF



IF _DOS
         SET COLOR TO /w
ENDIF


		IF _DOS
         @ R, 7 SAY '-'
         @ R, 8 GET MC2 PICTURE '99'
         @ R, 10 SAY '-'
         @ R, 11 GET MC3 PICTURE '999'
         READ
        ENDIF


* Amending at home 05th June, 2006
		IF _WINDOWS
         @ R, 12 SAY '-' FONT 'FoxFont',11
         @ R, 13 GET MC2 PICTURE '99' FONT 'FoxFont',11
         @ R, 15 SAY '-' FONT 'FoxFont',11
         @ R, 16 GET MC3 PICTURE '999' FONT 'FoxFont',11
         READ
        ENDIF


         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
         SET COLOR TO /w
ENDIF


		IF _DOS
         @ R, 5 SAY MPC1 PICTURE '@L 99'
         @ R, 8 SAY MPC2 PICTURE '@L 99'
         @ R, 11 SAY MPC3 PICTURE '@L 999'
		ENDIF

		IF _WINDOWS
         @ R, 8 SAY SPACE(30)
         @ R, 10 SAY MPC1+"-"+MPC2+"-"+MPC3 FONT 'FoxFont',11
		ENDIF


		IF _DOS
         SET COLOR TO 7/1
		ENDIF

         IF READKEY()=12

			IF _DOS
            SET COLOR TO 7/1
			ENDIF

            CLOSE DATA
            CLEAR
            RETURN
         ENDIF

		IF _DOS
         SET COLOR TO 7/1
		ENDIF

         IF _DOS
         @ 23, 50 SAY SPACE(25)
		 ENDIF

         IF _WINDOWS
         @ 23, 50 SAY SPACE(25)
		 ENDIF


		IF _DOS
         SET COLOR TO /w
		ENDIF

         IF MC3=0
            LOOP  && Loop back to FOURTH Do While Loop  A-4 / vch_ent
         ENDIF

         SELECT 5 && master.dbf
         SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)

         IF FOUND()

			** MDATE is Voucher Date
			** DATE is first entry of this account in master file
			**      which is ** Opening Balance ** entry line

            IF MDATE<DATE

               ?? CHR(7)

			IF _DOS
               SET COLOR TO +7/1
			ENDIF

               IF _DOS
               @ 13, 20 SAY 'This Voucher Dated earlier than the Head'
               @ 14, 20 SAY 'Creation Date of this Head Please Correct.'
               @ 15, 20 SAY 'Head Creation Date before Entering this Voucher.'
			   ENDIF

               IF _WINDOWS
               @ 13, 20 SAY 'This Voucher Dated earlier than the Head' FONT 'FoxFont',11
               @ 14, 20 SAY 'Creation Date of this Head Please Correct.' FONT 'FoxFont',11
               @ 15, 20 SAY 'Head Creation Date before Entering this Voucher.' FONT 'FoxFont',11
			   ENDIF


			IF _DOS
               SET COLOR TO 7/1
			ENDIF


			IF _DOS
               @ 17, 25 SAY 'Press Any Key To Continue...'
               A= INKEY(10000000)
			ENDIF


			IF _WINDOWS
               @ 17, 25 SAY 'Press Any Key To Continue...' FONT 'FoxFont',11
               A= INKEY(10000000)
			ENDIF

			IF _DOS
               @ 13, 20 CLEAR TO 18, 69
			ENDIF


			IF _WINDOWS
               @ 13, 20 CLEAR TO , 69
			ENDIF

               EXIT  && Exit from FOURTH Do While Loop  A-4 / vch_ent
               LOOP && When exited FROM FOURTH can not run this line

            ENDIF

         ENDIF

         SELECT 3
         STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE

         SEEK MCODE



	IF _DOS
         IF FOUND()
            
            @ R, 15 SAY TITLE
            STORE TITLE TO MTITLE
         
         ELSE

			IF _DOS
            SET COLOR TO 7/1 
			ENDIF

            ?? CHR(7)
            @ 23, 20 SAY 'This Code Does Not Exist ... Please Re-try '
            WAIT ''

			IF _DOS
            SET COLOR TO 7/1
			ENDIF

            @ 23, 10 SAY SPACE(70)
            SELECT 2
            LOOP && BACK TO FOURTH LOOP A-4
         ENDIF
	ENDIF



* Amending on 06-06-2006
	IF _WINDOWS
         IF FOUND()
            
            @ R, 30 SAY TITLE FONT 'FoxFont',11
            STORE TITLE TO MTITLE
         
         ELSE

			IF _DOS
            SET COLOR TO 7/1 
			ENDIF

            ?? CHR(7)
            @ 23, 20 SAY 'This Code Does Not Exist ... Please Re-try ' FONT 'FoxFont',11
            WAIT ''

			IF _DOS
            SET COLOR TO 7/1
			ENDIF

            @ 23, 10 SAY SPACE(70) FONT 'FoxFont',11
            SELECT 2
            LOOP && BACK TO FOURTH LOOP A-4
         ENDIF
	ENDIF


		IF _DOS
         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
            WAIT ''

			IF _DOS
            SET COLOR TO 7/1
			ENDIF

            @ 23, 10 SAY SPACE(79)
            SELECT 2
            LOOP  && RETURN TO FOURTH LOOP A-4
         ENDIF
        ENDIF
         
		IF _WINDOWS
         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try ' FONT 'FoxFont',11
            WAIT ''

			IF _DOS
            SET COLOR TO 7/1
			ENDIF

            @ 23, 10 SAY SPACE(79) FONT 'FoxFont',11
            SELECT 2
            LOOP  && RETURN TO FOURTH LOOP A-4
         ENDIF
        ENDIF


         ABC= 1

      
      
      ENDDO

			***  End of Do While Loop  A-4 / vch_ent ***

			*** Continuing ... Do While Loop  A-3 / vch_ent ***


		IF _DOS
      	SET COLOR TO 7/1
		ENDIF


IF _DOS
      @ 4, 32 SAY 'Description   ' GET MDESCRIP;
      PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      SIZE 1,30
      
      @ 5, 32 SAY '              ' GET MDESCRIP1;
      PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      SIZE 1,30
      
      READ

ENDIF



IF _WINDOWS
      @ 4, 65 SAY 'Description' FONT 'FoxFont',11
      @ 4, 80 GET MDESCRIP;
      FONT 'FoxFont',11;
      PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      SIZE 1,30
      
      @ 5, 65 SAY '              ' FONT 'FoxFont',11
      @ 5, 80 GET MDESCRIP1;
      FONT 'FoxFont',11;
      PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      SIZE 1,30
      
      READ

ENDIF



	IF _DOS
      SET COLOR TO /w
	ENDIF

      MDR_CR= ' '

			***  Do While Loop  A-5 / vch_ent ***
	IF _DOS
     DO WHILE .not. MDR_CR$'DC'
         @ R, 46 GET MDR_CR PICTURE '@!'
         READ
     ENDDO
	ENDIF




	IF _WINDOWS
     DO WHILE .not. MDR_CR$'DC'
         @ R, 65 GET MDR_CR PICTURE '@!'
         READ
     ENDDO
	ENDIF


			***  End of Do While Loop  A-5 / vch_ent ***

			*** Continuing ... Do While Loop  A-3 / vch_ent ***

      IF MDR_CR='D'
         STORE 'DR' TO MDR_CR
      ELSE
         STORE 'CR' TO MDR_CR
      ENDIF


	IF _DOS
      @ R, 46 SAY MDR_CR PICTURE '!!'

      COL= IIF(MDR_CR='DR',50,62)
	ENDIF


*Current Amending 06-06-2006

	IF _WINDOWS
      @ R, 65 SAY MDR_CR PICTURE '!!' FONT 'FoxFont',11

      COL= IIF(MDR_CR='DR',80,100)
	ENDIF



			***  Do While Loop  A-6 / vch_ent ***


	IF _DOS
      DO WHILE .T.
         @ R, COL GET MAMOUNT PICTURE '999999,999.99'
         READ

* Amendment Made on 11th July,2005 1:07 pm
* for description entering muliline for single item
* to accept 0 entry lines
* ALSO TO ACCEPT EMPTY AMOUNT VOUCERS.

*         IF MAMOUNT<=0
*            LOOP && 6TH LOOP
*         ENDIF


         EXIT
      ENDDO
	ENDIF




	IF _WINDOWS
      DO WHILE .T.
         @ R, COL GET MAMOUNT PICTURE '999999,999.99' FONT 'FoxFont',11
         READ

* Amendment Made on 11th July,2005 1:07 pm
* for description entering muliline for single item
* to accept 0 entry lines
* ALSO TO ACCEPT EMPTY AMOUNT VOUCERS.

*         IF MAMOUNT<=0
*            LOOP && 6TH LOOP
*         ENDIF


         EXIT
      ENDDO
	ENDIF


			***  End of Do While Loop  A-6 / vch_ent ***

			*** Continuing ... Do While Loop  A-3 / vch_ent ***


	IF _DOS
      SET COLOR TO 7/1 
	ENDIF



	IF _DOS
      IF MDR_CR='DR'
         AMT1= AMT1+MAMOUNT
         @ 21, 48 SAY AMT1
         
      ELSE
         AMT2= AMT2+MAMOUNT
         @ 21, 64 SAY AMT2
         
      ENDIF
	ENDIF




	IF _WINDOWS
      IF MDR_CR='DR'
         AMT1= AMT1+MAMOUNT
         @ 29, 80 SAY AMT1 FONT 'FoxFont',11
         
      ELSE
         AMT2= AMT2+MAMOUNT
         @ 29, 100 SAY AMT2 FONT 'FoxFont',11
         
      ENDIF
	ENDIF



      IF MSRNO<>1
         MANS= ' '

			***  Do While Loop  A-7 / vch_ent ***



		IF _DOS
         DO WHILE .not. MANS$'YN'  && SEVENTH LOOP
            MANS= 'Y'
            @ R, 78 GET MANS PICTURE '!'
            READ
         ENDDO
		ENDIF




		IF _WINDOWS
         DO WHILE .not. MANS$'YN'  && SEVENTH LOOP
            MANS= 'Y'
            @ R, 120 GET MANS PICTURE '!' FONT 'FoxFont',11
            READ
         ENDDO
		ENDIF


			***  End of Do While Loop  A-7 / vch_ent ***

			*** Continuing ... Do While Loop  A-3 / vch_ent ***


			IF _DOS
         		SET COLOR TO 7/1
			ENDIF


				*		below ELSE is coming from .........
				*      IF MSRNO<>1
				*         MANS= ' '

      ELSE
         MANS= 'Y'

      ENDIF




      SELECT 1
      USE voucher
					
      IF MANS='Y'
         APPEND BLANK
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
         REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
         REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH MSRNO
         REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH MDR_CR
         REPLACE DESCRIP1 WITH MDESCRIP1
         FLUSH
         LOOP
      ELSE
         APPEND BLANK
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
         REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
         REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH MSRNO
         REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH MDR_CR
         REPLACE DESCRIP1 WITH MDESCRIP1
         FLUSH
      ENDIF
      
      SUM FOR DR_CR='DR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT1
      SUM FOR DR_CR='CR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT2
      


	IF _DOS
      @ 21, 35 CLEAR TO 21, 79
      @ 21, 49 SAY AMT1 PICTURE '9999999,999.99'
      @ 21, 64 SAY AMT2 PICTURE '9999999,999.99'
	ENDIF      
      



	IF _WINDOWS
      @ 29, 1 CLEAR TO 30, 120
      @ 29, 80 SAY AMT1 PICTURE '9999,999,999.99' FONT 'FoxFont',11
      @ 29, 100 SAY AMT2 PICTURE '9999,999,999.99' FONT 'FoxFont',11
	ENDIF      




	IF _DOS
      IF AMT1<>AMT2
         ?? CHR(7)
         @ 23, 15 SAY 'Unbalanced Voucher - Please Correct '
         WAIT ''
         @ 23, 15 SAY SPACE(50)
         MANS= ' '
         @ 10, 0 CLEAR TO 22, 79
         DO V_COR
         IF READKEY()=12

		IF _DOS
            SET COLOR TO 7/1 
		ENDIF

            CLOSE DATA
            CLEAR
            RETURN
         ENDIF
         IF MANS='Y'
            LOOP
         ENDIF
         IF MQES='N'
            LOOP
         ENDIF
      ENDIF
	ENDIF




	IF _WINDOWS
      IF AMT1<>AMT2
         ?? CHR(7)
         @ 29, 15 SAY 'Unbalanced Voucher - Please Correct ' FONT 'FoxFont',11
         WAIT ''
         @ 29, 15 SAY SPACE(70)
         MANS= ' '
         @ 10, 0 CLEAR TO 29, 120
         
         DO V_COR_WIN
         
         
         IF READKEY()=12

			IF _DOS
            SET COLOR TO 7/1 
			ENDIF

            CLOSE DATA
            CLEAR
            RETURN
         ENDIF
         IF MANS='Y'
            LOOP
         ENDIF
         IF MQES='N'
            LOOP
         ENDIF
      ENDIF
	ENDIF




      IF AMT1=AMT2
         COR= ' '


	IF _DOS
         DO WHILE .not. COR$'YN'
            @ 23, 0 SAY SPACE(79)
            @ 23, 30 SAY 'Any Correction Y/N  ' GET COR PICTURE '!'
            READ
         ENDDO
    ENDIF


*Current Amending 02-07-2006 Sunday

	IF _WINDOWS
         DO WHILE .not. COR$'YN'
            @ 29, 0 SAY SPACE(120)
            @ 29, 30 SAY 'Any Correction Y/N  ' FONT 'FoxFont',11
            @ 29, 58 GET COR PICTURE '!' FONT 'FoxFont',11
            READ
         ENDDO
    ENDIF


			*** Continuing ... Do While Loop  A-3 / vch_ent ***




	IF _DOS
         @ 23, 30 SAY SPACE(49)
         IF COR='Y'
            @ 10, 0 CLEAR TO 22, 79
            DO V_COR
            IF READKEY()=12

			IF _DOS
               SET COLOR TO 7/1 
			ENDIF

               CLOSE DATA
               RETURN
            ENDIF
            IF MANS='Y'
               LOOP
            ENDIF
            IF MQES='N'
               LOOP
            ENDIF
         ELSE
            @ 23, 30 SAY SPACE(49)
         ENDIF
	ENDIF




	IF _WINDOWS
         @ 29, 30 SAY SPACE(50)
         IF COR='Y'
            @ 10, 0 CLEAR TO 29, 120
            DO V_COR_WIN
            IF READKEY()=12

			IF _DOS
               SET COLOR TO 7/1 
			ENDIF

               CLOSE DATA
               RETURN
            ENDIF
            IF MANS='Y'
               LOOP
            ENDIF
            IF MQES='N'
               LOOP
            ENDIF
         ELSE
            @ 29, 30 SAY SPACE(50)
         ENDIF
	ENDIF

   IF READKEY()=12  && If Esc key is pressed
      CLEAR
      CLOSE DATA
      CLOSE ALL
      RETURN
   ENDIF

         SELECT 1
         USE

         SELECT 2
         USE tran ORDER tranent

         APPEND FROM voucher FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
         FLUSH

         USE
         SELECT 4
         USE tran-key ORDER key
         SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
         IF FOUND()
            REPLACE FLAG WITH 'Y'
         ENDIF
         USE
         SELECT 1
         USE voucher
         ZAP
         USE
         EXIT
      ENDIF


   ENDDO

			***  End of Do While Loop  A-3 / vch_ent ***


			*** Continuing ... Do While Loop  A-1 / vch_ent ***

   ANS= ' '

	IF _DOS
   		DO WHILE .not. ANS$'YN'
      		@ 23, 0 SAY SPACE(79)
      		@ 23, 27 SAY 'More Vouchers To Enter - Y/N  ' GET ANS PICTURE '!'
      		READ
   		ENDDO
	ENDIF

*Current Amending 04-07-2006 Tuesday

	IF _WINDOWS
   		DO WHILE .not. ANS$'YN'
      		@ 29, 0 SAY SPACE(50)
      		@ 29, 27 SAY 'More Vouchers To Enter - Y/N  ' FONT 'FoxFont',11
      		@ 29, 65 GET ANS PICTURE '!' FONT 'FoxFont',11
      		READ
   		ENDDO
	ENDIF



   IF ANS='Y'
      LOOP && Loop Back to Do While Loop A-1 / vch_ent
   ELSE
      EXIT && Exit from Do While Loop  A-1 / vch_ent
   ENDIF


ENDDO
				***  End of Do While Loop  A-1 / vch_ent ***



CLEAR
CLOSE ALL

IF _DOS
 *SET CLOCK ON
 *SET CLOCK TO 24,68
ELSE
 *SET CLOCK ON
 *SET CLOCK TO 29,100
ENDIF

RETURN
******************



***************************************
* 2 - Vouchers ....... Entry - 2 	  *
***************************************
PROCEDURE vch2_ent
*********************


CLEAR
CLOSE ALL
SET EXCLUSIVE ON
SET DATE brit

 *SET CLOCK ON
 *SET CLOCK TO 24,68


IF _DOS
SET COLOR TO 7/1
ENDIF

SET DELETED ON
CLEAR
@ 2, 20 SAY 'Re-indexing Data Files  ....  Please wait'
SELECT 3
USE ldgrcode ORDER ac1
SELECT 4
USE tran-key ORDER key
SELECT 5
USE master 
INDEX ON STR(C1,2)+STR(C2,2)+STR(C3,3) TAG ac2 
SET ORDER TO ac2

DECLARE MAVT( 7)
MAVT( 1)= 'CR'
MAVT( 2)= 'CP'
MAVT( 3)= 'BR'
MAVT( 4)= 'BP'
MAVT( 5)= 'JV'
MAVT( 6)= 'SV'
MAVT( 7)= 'PV'

STORE DATE() TO MDATE
STORE SPACE(1) TO COR, CANS, MQES
STORE 0 TO MC1, MC2, MC3, M1, M2, M3, MV_NO

DO WHILE .T.
   IF COR<>'Y'
      PAGE= 1
      CLEAR
      COR= ' '
      MVCH1= '  '
      MVCH2= '    '
      STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
      STORE 0 TO MC1, MC2, MC3, MVCH_NO1, MVCH_NO2
      STORE SPACE(30) TO MTITLE
      STORE SPACE(42) TO MDESCRIP, MDESCRIP1
      M= 6
      L= 16
      STORE SPACE(2) TO MDR_CR
      STORE 0 TO MVCH_TYPE, AMT1, AMT2
   ENDIF
   R= 1
   @ 2, 1 TO 2, 79 DOUBLE
   @ 21, 1 TO 21, 79 DOUBLE
   @ 1, 30 SAY 'VOUCHER  ENTRY'
   @ 1, 60 SAY 'PAGE #'
   @ 1, 67 SAY PAGE PICTURE '99'
   @ 23, 50 SAY 'Press Esc to Return'
   R= 3
   @ R, 1 SAY 'A/c Code .. '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 15 SAY '  -  -   '

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ R, 15 GET MC1 PICTURE '99'
   @ R, 18 GET MC2 PICTURE '99'
   @ R, 21 GET MC3 PICTURE '999'
   READ
   IF READKEY()=12
      CLEAR
      CLOSE DATA
      CLOSE ALL
      RETURN
   ENDIF
   @ 23, 40 CLEAR TO 23, 79
   IF MC3=0
      LOOP
   ENDIF
   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 15 SAY MPC1 PICTURE '99'
   @ R, 18 SAY MPC2 PICTURE '99'
   @ R, 21 SAY MPC3 PICTURE '999'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 3
   STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
   SEEK MCODE
   IF FOUND()
      CTITLE= TITLE

IF _DOS
      SET COLOR TO /w
ENDIF

      @ R, 31 SAY CTITLE

IF _DOS
      SET COLOR TO 7/1
ENDIF

   ELSE

IF _DOS
      SET COLOR TO 7/1
ENDIF

      @ 23, 20 SAY 'This Code Does Not Exist ... Please Re-try '

IF _DOS
      SET COLOR TO 7/1
ENDIF

      ? CHR(7)
      A= INKEY(200000)
      @ 23, 10 CLEAR TO 23, 79
      LOOP
   ENDIF
   SELECT 1
   DO WHILE .not. MDR_CR$'DRCR'
      @ R, 65 SAY 'Dr/Cr  ' GET MDR_CR FUNCTION '!'
      READ
   ENDDO
   DO chk IN tbl_proc.prg
   @ R+2, 1 SAY 'Voucher Type' GET MVCH_TYPE PICTURE '9'
   @ 22, 45 CLEAR TO 22, 79
   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

IF _DOS
   SET COLOR TO /w 
ENDIF

   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   READ
   IF MVCH_TYPE=0
      LOOP
   ENDIF
   IF MVCH_TYPE>=8
      @ R, 30 SAY SPACE(75)
      @ R, 55 SAY '  '
      @ R, 30 SAY 'No such Voucher type exist -- Press any key'
      WAIT ''
      @ R, 30 SAY SPACE(75)
      LOOP
   ENDIF

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R+2, 16 SAY MAVT(MVCH_TYPE)

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ R+3, 1 TO R+3, 79 DOUBLE
   @ 21, 1 CLEAR TO 24, 79
   COR= ' '
   DO WHILE .not. COR$'YN'
      COR= 'N'
      @ 23, 30 SAY 'Any Correction Y/N  ' GET COR PICTURE '!'
      READ
   ENDDO
   @ 23, 30 SAY SPACE(49)
   IF COR='Y'
      @ 9, 0 CLEAR TO 22, 77
      LOOP
      IF READKEY()=12

IF _DOS
         SET COLOR TO 7/1
ENDIF

         CLOSE DATA
         RETURN
      ENDIF
   ENDIF
   R= 7
   IF MDR_CR='CR'
      @ R, 1 SAY 'Sr  Vch-No      Date    Debit Code   Description                        Amount'
   ELSE
      @ R, 1 SAY 'Sr  Vch-No      Date    Credit Code  Description                       Amount'
   ENDIF
   R= R+1
   PAGE= 1
   MANS= 'Y'
   MSRNO= 1
   MS= 1
   DO WHILE .T.
      IF R>19
         PAGE= PAGE+1
         @ 1, 67 SAY PAGE PICTURE '99'
         @ 8, 0 CLEAR TO 19, 79
         R= 8
      ENDIF
      IF COR<>'Y'
         STORE 0 TO MCODE, MAMOUNT, CNT
         STORE SPACE(30) TO DTITLE
         STORE SPACE(1) TO MANS
      ENDIF

IF _DOS
      SET COLOR TO 7/1
ENDIF

      @ R, 0 SAY MS PICTURE '999'
      ABC= 0
      DO WHILE ABC=0
         @ 23, 50 SAY 'Press Esc to Return'

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 5 SAY MAVT(MVCH_TYPE)
         @ R, 7 SAY '-  -     '

IF _DOS
         SET COLOR TO 7/1        
ENDIF

         @ R, 8 GET MVCH_NO1 PICTURE '@z 99'
         READ
         IF READKEY()=12
            CLEAR
            CLOSE ALL
            RETURN
         ENDIF
         @ 23, 50 SAY SPACE(26)
         IF MVCH_NO1=0
            LOOP
         ENDIF
         MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 8 SAY MVCH1

IF _DOS
         SET COLOR TO 7/1   
ENDIF

         SELECT 4
         USE tran-key ORDER key
         SET FILTER TO VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1
         GOTO BOTTOM
         IF CNT=0
            MVCH_NO2= VCH_NO2+1
         ENDIF
         @ R, 11 GET MVCH_NO2 PICTURE '@z 99999'
         READ
         IF MVCH_NO2=0
            LOOP
         ENDIF
         MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 11 SAY MVCH2

IF _DOS
         SET COLOR TO 7/1
ENDIF

         SELECT 4
         SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
         IF CNT=0
            IF FOUND()
               ?? CHR(7)
               @ 23, 1 SAY SPACE(78)
               @ 23, 15 SAY 'This Voucher Already Exists  -- Press any key'
               WAIT ''
               @ 23, 10 SAY SPACE(75)
               LOOP
            ELSE
               APPEND BLANK
               REPLACE VCH_TYPE WITH MVCH_TYPE
               REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
               FLUSH
               CNT= 1
            ENDIF
         ENDIF
         ABC= 1
      ENDDO
      SELECT 4
      USE
      @ R, 17 GET MDATE
      ABC= 0
      DO WHILE ABC=0

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 26 SAY '  -  -   '

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ R, 26 GET M1 PICTURE '99'
         @ R, 29 GET M2 PICTURE '99'
         @ R, 32 GET M3 PICTURE '999'
         READ
         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(M1))))+LTRIM(STR(M1))
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(M2))))+LTRIM(STR(M2))
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(M3))))+LTRIM(STR(M3))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 26 SAY MPC1 PICTURE '99'
         @ R, 29 SAY MPC2 PICTURE '99'
         @ R, 32 SAY MPC3 PICTURE '999'

IF _DOS
         SET COLOR TO 7/1
ENDIF

         SELECT 5
         SEEK STR(C1,2)+STR(C2,2)+STR(C3,3)
         IF FOUND()
            IF MDATE<DATE
               SAVE SCREEN TO AA

IF _DOS
               SET COLOR TO +7/1
ENDIF

               @ 14, 18 SAY '                                                     '
               @ 15, 18 SAY '   This Voucher Dated earlier than the Head          '
               @ 16, 18 SAY '   creation Date of this Head Please Correct.        '
               @ 17, 18 SAY '   Head Creation Date before Entering this Voucher.  '
               @ 18, 18 SAY '                                                     '

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 19, 25 SAY 'Press Any Key To Continue...'
               A= INKEY(10000000)
               RESTORE SCREEN FROM AA
               LOOP
            ENDIF
         ENDIF

IF _DOS
         SET COLOR TO /w
ENDIF

         IF READKEY()=12

IF _DOS
            SET COLOR TO 7/1
ENDIF

            CLOSE DATA
            CLEAR
            RETURN
         ENDIF
         IF M3=0
            LOOP
         ENDIF
         SELECT 3
         STORE STR(M1,2)+STR(M2,2)+STR(M3,3) TO MCODE
         SEEK MCODE
         IF FOUND()
            @ R, 36 SAY LEFT(TITLE,26)
            STORE TITLE TO DTITLE
         ELSE
            ?? CHR(7)

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 20 SAY 'This Code Does Not Exist ... Please Re-try '
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 11 SAY SPACE(70)
            SELECT 2
            LOOP
         ENDIF
         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(79)
            SELECT 2
            LOOP
         ENDIF
         ABC= 1
      ENDDO
      SELECT 1

IF _DOS
      SET COLOR TO 7/1
ENDIF

      @ 4, 15 SAY 'Description '
      @ 4, 31 GET MDESCRIP
      @ 5, 31 GET MDESCRIP1
      READ
      DO WHILE .T.
         @ R, 65 GET MAMOUNT PICTURE '999,999,999.99'
         READ
         IF MAMOUNT<=0
            LOOP
         ENDIF
         EXIT
      ENDDO
      COR= 'N'
      @ 23, 30 SAY 'Any Correction Y/N  ' GET COR PICTURE 'Y'
      READ
      IF UPPER(COR)='Y'
         @ 23, 30 SAY SPACE(49)
         LOOP
      ENDIF
      IF UPPER(COR)='N'
         SELECT 1
         USE voucher
         IF MDR_CR='CR'
            APPEND BLANK
            REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
            REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
            REPLACE C1 WITH M1, C2 WITH M2, C3 WITH M3
            REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH 1
            REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH 'DR'
            REPLACE DESCRIP1 WITH MDESCRIP1
            APPEND BLANK
            REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
            REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
            REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
            REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH 2
            REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH 'CR'
            REPLACE DESCRIP1 WITH MDESCRIP1
         ENDIF
         IF MDR_CR='DR'
            APPEND BLANK
            REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
            REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
            REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
            REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH 1
            REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH 'DR'
            REPLACE DESCRIP1 WITH MDESCRIP1
            APPEND BLANK
            REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
            REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
            REPLACE C1 WITH M1, C2 WITH M2, C3 WITH M3
            REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH 2
            REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH 'CR'
            REPLACE DESCRIP1 WITH MDESCRIP1
         ENDIF
         MSRNO= MSRNO+1
      ENDIF
      SELECT 1
      USE
      SELECT 2
      USE tran ORDER tranent
      APPEND FROM voucher FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      FLUSH
      USE
      SELECT 4
      USE tran-key ORDER key
      SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
      IF FOUND()
         REPLACE FLAG WITH 'Y'
      ENDIF
      USE
      SELECT 1
      USE voucher
      ZAP
      IF UPPER(COR)='N'
         AN= 'Y'
         @ 23, 25 SAY 'More Data For This Credit Code Y/N  ' GET AN PICTURE 'Y'
         READ
         @ 23, 25 SAY SPACE(40)
         IF UPPER(AN)='Y'
            R= R+1
            MS= MS+1
            MSRNO= MSRNO+1
            STORE 0 TO MAMOUNT, M3
            STORE SPACE(30) TO MTITLE
            STORE SPACE(42) TO MDESCRIP, MDESCRIP1
            @ 23, 25 SAY SPACE(40)
            LOOP
         ENDIF
      ENDIF
      EXIT
   ENDDO
   ANS= ' '
   DO WHILE .not. ANS$'YN'
      @ 23, 30 SAY 'Any More Data Y/N  ' GET ANS PICTURE '!'
      READ
   ENDDO
   IF ANS='N'
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
ENDDO
CLEAR
CLOSE DATA
 *SET CLOCK ON
 *SET CLOCK TO 24,68


RETURN
*********************




********************
PROCEDURE V_COR
********************

 *SET CLOCK ON
 *SET CLOCK TO 24,68


SELECT 1
GOTO TOP

MREC2= RECNO()

DO vdisp

GOTO TOP

MREC2= RECNO()

R= 8

DO WHILE .T.

   R= R+1


   IF R>19
      PAGE= PAGE+1
      @ 2, 67 SAY PAGE PICTURE '999'
      @ 9, 0 CLEAR TO 19, 79
      R= 9
      IF .not. EOF()

         MREC2= RECNO()
         
         DO vdisp
         
         GOTO MREC2
         
         R= 9
      
      ENDIF
   
   ENDIF
   
   SELECT 1

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 50 SAY 'Press Ctrl Q To Return'
   @ 23, 1 SAY "'D' Delete - 'C' Change -  'N' Next "
   MQES= 'N'

   @ R, 0 GET MQES PICTURE '!' VALID MQES='D'.or.MQES='C'.or.MQES='N'
   READ

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 1 CLEAR TO 23, 77

   IF MQES='D'
      SELECT 1
      DELETE
   ENDIF

   IF MQES='N'
      SELECT 1

      IF .not. EOF()
         MSR_NO= SR_NO
         SKIP
         LOOP
      ENDIF

      IF EOF()

         SELECT 1
         @ 23, 50 SAY 'Press Ctrl Q To Return'

         STORE SPACE(30) TO MTITLE
         STORE SPACE(42) TO MDESCRIP, MDESCRIP1

         STORE 0 TO MC1, MC2, MC3, MAMOUNT
         GOTO BOTTOM

         MSR_NO= SR_NO+1

         DO WHILE .T.

            @ R, 1 SAY MSR_NO PICTURE '999'
            @ R, 5 GET MC1 PICTURE '99'

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 7 SAY '-'
            @ R, 8 GET MC2 PICTURE '99'
            @ R, 10 SAY '-'
            @ R, 11 GET MC3 PICTURE '999'
            READ

            MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
            MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
            MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 5 SAY MPC1 PICTURE '99'
            @ R, 8 SAY MPC2 PICTURE '99'
            @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 50 SAY SPACE(35)
            IF READKEY()=12

IF _DOS
               SET COLOR TO 7/1
ENDIF

               SELECT 1
               ZAP
               CLEAR
               RETURN
            ENDIF

            IF MC3=0
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF

            SELECT 3
            STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE

            SEEK MCODE

            IF FOUND()

IF _DOS
               SET COLOR TO /w
ENDIF

               @ R, 15 SAY TITLE
               STORE TITLE TO MTITLE

IF _DOS
               SET COLOR TO 7/1 
ENDIF

            ELSE
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF

            IF LOCK='Y'
               ?? CHR(7)
               @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(79)
               LOOP
            ENDIF

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 5, 32 SAY 'Description   ' GET MDESCRIP;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

            @ 5, 32 SAY 'Description   ' GET MDESCRIP1;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"            
            READ

IF _DOS
            SET COLOR TO /w
ENDIF

            MDR_CR= ' '

            DO WHILE .not. MDR_CR$'DC'
               @ R, 46 GET MDR_CR PICTURE '!!'
               READ
            ENDDO

            IF MDR_CR='D'
               STORE 'DR' TO MDR_CR
            ELSE
               STORE 'CR' TO MDR_CR
            ENDIF

            @ R, 46 SAY MDR_CR PICTURE '!!'
            COL= IIF(MDR_CR='DR',50,62)

            MT= 0

            DO WHILE MT=0
               @ R, COL GET MAMOUNT PICTURE '999999,999.99'
               READ


* CHANGES MADE ON 11TH JULY
* TO ACCEPT EMPTY AMOUNT VOUCHERS

*               IF MAMOUNT<=0
*                  LOOP
*               ENDIF

               MT= 1

            ENDDO

            EXIT

         ENDDO


         SELECT 1
         APPEND BLANK
         REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
         REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH MSR_NO
         REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH MDR_CR
         REPLACE DESCRIP1 WITH MDESCRIP1
         FLUSH
      ENDIF

   ENDIF

   IF MQES='C'
      DO WHILE .T.
         SELECT 1
         MC1= C1
         MC2= C2
         MC3= C3

         MDESCRIP= DESCRIP
         MDESCRIP1= DESCRIP1

         MAMOUNT= AMOUNT
         MDR_CR= DR_CR

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ R, 1 SAY SR_NO PICTURE '999'
         @ R, 5 GET MC1 PICTURE '99'

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 7 SAY '-'
         @ R, 8 GET MC2 PICTURE '99'
         @ R, 10 SAY '-'
         @ R, 11 GET MC3 PICTURE '999'
         READ

         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 5 SAY MPC1 PICTURE '99'
         @ R, 8 SAY MPC2 PICTURE '99'
         @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
         SET COLOR TO 7/1 
ENDIF

         @ 23, 50 SAY SPACE(35)
         IF READKEY()=12

IF _DOS
            SET COLOR TO 7/1
ENDIF

            SELECT 1
            ZAP
            CLEAR
            RETURN
         ENDIF

         IF MC3=0
            ?? CHR(7)
            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF

         SELECT 3
         STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
         SEEK MCODE
         IF FOUND()

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 15 SAY TITLE
            STORE TITLE TO MTITLE

IF _DOS
            SET COLOR TO 7/1 
ENDIF

         ELSE
            ?? CHR(7)

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF

         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(79)
            LOOP
         ENDIF

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 5, 32 SAY 'Description   ' GET MDESCRIP;
         PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         SIZE 1,30
         
         READ

         @ 5, 32 SAY 'Description   ' GET MDESCRIP1;
         PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         SIZE 1,30

         READ

IF _DOS
         SET COLOR TO /w
ENDIF

         DO WHILE .not. MDR_CR$'DC'
            @ R, 46 GET MDR_CR PICTURE '!!'
            READ
            EXIT
         ENDDO
         IF MDR_CR='D'
            STORE 'DR' TO MDR_CR
         ELSE
            STORE 'CR' TO MDR_CR
         ENDIF
         COL= IIF(MDR_CR='DR',50,62)
         DO WHILE .T.

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ R, 50 SAY SPACE(28)

IF _DOS
            SET COLOR TO /w 
ENDIF

            @ R, COL GET MAMOUNT PICTURE '999999,999.99'
            READ

* Amended on 11th July 2005
* for accepting Empty entries in voucher
* for the problem of Sohni Traders
* geting multiline Description of single entry

*            IF MAMOUNT<=0
*               LOOP
*            ENDIF

            EXIT


         ENDDO
         EXIT


      ENDDO

      SELECT 1
      REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
      REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
      REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3, DR_CR WITH MDR_CR
      REPLACE DESCRIP WITH MDESCRIP, AMOUNT WITH MAMOUNT
      REPLACE DESCRIP1 WITH MDESCRIP1
      FLUSH

   ENDIF

   SELECT 1

   MANS= ' '

   DO WHILE .not. MANS$'YN'

IF _DOS
      SET COLOR TO 7/1 
ENDIF

      @ R, 78 GET MANS PICTURE '!'
      READ
   ENDDO

   IF MANS='Y'
      IF .not. EOF()
         SKIP
      ENDIF
   ENDIF

   IF MANS='N'

IF _DOS
      SET COLOR TO 7/1
ENDIF

      SUM FOR DR_CR='DR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT1
      SUM FOR DR_CR='CR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT2

      @ 21, 49 SAY AMT1 PICTURE '9999999,999.99'
      @ 21, 64 SAY AMT2 PICTURE '9999999,999.99'

      SELECT 1

      IF AMT1<>AMT2
         ?? CHR(7)

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 23, 0 CLEAR TO 23, 77
         @ 23, 15 SAY 'Unbalanced Voucher - Please Correct '
         WAIT ''
         @ 23, 15
         @ 10, 0 CLEAR TO 23, 79
         SELECT 1
         GOTO TOP
         MREC2= RECNO()

         DO vdisp

         SELECT 1

         GOTO TOP

         MREC2= RECNO()
         R= 8
         LOOP
      ENDIF

      SELECT 1
      GOTO MREC2
      MSRNO= 0

      DO WHILE .not. EOF()
         MSRNO= MSRNO+1
         REPLACE SR_NO WITH MSRNO
         SKIP
      ENDDO

      MANS= ' '
      MQES= ' '
      EXIT
   ENDIF
ENDDO

IF _DOS
 *SET CLOCK ON
 *SET CLOCK TO 24,68
ELSE
	*SET CLOCK TO 29,100
ENDIF
RETURN
*************************




********************
PROCEDURE V_COR_WIN
********************

 *SET CLOCK ON
 *SET CLOCK TO 24,68


SELECT 1
GOTO TOP

MREC2= RECNO()

DO vdisp

GOTO TOP

MREC2= RECNO()

R= 8

DO WHILE .T.

   R= R+1


   IF R>19
      PAGE= PAGE+1
      @ 2, 67 SAY PAGE PICTURE '999'
      @ 9, 0 CLEAR TO 19, 79
      R= 9
      IF .not. EOF()

         MREC2= RECNO()
         
         DO vdisp
         
         GOTO MREC2
         
         R= 9
      
      ENDIF
   
   ENDIF
   
   SELECT 1

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 50 SAY 'Press Ctrl Q To Return'
   @ 23, 1 SAY "'D' Delete - 'C' Change -  'N' Next "
   MQES= 'N'

   @ R, 0 GET MQES PICTURE '!' VALID MQES='D'.or.MQES='C'.or.MQES='N'
   READ

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 1 CLEAR TO 23, 77

   IF MQES='D'
      SELECT 1
      DELETE
   ENDIF

   IF MQES='N'
      SELECT 1

      IF .not. EOF()
         MSR_NO= SR_NO
         SKIP
         LOOP
      ENDIF

      IF EOF()

         SELECT 1
         @ 23, 50 SAY 'Press Ctrl Q To Return'

         STORE SPACE(30) TO MTITLE
         STORE SPACE(42) TO MDESCRIP, MDESCRIP1

         STORE 0 TO MC1, MC2, MC3, MAMOUNT
         GOTO BOTTOM

         MSR_NO= SR_NO+1

         DO WHILE .T.

            @ R, 1 SAY MSR_NO PICTURE '999'
            @ R, 5 GET MC1 PICTURE '99'

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 7 SAY '-'
            @ R, 8 GET MC2 PICTURE '99'
            @ R, 10 SAY '-'
            @ R, 11 GET MC3 PICTURE '999'
            READ

            MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
            MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
            MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 5 SAY MPC1 PICTURE '99'
            @ R, 8 SAY MPC2 PICTURE '99'
            @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 50 SAY SPACE(35)
            IF READKEY()=12

IF _DOS
               SET COLOR TO 7/1
ENDIF

               SELECT 1
               ZAP
               CLEAR
               RETURN
            ENDIF

            IF MC3=0
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF

            SELECT 3
            STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE

            SEEK MCODE

            IF FOUND()

IF _DOS
               SET COLOR TO /w
ENDIF

               @ R, 15 SAY TITLE
               STORE TITLE TO MTITLE

IF _DOS
               SET COLOR TO 7/1 
ENDIF

            ELSE
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF

            IF LOCK='Y'
               ?? CHR(7)
               @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(79)
               LOOP
            ENDIF

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 5, 32 SAY 'Description   ' GET MDESCRIP;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

            @ 5, 32 SAY 'Description   ' GET MDESCRIP1;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"            
            READ

IF _DOS
            SET COLOR TO /w
ENDIF

            MDR_CR= ' '

            DO WHILE .not. MDR_CR$'DC'
               @ R, 46 GET MDR_CR PICTURE '!!'
               READ
            ENDDO

            IF MDR_CR='D'
               STORE 'DR' TO MDR_CR
            ELSE
               STORE 'CR' TO MDR_CR
            ENDIF

            @ R, 46 SAY MDR_CR PICTURE '!!'
            COL= IIF(MDR_CR='DR',50,62)

            MT= 0

            DO WHILE MT=0
               @ R, COL GET MAMOUNT PICTURE '999999,999.99'
               READ


* CHANGES MADE ON 11TH JULY
* TO ACCEPT EMPTY AMOUNT VOUCHERS

*               IF MAMOUNT<=0
*                  LOOP
*               ENDIF

               MT= 1

            ENDDO

            EXIT

         ENDDO


         SELECT 1
         APPEND BLANK
         REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
         REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH MSR_NO
         REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH MDR_CR
         REPLACE DESCRIP1 WITH MDESCRIP1
         FLUSH
      ENDIF

   ENDIF

   IF MQES='C'
      DO WHILE .T.
         SELECT 1
         MC1= C1
         MC2= C2
         MC3= C3

         MDESCRIP= DESCRIP
         MDESCRIP1= DESCRIP1

         MAMOUNT= AMOUNT
         MDR_CR= DR_CR

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ R, 1 SAY SR_NO PICTURE '999'
         @ R, 5 GET MC1 PICTURE '99'

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 7 SAY '-'
         @ R, 8 GET MC2 PICTURE '99'
         @ R, 10 SAY '-'
         @ R, 11 GET MC3 PICTURE '999'
         READ

         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 5 SAY MPC1 PICTURE '99'
         @ R, 8 SAY MPC2 PICTURE '99'
         @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
         SET COLOR TO 7/1 
ENDIF

         @ 23, 50 SAY SPACE(35)
         IF READKEY()=12

IF _DOS
            SET COLOR TO 7/1
ENDIF

            SELECT 1
            ZAP
            CLEAR
            RETURN
         ENDIF

         IF MC3=0
            ?? CHR(7)
            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF

         SELECT 3
         STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
         SEEK MCODE
         IF FOUND()

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 15 SAY TITLE
            STORE TITLE TO MTITLE

IF _DOS
            SET COLOR TO 7/1 
ENDIF

         ELSE
            ?? CHR(7)

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF

         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(79)
            LOOP
         ENDIF

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 5, 32 SAY 'Description   ' GET MDESCRIP;
         PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         SIZE 1,30
         
         READ

         @ 5, 32 SAY 'Description   ' GET MDESCRIP1;
         PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
         SIZE 1,30

         READ

IF _DOS
         SET COLOR TO /w
ENDIF

         DO WHILE .not. MDR_CR$'DC'
            @ R, 46 GET MDR_CR PICTURE '!!'
            READ
            EXIT
         ENDDO
         IF MDR_CR='D'
            STORE 'DR' TO MDR_CR
         ELSE
            STORE 'CR' TO MDR_CR
         ENDIF
         COL= IIF(MDR_CR='DR',50,62)
         DO WHILE .T.

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ R, 50 SAY SPACE(28)

IF _DOS
            SET COLOR TO /w 
ENDIF

            @ R, COL GET MAMOUNT PICTURE '999999,999.99'
            READ

* Amended on 11th July 2005
* for accepting Empty entries in voucher
* for the problem of Sohni Traders
* geting multiline Description of single entry

*            IF MAMOUNT<=0
*               LOOP
*            ENDIF

            EXIT


         ENDDO
         EXIT


      ENDDO

      SELECT 1
      REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
      REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
      REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3, DR_CR WITH MDR_CR
      REPLACE DESCRIP WITH MDESCRIP, AMOUNT WITH MAMOUNT
      REPLACE DESCRIP1 WITH MDESCRIP1
      FLUSH

   ENDIF

   SELECT 1

   MANS= ' '

   DO WHILE .not. MANS$'YN'

IF _DOS
      SET COLOR TO 7/1 
ENDIF

      @ R, 78 GET MANS PICTURE '!'
      READ
   ENDDO

   IF MANS='Y'
      IF .not. EOF()
         SKIP
      ENDIF
   ENDIF

   IF MANS='N'

IF _DOS
      SET COLOR TO 7/1
ENDIF

      SUM FOR DR_CR='DR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT1
      SUM FOR DR_CR='CR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT2

      @ 21, 49 SAY AMT1 PICTURE '9999999,999.99'
      @ 21, 64 SAY AMT2 PICTURE '9999999,999.99'

      SELECT 1

      IF AMT1<>AMT2
         ?? CHR(7)

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 23, 0 CLEAR TO 23, 77
         @ 23, 15 SAY 'Unbalanced Voucher - Please Correct '
         WAIT ''
         @ 23, 15
         @ 10, 0 CLEAR TO 23, 79
         SELECT 1
         GOTO TOP
         MREC2= RECNO()

         DO vdisp

         SELECT 1

         GOTO TOP

         MREC2= RECNO()
         R= 8
         LOOP
      ENDIF

      SELECT 1
      GOTO MREC2
      MSRNO= 0

      DO WHILE .not. EOF()
         MSRNO= MSRNO+1
         REPLACE SR_NO WITH MSRNO
         SKIP
      ENDDO

      MANS= ' '
      MQES= ' '
      EXIT
   ENDIF
ENDDO

IF _DOS
 *SET CLOCK ON
 *SET CLOCK TO 24,68
ELSE
	*SET CLOCK TO 29,100
ENDIF
RETURN
*************************



**************************
PROCEDURE VDISP
**************************

IF _DOS
 *SET CLOCK ON
 *SET CLOCK TO 24,68
ELSE
*SET CLOCK TO 29,100
ENDIF

SELECT 1
USE voucher

GOTO MREC2

SELECT 3
USE ldgrcode ORDER ac1

SELECT 1
R= 9

DO WHILE .not. EOF()
   @ R, 1 SAY SR_NO PICTURE '999'

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 5 SAY C1 PICTURE '99'
   @ R, 7 SAY '-'
   @ R, 8 SAY C2 PICTURE '99'
   @ R, 10 SAY '-'
   @ R, 11 SAY C3 PICTURE '999'

IF _DOS
   SET COLOR TO /w
ENDIF

   STORE C1 TO MC1
   STORE C2 TO MC2
   STORE C3 TO MC3

   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 5 SAY MPC1 PICTURE '99'
   @ R, 8 SAY MPC2 PICTURE '99'
   @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 3
   STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
   SEEK MCODE

   IF FOUND()
      @ R, 15 SAY TITLE
   ENDIF

   SELECT 1

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 5, 32 SAY 'Description   '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 45 SAY ALLTRIM(DESCRIP);
      PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      SIZE 1,30


   @ R, 46 SAY DR_CR PICTURE '@!'
   COL= IIF(DR_CR='DR',50,62)
   @ R, COL SAY AMOUNT PICTURE '999999,999.99'
   SKIP
   R= R+1
   IF R>19

IF _DOS
      SET COLOR TO 7/1
ENDIF

      RETURN
   ENDIF
ENDDO

IF _DOS
SET COLOR TO 7/1
ENDIF


RETURN
*******************


****************************************
* 3 - Vouchers ....... Correction 	   *
****************************************
PROCEDURE vch_cor
********************
CLEAR
CLOSE ALL
SET DELETED ON
SET EXCLUSIVE ON

IF _DOS
 *SET CLOCK ON
 *SET CLOCK TO 24,68
ELSE
*SET CLOCK TO 29,100
ENDIF

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 2, 20 SAY 'Re-indexing Data Files  ....  Please wait'
SELECT 2
USE tran ORDER tranent
SELECT 3
USE ldgrcode ORDER ac1
SELECT 4
USE tran-key ORDER key
SELECT 5
USE master ORDER ac2
DECLARE MAVT( 7)
MAVT( 1)= 'CR'
MAVT( 2)= 'CP'
MAVT( 3)= 'BR'
MAVT( 4)= 'BP'
MAVT( 5)= 'JV'
MAVT( 6)= 'SV'
MAVT( 7)= 'PV'
CANS= ' '
DO WHILE .T.
   IF CANS<>'Y'
      PAGE= 1
      CLEAR
      MVCH1= '  '
      MVCH2= '    '
      STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
      STORE 0 TO MC1, MC2, MC3, MVCH_NO1, MVCH_NO2
      STORE SPACE(30) TO MTITLE
      STORE SPACE(42) TO MDESCRIP
      M= 6
      L= 16
      STORE SPACE(2) TO MDR_CR
      STORE 0 TO MVCH_TYPE, AMT1, AMT2
   ENDIF
   R= 1
   @ 2, 1 TO 2, 79 DOUBLE
   @ 21, 1 TO 21, 79 DOUBLE
   @ 1, 30 SAY 'VOUCHER  CORRECTION '
   @ 1, 60 SAY 'PAGE #'
   @ 1, 67 SAY PAGE PICTURE '99'
   @ 22, 50 SAY 'Press Esc to Return'
   R= 3
   @ 22, 45 CLEAR TO 22, 79
   @ R, 32 SAY 'Voucher Type  ' GET MVCH_TYPE PICTURE '9'
   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

IF _DOS
   SET COLOR TO /w 
ENDIF

   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   READ
   IF MVCH_TYPE=0
      LOOP
   ENDIF
   IF MVCH_TYPE>=8
      @ R, 55 SAY '  '
      @ R, 30 SAY 'No such Voucher type exist -- Press any key'
      WAIT ''
      @ R, 30 SAY SPACE(55)
      LOOP
   ENDIF
   @ 21, 1 CLEAR TO 24, 79

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 52 SAY MAVT(MVCH_TYPE)

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 23, 50 SAY 'Press Esc to Return'
   @ 5, 22 SAY '          '
   @ 5, 5 SAY 'Voucher No '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 17 SAY MAVT(MVCH_TYPE)
   @ 5, 20 SAY '  -     '

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 5, 20 GET MVCH_NO1 PICTURE '@z 99'
   READ
   IF READKEY()=12
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   @ 23, 50 SAY SPACE(26)
   IF MVCH_NO1=0
      LOOP
   ENDIF
   MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 20 SAY MVCH1

IF _DOS
   SET COLOR TO 7/1   
ENDIF

   @ 5, 23 GET MVCH_NO2 PICTURE '@z 99999'
   READ
   IF MVCH_NO2=0
      LOOP
   ENDIF
   MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 23 SAY MVCH2

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 2
   SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
   IF .not. FOUND()
      ?? CHR(7)
      @ 23, 1 SAY SPACE(78)
      @ 23, 15 SAY 'This Voucher No Does Not Exists  -- Press any key'
      WAIT ''
      @ 23, 10 SAY SPACE(75)
      LOOP
   ENDIF
   IF FLAG='Y'
      CLEAR
      @ 12, 15 SAY 'This Voucher has been posted to  Ledger,  therefore '
      @ 13, 15 SAY 'you cannot Change/Correct it.  If you still want to '
      @ 14, 15 SAY 'Change/Correct it, please use UN-POST OPTION first. '
      @ 16, 15 SAY 'Press Any Key to Return ............ '
      WAIT ''
      CLEAR
      CLOSE ALL
      RETURN
   ELSE
      SELECT 2
      USE
      SELECT 1
      USE vch-cor
      MREC2= RECNO()
      APPEND FROM tran FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      SELECT 1
      USE vch-cor
      GOTO MREC2
   ENDIF
   SELECT 1
   @ 3, 5 SAY 'Date       ' GET DATE
   READ
   MDATE= DATE
   R= 5
   R= R+1
   @ R, 1 TO R, 79
   R= R+1
   @ R, 2 SAY 'Sr  Acct-No.  Title                        Dr/Cr   Dr-Amt       Cr-Amt   More'
   R= R+1
   @ R, 1 TO R, 79 DOUBLE
   DO V_COR1
   SELECT 1
   SUM FOR DR_CR='DR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT1
   SUM FOR DR_CR='CR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT2
   IF AMT1=AMT2
      IF READKEY()=12

IF _DOS
         SET COLOR TO 7/1 
ENDIF

         CLOSE DATA
         RETURN
      ENDIF
      SELECT 1
      GOTO MREC2
      REPLACE ALL FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 DATE WITH MDATE
      USE
      SELECT 2
      USE tran ORDER tranent
      DELETE ALL FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      APPEND FROM vch-cor FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      FLUSH
      SELECT 1
      USE vch-cor
      ZAP
      USE
   ENDIF
   ANS= ' '
   DO WHILE .not. ANS$'YN'
      @ 23, 0 CLEAR TO 23, 79
      @ 23, 30 SAY 'Any More Correction Y/N  ' GET ANS PICTURE '!'
      READ
   ENDDO
   IF ANS='Y'
      LOOP
   ELSE
      EXIT
   ENDIF
ENDDO
CLEAR
CLOSE DATA

RETURN
**********************




********************
PROCEDURE V_COR1
********************

 *SET CLOCK ON
 *SET CLOCK TO 24,68


SELECT 1
GOTO TOP
MREC2= RECNO()
DO vdisp1
GOTO TOP
MREC2= RECNO()
R= 8
DO WHILE .T.
   R= R+1
   IF R>19
      PAGE= PAGE+1
      @ 2, 67 SAY PAGE PICTURE '99'
      @ 9, 0 CLEAR TO 19, 79
      R= 9
      IF .not. EOF()
         MREC2= RECNO()
         DO vdisp1
         GOTO MREC2
         R= 9
      ENDIF
   ENDIF
   SELECT 1

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 50 SAY 'Press Ctrl Q To Return'
   @ 23, 1 SAY "'D' Delete - 'C' Change -  'N' Next "
   MQES= 'N'
   @ R, 0 GET MQES PICTURE '!' VALID MQES='D'.or.MQES='C'.or.MQES='N'
   READ

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 1 CLEAR TO 23, 77
   IF MQES='D'
      SELECT 1
      DELETE
   ENDIF
   IF MQES='N'
      SELECT 1
      IF .not. EOF()
         MSR_NO= SR_NO
         SKIP
         LOOP
      ENDIF
      IF EOF()
         SELECT 1
         @ 23, 50 SAY 'Press Ctrl Q To Return'
         STORE 0 TO MC1, MC2, MC3, MAMOUNT
         STORE SPACE(30) TO MTITLE
         STORE SPACE(42) TO MDESCRIP, MDESCRIP1
         GOTO BOTTOM
         MSR_NO= SR_NO+1
         DO WHILE .T.
            @ R, 1 SAY MSR_NO PICTURE '999'
            @ R, 5 GET MC1 PICTURE '99'

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 7 SAY '-'
            @ R, 8 GET MC2 PICTURE '99'
            @ R, 10 SAY '-'
            @ R, 11 GET MC3 PICTURE '999'
            READ
            MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
            MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
            MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 5 SAY MPC1 PICTURE '99'
            @ R, 8 SAY MPC2 PICTURE '99'
            @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 50 SAY SPACE(35)
            IF READKEY()=12

IF _DOS
               SET COLOR TO 7/1
ENDIF

               SELECT 1
               ZAP
               CLEAR
               RETURN
            ENDIF
            IF MC3=0
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF
            SELECT 3
            STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
            SEEK MCODE
            IF FOUND()

IF _DOS
               SET COLOR TO /w
ENDIF

               @ R, 15 SAY TITLE
               STORE TITLE TO MTITLE

IF _DOS
               SET COLOR TO 7/1 
ENDIF

            ELSE
               ?? CHR(7)

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 0 CLEAR TO 23, 77
               @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(60)
               LOOP
            ENDIF
            IF LOCK='Y'
               ?? CHR(7)
               @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
               WAIT ''

IF _DOS
               SET COLOR TO 7/1
ENDIF

               @ 23, 10 SAY SPACE(79)
               LOOP
            ENDIF

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 5, 32 SAY 'Description   ' GET MDESCRIP;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            READ
            @ 5, 32 SAY 'Description   ' GET MDESCRIP1;
            PICTURE "@! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"            
            READ

IF _DOS
            SET COLOR TO /w
ENDIF

            MDR_CR= ' '
            DO WHILE .not. MDR_CR$'DC'
               @ R, 46 GET MDR_CR PICTURE '!!'
               READ
            ENDDO
            IF MDR_CR='D'
               STORE 'DR' TO MDR_CR
            ELSE
               STORE 'CR' TO MDR_CR
            ENDIF
            @ R, 46 SAY MDR_CR PICTURE '!!'
            COL= IIF(MDR_CR='DR',50,62)
            MT= 0
            DO WHILE MT=0
               @ R, COL GET MAMOUNT PICTURE '999999,999.99'
               READ


*               IF MAMOUNT<=0
*                  LOOP
*               ENDIF


               MT= 1
            ENDDO
            EXIT
         ENDDO
         SELECT 1
         APPEND BLANK
         REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
         REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
         REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3
         REPLACE DESCRIP WITH MDESCRIP, SR_NO WITH MSR_NO
         REPLACE AMOUNT WITH MAMOUNT, DR_CR WITH MDR_CR
         REPLACE DESCRIP1 WITH MDESCRIP1
         FLUSH
      ENDIF
   ENDIF
   IF MQES='C'
      DO WHILE .T.
         SELECT 1
         MC1= C1
         MC2= C2
         MC3= C3
         MDESCRIP= DESCRIP
         MDESCRIP1= DESCRIP1
         MAMOUNT= AMOUNT
         MDR_CR= DR_CR

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ R, 1 SAY SR_NO PICTURE '999'
         @ R, 5 GET MC1 PICTURE '99'

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 7 SAY '-'
         @ R, 8 GET MC2 PICTURE '99'
         @ R, 10 SAY '-'
         @ R, 11 GET MC3 PICTURE '999'
         READ
         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
         SET COLOR TO /w
ENDIF

         @ R, 5 SAY MPC1 PICTURE '99'
         @ R, 8 SAY MPC2 PICTURE '99'
         @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
         SET COLOR TO 7/1 
ENDIF

         @ 23, 50 SAY SPACE(35)
         IF READKEY()=12

IF _DOS
            SET COLOR TO 7/1
ENDIF

            SELECT 1
            ZAP
            CLEAR
            RETURN
         ENDIF
         IF MC3=0
            ?? CHR(7)
            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'You Can Not Post in Consolided Head - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF
         SELECT 3
         STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
         SEEK MCODE
         IF FOUND()

IF _DOS
            SET COLOR TO /w
ENDIF

            @ R, 15 SAY TITLE
            STORE TITLE TO MTITLE

IF _DOS
            SET COLOR TO 7/1 
ENDIF

         ELSE
            ?? CHR(7)

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 0 CLEAR TO 23, 77
            @ 23, 17 SAY 'Code Does Not Exist In File - Retry'
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(60)
            LOOP
         ENDIF
         IF LOCK='Y'
            ?? CHR(7)
            @ 23, 13 SAY 'This Code Has Been Defined As Lock ... Please Re-try '
            WAIT ''

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ 23, 10 SAY SPACE(79)
            LOOP
         ENDIF

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 5, 32 SAY 'Description   ' GET MDESCRIP
         READ
         @ 5, 32 SAY 'Description   ' GET MDESCRIP1
         READ

IF _DOS
         SET COLOR TO /w
ENDIF

         DO WHILE .not. MDR_CR$'DC'
            @ R, 46 GET MDR_CR PICTURE '!!'
            READ
            EXIT
         ENDDO
         IF MDR_CR='D'
            STORE 'DR' TO MDR_CR
         ELSE
            STORE 'CR' TO MDR_CR
         ENDIF
         COL= IIF(MDR_CR='DR',50,62)
         DO WHILE .T.

IF _DOS
            SET COLOR TO 7/1
ENDIF

            @ R, 50 SAY SPACE(28)

IF _DOS
            SET COLOR TO /w 
ENDIF

            @ R, COL GET MAMOUNT PICTURE '999999,999.99'
            READ

*            IF MAMOUNT<=0
*               LOOP
*            ENDIF

            EXIT
         ENDDO
         EXIT
      ENDDO
      SELECT 1
      REPLACE DATE WITH MDATE, VCH_TYPE WITH MVCH_TYPE
      REPLACE VCH_NO1 WITH MVCH_NO1, VCH_NO2 WITH MVCH_NO2
      REPLACE C1 WITH MC1, C2 WITH MC2, C3 WITH MC3, DR_CR WITH MDR_CR
      REPLACE DESCRIP WITH MDESCRIP, AMOUNT WITH MAMOUNT
      REPLACE DESCRIP1 WITH MDESCRIP1
      FLUSH
   ENDIF
   SELECT 1
   MANS= ' '
   DO WHILE .not. MANS$'YN'

IF _DOS
      SET COLOR TO 7/1 
ENDIF

      @ R, 78 GET MANS PICTURE '!'
      READ
   ENDDO
   IF MANS='Y'
      IF .not. EOF()
         SKIP
      ENDIF
   ENDIF
   IF MANS='N'

IF _DOS
      SET COLOR TO 7/1
ENDIF

      SUM FOR DR_CR='DR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT1
      SUM FOR DR_CR='CR'.and.VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2 AMOUNT TO AMT2
      @ 21, 49 SAY AMT1 PICTURE '9999999,999.99'
      @ 21, 64 SAY AMT2 PICTURE '9999999,999.99'
      SELECT 1
      IF AMT1<>AMT2
         ?? CHR(7)

IF _DOS
         SET COLOR TO 7/1
ENDIF

         @ 23, 0 CLEAR TO 23, 77
         @ 23, 15 SAY 'Unbalanced Voucher - Please Correct '
         WAIT ''
         @ 23, 15
         @ 10, 0 CLEAR TO 23, 79
         SELECT 1
         GOTO TOP
         MREC2= RECNO()
         DO vdisp1
         SELECT 1
         GOTO TOP
         MREC2= RECNO()
         R= 8
         LOOP
      ENDIF
      SELECT 1
      GOTO MREC2
      MSRNO= 0
      DO WHILE .not. EOF()
         MSRNO= MSRNO+1
         REPLACE SR_NO WITH MSRNO
         SKIP
      ENDDO
      MANS= ' '
      MQES= ' '
      EXIT
   ENDIF
ENDDO


RETURN
********************





********************
PROCEDURE VDISP1
********************

 *SET CLOCK ON
 *SET CLOCK TO 24,68

SELECT 1
USE vch-cor
GOTO MREC2
R= 9
DO WHILE .not. EOF()
   @ R, 1 SAY SR_NO PICTURE '999'

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 5 SAY C1 PICTURE '99'
   @ R, 7 SAY '-'
   @ R, 8 SAY C2 PICTURE '99'
   @ R, 10 SAY '-'
   @ R, 11 SAY C3 PICTURE '999'

IF _DOS
   SET COLOR TO /w
ENDIF

   STORE C1 TO MC1
   STORE C2 TO MC2
   STORE C3 TO MC3
   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 5 SAY MPC1 PICTURE '99'
   @ R, 8 SAY MPC2 PICTURE '99'
   @ R, 11 SAY MPC3 PICTURE '999'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 3
   STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
   SEEK MCODE
   IF FOUND()
      @ R, 15 SAY TITLE
   ENDIF
   SELECT 1

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 5, 32 SAY 'Description   '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 45 SAY DESCRIP
   @ R, 46 SAY DR_CR PICTURE '@!'
   COL= IIF(DR_CR='DR',50,62)
   @ R, COL SAY AMOUNT PICTURE '999999,999.99'
   SKIP
   R= R+1
   IF R>19

IF _DOS
      SET COLOR TO 7/1
ENDIF

      RETURN
   ENDIF
ENDDO

IF _DOS
SET COLOR TO 7/1
ENDIF


RETURN
******************



*************************************
* 4 - Vouchers ....... Deletion     *
*************************************
PROCEDURE vch_del
*****************

CLEAR
CLOSE ALL

SET DELETED ON
 *SET CLOCK ON
 *SET CLOCK TO 24,68


IF _DOS
SET COLOR TO 7/1
ENDIF

@ 2, 20 SAY 'Re-indexing Data Files .... Please wait'
SELECT 1
USE tran ORDER tranent
SELECT 2
USE ldgrcode ORDER ac1
SELECT 1
DECLARE MAVT( 7)
MAVT( 1)= 'CR'
MAVT( 2)= 'CP'
MAVT( 3)= 'BR'
MAVT( 4)= 'BP'
MAVT( 5)= 'JV'
MAVT( 6)= 'SV'
MAVT( 7)= 'PV'
DO WHILE .T.

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 1
   CLEAR
   PAGE= 1
   MVCH1= '  '
   MVCH2= '    '
   STORE 0 TO MCODE, MSRNO, MAMOUNT, AMT1, AMT2
   STORE 0 TO MVCH_TYPE, MVCH_NO1, MVCH_NO2
   @ 2, 1 TO 2, 79 DOUBLE
   @ 1, 30 SAY 'VOUCHER  DELETION '
   @ 1, 60 SAY 'PAGE #'
   @ 1, 67 SAY PAGE PICTURE '99'
   @ 21, 1 TO 21, 79 DOUBLE
   @ 23, 50 SAY 'Press Esc to Return'
   R= 3
   @ 22, 45 CLEAR TO 22, 79
   @ R, 32 SAY 'Voucher Type  ' GET MVCH_TYPE PICTURE '9'
   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

IF _DOS
   SET COLOR TO /w 
ENDIF

   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   READ
   IF MVCH_TYPE=0
      LOOP
   ENDIF
   IF MVCH_TYPE>=8
      @ R, 55 SAY '  '
      @ R, 30 SAY 'No such Voucher type exist -- Press any key'
      WAIT ''
      @ R, 30 SAY SPACE(55)
      LOOP
   ENDIF
   @ 21, 1 CLEAR TO 24, 79

IF _DOS
   SET COLOR TO /w
ENDIF

   @ R, 52 SAY MAVT(MVCH_TYPE)

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 50 SAY 'Press Esc to Return'
   @ 5, 22 SAY '          '
   @ 5, 5 SAY 'Voucher No '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 17 SAY MAVT(MVCH_TYPE)
   @ 5, 20 SAY '  -     '

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 5, 20 GET MVCH_NO1 PICTURE '@z 99'
   READ
   IF READKEY()=12
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   @ 23, 50 SAY SPACE(26)
   IF MVCH_NO1=0
      LOOP
   ENDIF
   MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 20 SAY MVCH1

IF _DOS
   SET COLOR TO 7/1   
ENDIF

   @ 5, 23 GET MVCH_NO2 PICTURE '@z 99999'
   READ
   IF MVCH_NO2=0
      LOOP
   ENDIF
   MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 5, 23 SAY MVCH2

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 1
   SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
   IF .not. FOUND()
      ?? CHR(7)
      @ 23, 1 SAY SPACE(78)
      @ 23, 15 SAY 'This Voucher No Does Not Exists  -- Press any key'
      WAIT ''
      @ 23, 10 SAY SPACE(75)
      LOOP
   ENDIF
   IF FLAG='Y'
      CLEAR
      @ 12, 15 SAY 'This Voucher has been posted to Ledger, therefore  '
      @ 13, 15 SAY 'you cannot Delete it. If you still want to Delete  '
      @ 14, 15 SAY 'it, please use UN-POST OPTION first.  '
      @ 16, 15 SAY 'Press Any Key to Return ............ '
      WAIT ''
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   SELECT 1
   SET FILTER TO VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
   GOTO TOP
   @ 3, 5 SAY 'Date       ' GET DATE
   CLEAR GETS

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 7, 1 SAY REPLICATE('-',78)
   @ 8, 2 SAY 'SR   ACCT-NO.  T I T L E                    DR/CR     DR-AMT.       CR-AMT.  '
   @ 9, 1 TO 9, 79 DOUBLE
   L= 10
   Y= '  '
   DO WHILE .not. EOF()
      MC1= C1
      MC2= C2
      MC3= C3
      @ L, 3 SAY SR_NO PICTURE '99'

IF _DOS
      SET COLOR TO /w
ENDIF

      @ L, 6 SAY '  -  -   '
      MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
      MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
      MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
      @ L, 6 SAY MPC1 PICTURE '99'
      @ L, 9 SAY MPC2 PICTURE '99'
      @ L, 12 SAY MPC3 PICTURE '999'

IF _DOS
      SET COLOR TO 7/1
ENDIF

      SELECT 2
      STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MCODE
      SEEK MCODE
      IF FOUND()

IF _DOS
         SET COLOR TO /w
ENDIF

         @ L, 17 SAY LEFT(TITLE,28)

IF _DOS
         SET COLOR TO 7/1 
ENDIF

      ELSE
         @ L, 17 SAY ' '
      ENDIF
      SELECT 1
      @ L, 47 SAY DR_CR
      IF DR_CR='DR'

IF _DOS
         SET COLOR TO /w
ENDIF

         @ L, 50 SAY AMOUNT PICTURE '999999999.99'

IF _DOS
         SET COLOR TO 7/1
ENDIF

      ELSE

IF _DOS
         SET COLOR TO /w
ENDIF

         @ L, 64 SAY AMOUNT PICTURE '999999999.99'

IF _DOS
         SET COLOR TO 7/1 
ENDIF

      ENDIF
      IF L>=21
         ANS= ' '
         DO WHILE .not. ANS$'CQ'
            SET CONFIRM OFF
            @ 24, 57 SAY 'Continue/Quit -  C/Q ' GET ANS FUNCTION '!'
            READ
         ENDDO
         IF ANS='Q'
            CLEAR
            CLOSE ALL
            RETURN
         ENDIF
         @ 9, 1 CLEAR TO 24, 79
         L= 9
         PAGE= PAGE+1
         @ 2, 67 SAY PAGE PICTURE '99'
      ENDIF
      IF .not. EOF()
         SKIP
      ENDIF
      L= L+1
      Y= '  '
   ENDDO
   IF EOF()
      SUM FOR DR_CR='DR' AMOUNT TO AMT1
      SUM FOR DR_CR='CR' AMOUNT TO AMT2
      @ 21, 49 SAY AMT1 PICTURE '9,999,999,999.99'
      @ 21, 64 SAY AMT2 PICTURE '9,999,999,999.99'
   ENDIF
   ANS= ' '
   DO WHILE .not. ANS$'YN'
      @ 24, 25 SAY 'Are You Sure - Y/N ' GET ANS FUNCTION '!'
      READ
   ENDDO
   @ 24, 19 CLEAR TO 24, 77
   IF ANS='Y'
      SELECT 1
      DELETE ALL FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      SELECT 3
      USE tran-key ORDER key
      DELETE ALL FOR VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      USE
   ENDIF
   SELECT 1
   SET FILTER TO
   ANS= ' '
   DO WHILE .not. ANS$'YN'
      @ 24, 24 SAY 'More Data Deletion - Y/N ' GET ANS FUNCTION '!'
      READ
   ENDDO
   IF ANS='N'
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
ENDDO


RETURN
*****************


*****************************************
* ------------- Printing --------- 	    *
* 5 - Vouchers ....... Date Wise        *
*****************************************
PROCEDURE vch_dprt
*************************

CLEAR
CLOSE ALL
SET DATE brit

 *SET CLOCK ON
 *SET CLOCK TO 24,68

SELECT 1
USE tran ORDER tranent

SELECT 2
USE ldgrcode ORDER ac1
STORE 0 TO DRTOT, CRTOT, WVCH_TYPE, MTOT, MTOT1
STORE DATE() TO MDAT1, MDAT2
@ 4, 20 SAY 'Vouchers Verification Report (Date Wise) '
@ 5, 20 SAY '----------------------------------------'
@ 8, 20 SAY 'From Date         : ' GET MDAT1
@ 10, 20 SAY 'To   Date         : ' GET MDAT2
READ
@ 23, 0 CLEAR TO 23, 77
@ 14, 20 SAY 'Y O U R   P A P E R   W I D T H'
@ 16, 20 SAY '      A -  10 INCHES'
@ 17, 20 SAY '      B -  15 INCHES'
@ 18, 20 SAY '      Q -  Quit     '
OPTN= ' '
DO WHILE .not. OPTN$'ABQ'
   @ 20, 25 SAY 'Your Choice (A/B/Q)' GET OPTN FUNCTION '!'
   READ
ENDDO
IF OPTN='Q'
   CLEAR
   CLOSE ALL
   RETURN
ENDIF
SELECT 1
SET FILTER TO DATE>=MDAT1.and.DATE<=MDAT2
GOTO TOP
CLEAR
@ 11, 20 SAY 'Please wait ... Printing in progress '
SET PRINTER ON
SET DEVICE TO PRINTER
HEADING= .T.
PAGE= 0

do PRNCHK in tbl_proc
DO WHILE .not. EOF()
   MVCH_NO1= VCH_NO1
   MVCH_NO2= VCH_NO2
   MVCH_TYPE= VCH_TYPE
   DO WHILE VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      IF HEADING
         PAGE= PAGE+1
         IF OPTN='A'
			do PRNCHK in tbl_proc
            DO top_prt1 IN tbl_proc.prg
         ELSE
			do PRNCHK in tbl_proc
            DO top_prt2 IN tbl_proc.prg
         ENDIF
         IF OPTN='A'
            @ PROW(), PCOL() SAY CHR(15)
         ELSE
            @ PROW(), PCOL() SAY CHR(18)
         ENDIF
         @ 3, 18 SAY "  Daily Vouchers' Printing              Page : "
         @ 3, 65 SAY PAGE PICTURE '99'
         @ 4, 1 SAY REPLICATE('-',135)
         @ 5, 1 SAY '  DATE   VOUCHER-NO CODE--------TITLE ------------------------ DESCRIPTION ------------------  -----------DR  -----------CR  REMARKS'
         @ 6, 1 SAY REPLICATE('-',135)
         L= 7
         HEADING= .F.
      ENDIF
      T= '   '
      DO CASE
         CASE VCH_TYPE=1
            T= 'CR-'
         CASE VCH_TYPE=2
            T= 'CP-'
         CASE VCH_TYPE=3
            T= 'BR-'
         CASE VCH_TYPE=4
            T= 'BP-'
         CASE VCH_TYPE=5
            T= 'JV-'
         CASE VCH_TYPE=6
            T= 'SV-'
         CASE VCH_TYPE=7
            T= 'PV-'
      ENDCASE
      SELECT 1
      MC1= C1
      MC2= C2
      MC3= C3
      MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))
      MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))
      MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
      MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
      MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
      @ L, 0 SAY DATE
      @ L, 10 SAY T
      @ L, 13 SAY MVCH1
      @ L, 15 SAY '-'
      @ L, 16 SAY MVCH2
      @ L, 22 SAY MPC1
      @ L, 24 SAY '-'
      @ L, 25 SAY MPC2
      @ L, 27 SAY '-'
      @ L, 28 SAY MPC3
      SELECT 2
      SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)
      IF FOUND()
         @ L, 32 SAY TITLE
      ELSE
         @ L, 32 SAY ' '
      ENDIF
      SELECT 1
      @ L, 62 SAY DESCRIP
      COL= IIF(DR_CR='DR',95,110)
      @ L, COL SAY AMOUNT PICTURE '999,999,999.99'
      IF COL=95
         DRTOT= DRTOT+AMOUNT
         MTOT= MTOT+AMOUNT
      ELSE
         CRTOT= CRTOT+AMOUNT
         MTOT1= MTOT1+AMOUNT
      ENDIF
      L= L+1
      @ L, 62 SAY DESCRIP1
      L= L+1
      SKIP
      IF VCH_TYPE<>MVCH_TYPE.and.VCH_NO1<>MVCH_NO1.and.VCH_NO2<>MVCH_NO2
         EXIT
      ENDIF
      IF EOF()
         EXIT
      ENDIF
      IF L>56
         HEADING= .T.
      ENDIF
   ENDDO
   L= L+1
   IF DRTOT<>CRTOT
      @ L, 75 SAY 'Voucher Totals:'
      @ L, 94 SAY DRTOT PICTURE '99,999,999,999.99'
      @ L, 109 SAY CRTOT PICTURE '99,999,999,999.99'
      @ L, 124 SAY 'Unbalance ***'
      L= L+1
   ENDIF
   DRTOT= 0
   CRTOT= 0
   IF L>56
      EJECT
      HEADING= .T.
   ENDIF
ENDDO
@ L, 70 SAY REPLICATE('-',60)
L= L+1
@ L, 75 SAY 'Voucher Totals:'
@ L, 94 SAY MTOT PICTURE '99,999,999,999.99'
@ L, 109 SAY MTOT1 PICTURE '99,999,999,999.99'
EJECT
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE ALL
CLEAR

RETURN
*****************


*****************************************
* ------------- Printing --------- 	    *
* 6 - Vouchers ....... Type Wise        *
*****************************************
PROCEDURE vch_tprt
***********************

CLEAR
CLOSE ALL

 *SET CLOCK ON
 *SET CLOCK TO 24,68

SELECT 1
USE tran ORDER tranent

SELECT 2
USE ldgrcode ORDER ac1
SET DATE brit

IF _DOS
SET COLOR TO 7/1
ENDIF

CLEAR
WVCH_NO= '     '
STORE 0 TO DRTOT, CRTOT, WVCH_TYPE, MTOT, MTOT1, MVCH_NO1, MVCH_NO2
STORE DATE() TO MDAT1, MDAT2
@ 3, 20 SAY 'Vouchers Verification Report (Type Wise) '
@ 4, 20 SAY '----------------------------------------'
MVCH_TYPE= 0

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 21, 1 SAY 'Voucher Types:'
@ 21, 17 SAY '1 - '
@ 21, 21 SAY 'Cash Receipt - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 21, 36 SAY 'CR'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 22, 17 SAY '2 - '
@ 22, 21 SAY 'Cash Payment - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 22, 36 SAY 'CP'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 21, 58 SAY '3 - '
@ 21, 62 SAY 'Bank Receipt - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 21, 77 SAY 'BR'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 22, 58 SAY '4 - '
@ 22, 62 SAY 'Bank Payment - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 22, 77 SAY 'BP'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 23, 17 SAY '5 - '
@ 23, 21 SAY 'Journal      - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 23, 36 SAY 'JV'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 23, 40 SAY '6 - '
@ 23, 44 SAY 'Sales - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 23, 52 SAY 'SV'

IF _DOS
SET COLOR TO 7/1
ENDIF

@ 23, 58 SAY '7 - '
@ 23, 62 SAY 'Purchase     - '

IF _DOS
SET COLOR TO /w 
ENDIF

@ 23, 77 SAY 'PV'

IF _DOS
SET COLOR TO 7/1
ENDIF

DO WHILE .T.
   @ 6, 20 SAY 'Enter Voucher Type:' GET MVCH_TYPE PICTURE '9'
   READ
   IF MVCH_TYPE=0
      LOOP
   ENDIF
   IF MVCH_TYPE=9
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   IF MVCH_TYPE>7
      LOOP
   ENDIF
   EXIT
ENDDO
@ 21, 1 CLEAR TO 24, 79
@ 8, 20 SAY 'From Date         : ' GET MDAT1
@ 10, 20 SAY 'To   Date         : ' GET MDAT2
READ
@ 23, 0 CLEAR TO 23, 77
@ 14, 20 SAY 'Y O U R   P A P E R   W I D T H'
@ 16, 20 SAY '      A -  10 INCHES'
@ 17, 20 SAY '      B -  15 INCHES'
@ 18, 20 SAY '      Q -  Quit     '
OPTN= ' '
DO WHILE .not. OPTN$'ABQ'
   @ 20, 25 SAY 'Your Choice (A/B/Q)' GET OPTN FUNCTION '!'
   READ
ENDDO
IF OPTN='Q'
   CLEAR
   CLOSE ALL
   RETURN
ENDIF
SELECT 1
SET FILTER TO VCH_TYPE=MVCH_TYPE.and.DATE>=MDAT1.and.DATE<=MDAT2
GOTO TOP
CLEAR
@ 11, 20 SAY 'Please wait ... Printing in progress '

DO PRNCHK IN tbl_proc.prg
SET PRINTER ON
SET DEVICE TO PRINTER
HEADING= .T.
PAGE= 0


DO WHILE .not. EOF()
   MVCH_NO1= VCH_NO1
   MVCH_NO2= VCH_NO2
   DO WHILE VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      IF HEADING
         PAGE= PAGE+1
         IF OPTN='A'
			do PRNCHK in tbl_proc
            DO top_prt1 IN tbl_proc.prg
         ELSE
			do PRNCHK in tbl_proc
            DO top_prt2 IN tbl_proc.prg
         ENDIF
         IF OPTN='A'
            @ PROW(), PCOL() SAY CHR(15)
         ELSE
            @ PROW(), PCOL() SAY CHR(18)
         ENDIF
         @ 3, 18 SAY "  Daily Vouchers' Printing              Page : "
         @ 3, 65 SAY PAGE PICTURE '99'
         @ 4, 1 SAY REPLICATE('-',135)
         @ 5, 1 SAY '  DATE   VOUCHER-NO CODE--------TITLE ------------------------ DESCRIPTION ------------------  -----------DR  -----------CR  REMARKS'
         @ 6, 1 SAY REPLICATE('-',135)
         L= 7
         HEADING= .F.
      ENDIF
      T= '   '
      DO CASE
         CASE VCH_TYPE=1
            T= 'CR-'
         CASE VCH_TYPE=2
            T= 'CP-'
         CASE VCH_TYPE=3
            T= 'BR-'
         CASE VCH_TYPE=4
            T= 'BP-'
         CASE VCH_TYPE=5
            T= 'JV-'
         CASE VCH_TYPE=6
            T= 'SV-'
         CASE VCH_TYPE=7
            T= 'PV-'
      ENDCASE
      SELECT 1
      MC1= C1
      MC2= C2
      MC3= C3
      MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))
      MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))
      MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
      MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
      MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
      @ L, 0 SAY DATE
      @ L, 10 SAY T
      @ L, 13 SAY MVCH1
      @ L, 15 SAY '-'
      @ L, 16 SAY MVCH2
      @ L, 22 SAY MPC1
      @ L, 24 SAY '-'
      @ L, 25 SAY MPC2
      @ L, 27 SAY '-'
      @ L, 28 SAY MPC3
      SELECT 2
      SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)
      IF FOUND()
         @ L, 32 SAY TITLE
      ELSE
         @ L, 32 SAY ' '
      ENDIF
      SELECT 1
      @ L, 62 SAY DESCRIP
      COL= IIF(DR_CR='DR',95,110)
      @ L, COL SAY AMOUNT PICTURE '999,999,999.99'
      IF COL=95
         DRTOT= DRTOT+AMOUNT
         MTOT= MTOT+AMOUNT
      ELSE
         CRTOT= CRTOT+AMOUNT
         MTOT1= MTOT1+AMOUNT
      ENDIF
      L= L+1
      @ L, 62 SAY DESCRIP1
      L= L+1
      SKIP
      IF VCH_NO1<>MVCH_NO1.and.VCH_NO2<>MVCH_NO2
         EXIT
      ENDIF
      IF EOF()
         EXIT
      ENDIF
      IF L>56
         HEADING= .T.
      ENDIF
   ENDDO
   L= L+1
   IF DRTOT<>CRTOT
      @ L, 75 SAY 'Voucher Totals:'
      @ L, 94 SAY DRTOT PICTURE '99,999,999,999.99'
      @ L, 109 SAY CRTOT PICTURE '99,999,999,999.99'
      @ L, 124 SAY 'Unbalance ***'
      L= L+1
   ENDIF
   DRTOT= 0
   CRTOT= 0
   IF L>56
      EJECT
      HEADING= .T.
   ENDIF
ENDDO
@ L, 70 SAY REPLICATE('-',60)
L= L+1
@ L, 75 SAY 'Voucher Totals:'
@ L, 94 SAY MTOT PICTURE '99,999,999,999.99'
@ L, 109 SAY MTOT1 PICTURE '99,999,999,999.99'
EJECT
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE ALL
CLEAR

RETURN
************************




*****************************************
* ------------- Printing --------- 	    *
* 7 - Complete Voucher Printing - I     *
*****************************************
PROCEDURE vch_prt1
************************

CLEAR
CLOSE ALL
SET DATE brit
SET CENTURY ON

 *SET CLOCK ON
 *SET CLOCK TO 24,68

SELECT 1
USE tran ORDER tranent

SELECT 2
USE ldgrcode ORDER ac1
STORE 0 TO DRTOT, CRTOT, MVCH_NO1, MVCH_NO2, MVCH_TYPE
T= '   '
MT= 0
DO WHILE MT=0
   @ 6, 20 SAY 'V o u c h e r   P r i n t i n g '
   @ 21, 1 TO 21, 79
   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

IF _DOS
   SET COLOR TO /w 
ENDIF

   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 8, 5 SAY 'Voucher TYpe   ' GET MVCH_TYPE PICTURE '9'
   READ
   IF MVCH_TYPE=1
      T= 'CR-'
   ENDIF
   IF MVCH_TYPE=2
      T= 'CP-'
   ENDIF
   IF MVCH_TYPE=3
      T= 'BR-'
   ENDIF
   IF MVCH_TYPE=4
      T= 'BP-'
   ENDIF
   IF MVCH_TYPE=5
      T= 'JV-'
   ENDIF
   IF MVCH_TYPE=6
      T= 'SV-'
   ENDIF
   IF MVCH_TYPE=7
      T= 'PV-'
   ENDIF
   @ 22, 1 CLEAR TO 24, 79
   @ 23, 50 SAY 'Press Esc to Return'
   @ 10, 22 SAY '          '
   @ 10, 5 SAY 'Voucher No '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 20 SAY '  -     '

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 10, 20 GET MVCH_NO1 PICTURE '@z 99'
   READ
   IF READKEY()=12
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   @ 23, 50 SAY SPACE(26)
   IF MVCH_NO1=0
      LOOP
   ENDIF
   MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 20 SAY MVCH1

IF _DOS
   SET COLOR TO 7/1   
ENDIF

   @ 10, 23 GET MVCH_NO2 PICTURE '@z 99999'
   READ
   IF MVCH_NO2=0
      LOOP
   ENDIF
   MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 23 SAY MVCH2

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 1
   SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
   IF .not. FOUND()
      ?? CHR(7)
      @ 23, 1 SAY SPACE(78)
      @ 23, 15 SAY 'This Voucher No Does Not Exists  -- Press any key'
      WAIT ''
      @ 23, 10 SAY SPACE(75)
      LOOP
   ENDIF
   MT= 1
ENDDO
SELECT 1
SET FILTER TO VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
GOTO TOP
ANS= ' '
DO WHILE .not. ANS$'PQ'
   @ 23, 50 SAY 'Printing/Quit ... P/Q ' GET ANS PICTURE '!'
   READ
ENDDO
IF ANS='Q'
   CLEAR
   CLOSE ALL
   RETURN
ENDIF
IF ANS='P'
   @ 11, 20 SAY 'Please wait ... Printing in progress '
   SET PRINTER ON
   SET DEVICE TO PRINTER
ENDIF
HEAD= .T.
STORE 0 TO PAGE, CNT
SELECT 1
CLEAR
L= 2
DO WHILE .not. EOF()
   IF HEAD
      IF CNT=0
         @ 0, 0 SAY CHR(18)
		 do PRNCHK in tbl_proc
         DO top_prt1 IN tbl_proc.prg
      ENDIF
      @ L, 1 SAY 'Voucher No. ___________'
      @ L, 13 SAY T+MVCH1+'-'+MVCH2
      @ L, 65 SAY 'Date : ________'
      @ L, 72 SAY DATE
      L= L+1
      @ L, 1 SAY REPLICATE('-',79)
      L= L+1
      @ L, 1 SAY ':'
      @ L, 2 SAY ' CODE      : P A R T I C U L A R S           :     DEBIT     :     CREDIT    :'
      L= L+1
      @ L, 1 SAY REPLICATE('-',79)
      L= L+1
      HEAD= .F.
   ENDIF
   MC1= C1
   MC2= C2
   MC3= C3
   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
   SELECT 2
   SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)
   IF FOUND()
      MTITLE= TITLE
   ELSE
      MTITLE= '  '
   ENDIF
   SELECT 1
   @ L, 1 SAY ':'
   @ L, 3 SAY MPC1 PICTURE '99'
   @ L, 5 SAY '-'
   @ L, 6 SAY MPC2 PICTURE '99'
   @ L, 8 SAY '-'
   @ L, 9 SAY MPC3 PICTURE '999'
   @ L, 13 SAY ':'
   @ L, 15 SAY MTITLE
   @ L, 47 SAY ':'
   IF DR_CR='DR'
      @ L, 50 SAY AMOUNT
      DRTOT= DRTOT+AMOUNT
      @ L, 63 SAY ':'
   ELSE
      @ L, 63 SAY ':'
      @ L, 66 SAY AMOUNT
      CRTOT= CRTOT+AMOUNT
   ENDIF
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 15 SAY DESCRIP
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 15 SAY DESCRIP1
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
   SKIP
   IF CNT=0
      IF L>=19.or.L>=50
         @ L, 1 SAY REPLICATE('-',79)
         L= L+2
         @ L, 55 SAY 'Continued Next Page '
         CNT= 1
         HEAD= .T.
         L= L+11
      ENDIF
   ENDIF
ENDDO
DO WHILE L<19
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
ENDDO
IF L>=19.or.L>=50
   @ L, 1 SAY REPLICATE('-',79)
   L= L+1
   @ L, 1 SAY ':'
   @ L, 35 SAY 'Total Rs: '
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 48 SAY DRTOT PICTURE '99999999999.99'
   @ L, 64 SAY CRTOT PICTURE '99999999999.99'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY REPLICATE('-',79)
   L= L+1
   L= L+2
   @ L, 10 SAY 'Prepared By'
   @ L, 35 SAY 'Accountant '
   @ L, 64 SAY 'Director '
   L= L+2
   EJECT
ENDIF
IF ANS='P'
   SET PRINTER OFF
   SET DEVICE TO SCREEN
ENDIF
CLEAR


RETURN
**********************



*****************************************
* ------------- Printing --------- 	    *
* 8 - Complete Voucher Printing - II    *
*****************************************
PROCEDURE vch_prt2
********************

CLEAR
CLOSE ALL
SET DATE brit
SET CENTURY ON
 *SET CLOCK ON
 *SET CLOCK TO 24,68


CLEAR
CLOSE ALL
SET DATE brit
SET CENTURY ON
SELECT 1
USE tran ORDER tranent

SELECT 2
USE ldgrcode ORDER ac1
SELECT 1
STORE 0 TO DRTOT, CRTOT, MVCH_NO1, MVCH_NO2, MVCH_TYPE
T= '   '
MT= 0
DO WHILE MT=0
   @ 6, 20 SAY 'V o u c h e r   P r i n t i n g '
   @ 21, 1 TO 21, 79
   @ 22, 1 SAY 'Voucher Types:'
   @ 22, 17 SAY '1 - '
   @ 23, 17 SAY '2 - '
   @ 22, 58 SAY '3 - '
   @ 23, 58 SAY '4 - '
   @ 24, 17 SAY '5 - '
   @ 24, 40 SAY '6 - '
   @ 24, 58 SAY '7 - '
   @ 22, 21 SAY 'Cash Receipt - '
   @ 23, 21 SAY 'Cash Payment - '
   @ 22, 62 SAY 'Bank Receipt - '
   @ 23, 62 SAY 'Bank Payment - '
   @ 24, 21 SAY 'Journal      - '
   @ 24, 44 SAY 'Sales - '
   @ 24, 62 SAY 'Purchase     - '

IF _DOS
   SET COLOR TO /w 
ENDIF

   @ 22, 36 SAY 'CR'
   @ 23, 36 SAY 'CP'
   @ 22, 77 SAY 'BR'
   @ 23, 77 SAY 'BP'
   @ 24, 36 SAY 'JV'
   @ 24, 52 SAY 'SV'
   @ 24, 77 SAY 'PV'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 8, 5 SAY 'Voucher TYpe   ' GET MVCH_TYPE PICTURE '9'
   READ
   IF MVCH_TYPE=1
      T= 'CR-'
   ENDIF
   IF MVCH_TYPE=2
      T= 'CP-'
   ENDIF
   IF MVCH_TYPE=3
      T= 'BR-'
   ENDIF
   IF MVCH_TYPE=4
      T= 'BP-'
   ENDIF
   IF MVCH_TYPE=5
      T= 'JV-'
   ENDIF
   IF MVCH_TYPE=6
      T= 'SV-'
   ENDIF
   IF MVCH_TYPE=7
      T= 'PV-'
   ENDIF
   @ 22, 1 CLEAR TO 24, 79
   @ 23, 50 SAY 'Press Esc to Return'
   @ 10, 22 SAY '          '
   @ 10, 5 SAY 'Voucher No '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 20 SAY '  -     '

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 10, 20 GET MVCH_NO1 PICTURE '@z 99'
   READ
   IF READKEY()=12
      CLEAR
      CLOSE ALL
      RETURN
   ENDIF
   @ 23, 50 SAY SPACE(26)
   IF MVCH_NO1=0
      LOOP
   ENDIF
   MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 20 SAY MVCH1

IF _DOS
   SET COLOR TO 7/1   
ENDIF

   @ 10, 23 GET MVCH_NO2 PICTURE '@z 99999'
   READ
   IF MVCH_NO2=0
      LOOP
   ENDIF
   MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 10, 23 SAY MVCH2

IF _DOS
   SET COLOR TO 7/1
ENDIF

   SELECT 1
   SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)
   IF .not. FOUND()
      ?? CHR(7)
      @ 23, 1 SAY SPACE(78)
      @ 23, 15 SAY 'This Voucher No Does Not Exists  -- Press any key'
      WAIT ''
      @ 23, 10 SAY SPACE(75)
      LOOP
   ENDIF
   MT= 1
ENDDO
SELECT 1
SET FILTER TO VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
GOTO TOP
ANS= ' '
DO WHILE .not. ANS$'PQ'
   @ 23, 50 SAY 'Printing/Quit ... P/Q ' GET ANS PICTURE '!'
   READ
ENDDO
IF ANS='Q'
   CLEAR
   CLOSE ALL
   RETURN
ENDIF
IF ANS='P'
   @ 11, 20 SAY 'Please wait ... Printing in progress '
   SET PRINTER ON
   SET DEVICE TO PRINTER
ENDIF
HEAD= .T.
STORE 0 TO PAGE, CNT
SELECT 1
CLEAR
L= 2
DO WHILE .not. EOF()
   IF HEAD
      L= 2
      @ 0, 0 SAY CHR(18)
	  do PRNCHK in tbl_proc
      DO top_prt1 IN tbl_proc.prg
      @ L, 1 SAY 'Voucher No. ___________'
      @ L, 13 SAY T+MVCH1+'-'+MVCH2
      @ L, 65 SAY 'Date : ________'
      @ L, 72 SAY DATE
      L= L+1
      @ L, 1 SAY REPLICATE('-',79)
      L= L+1
      @ L, 1 SAY ':'
      @ L, 2 SAY ' CODE      : P A R T I C U L A R S           :     DEBIT     :     CREDIT    :'
      L= L+1
      @ L, 1 SAY REPLICATE('-',79)
      L= L+1
      HEAD= .F.
   ENDIF
   MC1= C1
   MC2= C2
   MC3= C3
   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
   SELECT 2
   SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)
   IF FOUND()
      MTITLE= TITLE
   ELSE
      MTITLE= '  '
   ENDIF
   SELECT 1
   @ L, 1 SAY ':'
   @ L, 3 SAY MPC1 PICTURE '99'
   @ L, 5 SAY '-'
   @ L, 6 SAY MPC2 PICTURE '99'
   @ L, 8 SAY '-'
   @ L, 9 SAY MPC3 PICTURE '999'
   @ L, 13 SAY ':'
   @ L, 15 SAY MTITLE
   @ L, 47 SAY ':'
   IF DR_CR='DR'
      @ L, 50 SAY AMOUNT
      DRTOT= DRTOT+AMOUNT
      @ L, 63 SAY ':'
   ELSE
      @ L, 63 SAY ':'
      @ L, 66 SAY AMOUNT
      CRTOT= CRTOT+AMOUNT
   ENDIF
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 15 SAY DESCRIP
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 15 SAY DESCRIP1
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   @ L, 1 SAY REPLICATE('_',79)
   L= L+1
   SKIP
   IF CNT=0
      IF L>=54
         @ L, 1 SAY REPLICATE('-',79)
         L= L+2
         @ L, 55 SAY 'Continued Next Page '
         CNT= 1
         HEAD= .T.
      ENDIF
   ENDIF
ENDDO
DO WHILE L<48
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY ':'
   @ L, 13 SAY ':'
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 79 SAY ':'
   L= L+1
ENDDO
IF L>=48
   @ L, 1 SAY REPLICATE('-',79)
   L= L+1
   @ L, 1 SAY ':'
   @ L, 35 SAY 'Total Rs: '
   @ L, 47 SAY ':'
   @ L, 63 SAY ':'
   @ L, 48 SAY DRTOT PICTURE '99999999999.99'
   @ L, 64 SAY CRTOT PICTURE '99999999999.99'
   @ L, 79 SAY ':'
   L= L+1
   @ L, 1 SAY REPLICATE('-',79)
   L= L+1
   @ L, 1 SAY 'Received the sum of Rupees '
   @ L, 29 SAY REPLICATE('_',51)
   L= L+1
   @ L, 1 SAY '______________________________________________ Signature ______________________'
   L= L+2
   @ L, 1 SAY REPLICATE('=',79)
   L= L+2
   @ L, 10 SAY 'Prepared By'
   @ L, 35 SAY 'Accountant '
   @ L, 64 SAY 'Director '
   L= L+2
   EJECT
ENDIF
IF ANS='P'
   SET PRINTER OFF
   SET DEVICE TO SCREEN
ENDIF
CLEAR

RETURN
*******************


**************************************
* ---------- View On Screen ------   *
* 9 - Vouchers ....... Type Wise     *
**************************************
PROCEDURE vch_tvew
********************
* Revision : 29-July-2008

CLEAR
CLOSE ALL

 *SET CLOCK ON
 *SET CLOCK TO 24,68

SELECT 1
USE tran ORDER tranent

SELECT 2
USE ldgrcode ORDER ac1

SELECT 1



STORE DATE() TO MDATE


STORE 0 TO MVCH_NO1, MVCH_NO2
STORE 0 TO MC1, MC2, MC3
STORE 0 TO MCODE, MUPDATE, MSTATUS, MSNO, MVCH_TYPE

STORE SPACE(2) TO T, MVCH1

MVCH2= '     '
PAGE= 1
Y= '  '


DO WHILE .T.


		IF _DOS
		   	
		   	@ 2, 1 TO 2, 79 DOUBLE
   			@ 1, 30 SAY 'VOUCHER  DISPLAY '
   			@ 1, 60 SAY 'PAGE #'
   			@ 1, 67 SAY PAGE PICTURE '999'
   			@ 21, 1 TO 21, 79 DOUBLE
   			@ 22, 17 SAY '1 - '
   			@ 23, 17 SAY '2 - '
   			@ 22, 58 SAY '3 - '
   			@ 23, 58 SAY '4 - '
   			@ 24, 17 SAY '5 - '
   			@ 24, 40 SAY '6 - '
   			@ 24, 58 SAY '7 - '
   			@ 22, 21 SAY 'Cash Receipt - '
   			@ 23, 21 SAY 'Cash Payment - '
   			@ 22, 62 SAY 'Bank Receipt - '
   			@ 23, 62 SAY 'Bank Payment - '
   			@ 24, 21 SAY 'Journal      - '
   			@ 24, 44 SAY 'Sales - '
   			@ 24, 62 SAY 'Purchase     - '
		
		ELSE
		*Windows
		   	@ 2, 0 TO 2, 135 DOUBLE
   			@ 1, 30 SAY 'VOUCHER  DISPLAY - TYPE WISE ' FONT 'FOXFONT',11
   			@ 1, 110 SAY 'PAGE #' FONT 'FOXFONT',11
   			@ 1, 120 SAY PAGE PICTURE '999' FONT 'FOXFONT',11
   			@ 26, 0 TO 26, 135 DOUBLE 
   			@ 22, 10 SAY '1 - ' FONT 'FOXFONT',11 
   			@ 23, 10 SAY '2 - ' FONT 'FOXFONT',11 
   			@ 22, 65 SAY '3 - ' FONT 'FOXFONT',11 
   			@ 23, 65 SAY '4 - ' FONT 'FOXFONT',11 
   			@ 24, 10 SAY '5 - ' FONT 'FOXFONT',11 
   			@ 24, 40 SAY '6 - ' FONT 'FOXFONT',11 
   			@ 24, 65 SAY '7 - ' FONT 'FOXFONT',11 
   			@ 22, 13 SAY 'Cash Receipt - ' FONT 'FOXFONT',11 
   			@ 23, 13 SAY 'Cash Payment - ' FONT 'FOXFONT',11 
   			@ 22, 69 SAY 'Bank Receipt - ' FONT 'FOXFONT',11 
   			@ 23, 69 SAY 'Bank Payment - ' FONT 'FOXFONT',11 
   			@ 24, 13 SAY 'Journal      - ' FONT 'FOXFONT',11 
   			@ 24, 44 SAY 'Sales - ' FONT 'FOXFONT',11 
   			@ 24, 69 SAY 'Purchase     - ' FONT 'FOXFONT',11 
		
		ENDIF

				IF _DOS
   					SET COLOR TO /w 
				ELSE
					SET COLOR TO
				ENDIF

		IF _DOS

   				@ 22, 36 SAY 'CR'
   				@ 23, 36 SAY 'CP'
   				@ 22, 77 SAY 'BR'
   				@ 23, 77 SAY 'BP'
   				@ 24, 36 SAY 'JV'
   				@ 24, 52 SAY 'SV'
   				@ 24, 77 SAY 'PV'

		ELSE
		*Windows
   				@ 22, 34 SAY 'CR' FONT 'FOXFONT',11 
   				@ 23, 34 SAY 'CP' FONT 'FOXFONT',11 
   				@ 22, 90 SAY 'BR' FONT 'FOXFONT',11 
   				@ 23, 90 SAY 'BP' FONT 'FOXFONT',11 
   				@ 24, 34 SAY 'JV' FONT 'FOXFONT',11 
   				@ 24, 55 SAY 'SV' FONT 'FOXFONT',11 
   				@ 24, 90 SAY 'PV' FONT 'FOXFONT',11 
		ENDIF
				
				
				IF _DOS
   					SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF


			IF _DOS
			   	@ 3, 40 SAY 'Voucher Type  ' GET MVCH_TYPE PICTURE '9'
   				READ
			ELSE
			*Windows
			   	@ 3, 40 SAY 'Voucher Type  :' FONT 'FOXFONT',11 ;
			   	 GET MVCH_TYPE PICTURE '9' FONT 'FOXFONT',11
   				READ
			ENDIF

   IF READKEY()=12
      CLEAR
      CLOSE DATA
      CLOSE ALL
      RETURN
   ENDIF


   			IF _DOS
   				
   				@ 21, 1 CLEAR TO 24, 79

			ELSE
			*Windows
   				@ 21, 1 CLEAR TO 26, 135
			ENDIF
			



	   	IF MVCH_TYPE=0
      		LOOP
   		ENDIF



   IF MVCH_TYPE=9
      CLOSE ALL
      CLEAR
      RETURN
   ENDIF


		IF _DOS
		
   			IF MVCH_TYPE >= 8
      			@ 23, 20 SAY 'No such Voucher type exist --Press anykey'
      			WAIT ''
      			@ 23, 19 CLEAR TO 23, 77
      			LOOP
   			ENDIF
		
		ELSE
		*Windows
		
   			IF MVCH_TYPE >= 8
      			@ 23, 20 SAY 'No such Voucher type exist --Press anykey' ;
      			FONT 'FOXFONT',11 ;
      			COLOR RGB(255,0,0)
      			
      			WAIT ''
      			
      			@ 21, 0 CLEAR TO 26, 135
      			
      			LOOP
   			
   			ENDIF
		
		ENDIF


		IF _DOS
   			SET COLOR TO /w
		ELSE
			SET COLOR TO
		ENDIF



   SELECT 1
   SET FILTER TO VCH_TYPE=MVCH_TYPE

   GOTO TOP


   	IF _DOS
   		IF MVCH_TYPE=1
      		@ 3, 58 SAY 'CR'
      		T= 'CR-'
   		ENDIF
	
	ELSE*
	*Windows
   		IF MVCH_TYPE=1
      		@ 3, 65 SAY 'CR' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Cash Receipt' FONT 'Times New Roman',18
      		T= 'CR-'
   		ENDIF
	
	ENDIF
	
	

	IF _DOS
   		
   		IF MVCH_TYPE=2
      		@ 3, 58 SAY 'CP'
      		T= 'CP-'
   		ENDIF
	ELSE
	*Windows
   		IF MVCH_TYPE=2
      		@ 3, 65 SAY 'CP' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Cash Payment' FONT 'Times New Roman',18      		
      		T= 'CP-'
   		ENDIF
	
	ENDIF
   		

	IF _DOS
	   		
   		IF MVCH_TYPE=3
      		@ 3, 58 SAY 'BR'
      		T= 'BR-'
   		ENDIF

	ELSE
	*Windows
   		IF MVCH_TYPE=3
      		@ 3, 65 SAY 'BR' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Bank Receipt' FONT 'Times New Roman',18      		      		
      		T= 'BR-'
   		ENDIF
	
	ENDIF
	


	IF _DOS
	
   		IF MVCH_TYPE=4
      		@ 3, 58 SAY 'BP'
      		T= 'BP-'
   		ENDIF

	ELSE
	*Windows
   		IF MVCH_TYPE=4
      		@ 3, 65 SAY 'BP' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Bank Payment' FONT 'Times New Roman',18
      		T= 'BP-'
   		ENDIF
	

	ENDIF


	IF _DOS
	
   		IF MVCH_TYPE=5
      		@ 3, 58 SAY 'JV'
      		T= 'JV-'
   		ENDIF

	ELSE
	*Windows
   		IF MVCH_TYPE=5
      		@ 3, 65 SAY 'JV' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Journal' FONT 'Times New Roman',18
      		T= 'JV-'
   		ENDIF
	
	ENDIF



	IF _DOS
	
   		IF MVCH_TYPE=6
      		@ 3, 58 SAY 'SV'
      		T= 'SV-'
   		ENDIF

	ELSE
	*Windows
   		IF MVCH_TYPE=6
      		@ 3, 65 SAY 'SV' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Sales' FONT 'Times New Roman',18
      		T= 'SV-'
   		ENDIF
	
	ENDIF



	IF _DOS
	
   		IF MVCH_TYPE=7
      		@ 3, 58 SAY 'PV'
      		T= 'PV-'
   		ENDIF
	
	ELSE
	*Windows
   		IF MVCH_TYPE=7
      		@ 3, 65 SAY 'PV' FONT 'FOXFONT',11
      		@ 3, 90 SAY 'Purchase' FONT 'Times New Roman',18
      		T= 'PV-'
   		ENDIF
	
	ENDIF



			IF _DOS
   				SET COLOR TO 7/1 
			ELSE
				SET COLOR TO
			ENDIF

   ABC= 0
   
   DO WHILE ABC=0


			IF _DOS

		      	@ 23, 50 SAY 'Press Esc to Return'
      			@ 5, 5 SAY 'Voucher No '

			ELSE
			*Windows

		      	@ 29, 100 SAY 'Press Esc to Return' FONT 'FOXFONT',11
      			@ 5, 5 SAY 'Voucher No ' FONT 'FOXFONT',11

			
			ENDIF
			
			
			IF _DOS
      			SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF

			      	
				IF _DOS      	
			      	
			      	@ 5, 17 SAY T
      				@ 5, 20 SAY '  -     '
				
				ELSE
				*Windows
					
					@ 5, 0 TO 5, 135 CLEAR
			      	@ 5, 22 SAY T FONT 'FOXFONT',11

				
				ENDIF
			
			
			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF

      			
      		IF _DOS
      			
      			@ 5, 20 GET MVCH_NO1 PICTURE '@z 99'
      			READ
      		ELSE
      		*Windows
      			@ 5, 28 GET MVCH_NO1 PICTURE '@z 99' FONT 'FOXFONT',11
      			READ
      		
      		ENDIF
      
      
      IF READKEY()=12
         CLEAR
         CLOSE ALL
         RETURN
      ENDIF
      
      
      IF _DOS
      		@ 23, 50 SAY SPACE(26)
      ELSE
      		@ 29, 0 TO 30, 135 CLEAR      
      ENDIF
      
      
      IF MVCH_NO1=0
         LOOP
      ENDIF
      
      
      MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))

			IF _DOS
      			SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF

      			
      		IF _DOS	
      			@ 5, 20 SAY MVCH1
			ELSE
				@ 5, 28 TO 5, 135 CLEAR
				@ 5, 28 SAY MVCH1 FONT 'FOXFONT',11
			ENDIF
			
			
			IF _DOS
      			SET COLOR TO 7/1   
			ELSE
				SET COLOR TO
			ENDIF

      		
      		IF _DOS	
      			@ 5, 23 GET MVCH_NO2 PICTURE '@z 99999'
      			READ
      		ELSE
      		*Windows
      			@ 5, 31 SAY '-' FONT 'FOXFONT',11
      			@ 5, 33 GET MVCH_NO2 PICTURE '@z 99999' FONT 'FOXFONT',11
      			READ
      		ENDIF
      
      
      IF MVCH_NO2=0
         LOOP
      ENDIF
      
      
      MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

			IF _DOS
      			SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF

      		
      	IF _DOS	
      		@ 5, 23 SAY MVCH2
		ELSE
		*Windows
			@ 5, 33 TO 5, 135 CLEAR
			@ 5, 33 SAY MVCH2 FONT 'FOXFONT',11
		ENDIF
		
			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF

      SELECT 1
      SEEK STR(MVCH_TYPE,1)+STR(MVCH_NO1,2)+STR(MVCH_NO2,5)

      
    IF _DOS
      
      		IF .not. FOUND()
         		?? CHR(7)
         		@ 23, 1 SAY SPACE(78)
         		@ 23, 15 SAY 'This Voucher No Does Not Exists  -- Press any key'
         		WAIT ''
         		@ 23, 10 SAY SPACE(75)
         		LOOP
      		ENDIF
	
	ELSE
	*Windows

      		IF .not. FOUND()
         		@ 29, 0 TO 30, 135 CLEAR
         		@ 29, 15 SAY 'This Voucher No Does Not Exists  -- Press any key' ;
         			FONT 'FOXFONT',11
         		WAIT ''
         		@ 29, 0 TO 30, 135 CLEAR
         		LOOP
      		ENDIF
	
	ENDIF

      ABC= 1

   ENDDO

   EXIT


ENDDO


MSNO= 1
PAGE= 0
HEAD= .T.


DO WHILE .not. EOF()

   MVCH_NO1= VCH_NO1
   MVCH_NO2= VCH_NO2


   DO WHILE VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
      
      IF HEAD
      
         CLEAR
      
         	IF FLAG='Y'

				IF _DOS
            		SET COLOR TO */w
				ELSE
					SET COLOR TO
				ENDIF

            	IF _DOS
            		@ 3, 5 SAY 'Posted Voucher '
				ELSE
					@ 3, 5 SAY 'Posted Voucher ' FONT 'FOXFONT',11
				ENDIF

				
				IF _DOS
            		SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF

       		
       		ELSE
       		*IF FLAG='Y'

				IF _DOS
            		SET COLOR TO */w
				ELSE
					SET COLOR TO
				ENDIF

            	IF _DOS
            		@ 3, 5 SAY 'Not Yet Posted '
				ELSE
					@ 3, 5 SAY 'Not Yet Posted ' FONT 'FOXFONT',11
				ENDIF
				
				
				IF _DOS
            		SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF

         
         ENDIF
         *IF FLAG='Y'
         
         
         PAGE= PAGE+1
         
         	IF _DOS
         		@ 2, 1 TO 2, 79 DOUBLE
         		@ 1, 30 SAY 'VOUCHER  DISPLAY '
         		@ 1, 60 SAY 'PAGE #'
         		@ 1, 67 SAY PAGE PICTURE '999'
         		SELECT 1
         		@ 5, 40 SAY 'Date:          '
			ELSE
			*Windows
         		@ 2, 0 TO 2, 135 DOUBLE
         		@ 1, 30 SAY 'VOUCHER  DISPLAY - TYPE WISE ' FONT 'FOXFONT',11
         		@ 1, 110 SAY 'PAGE #' FONT 'FOXFONT',11
         		@ 1, 120 SAY PAGE PICTURE '999' FONT 'FOXFONT',11
         		SELECT 1
         		@ 5, 80 SAY 'Date:' FONT 'FOXFONT',11
			
			ENDIF


			IF _DOS
         		SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF



         		IF _DOS
         			@ 5, 50 SAY DATE
				ELSE
				*Windows
					@ 5, 90 SAY DATE FONT 'FOXFONT',11
				ENDIF



			IF _DOS
         		SET COLOR TO 7/1 
			ELSE
				SET COLOR TO
			ENDIF



			IF _DOS
         		@ 3, 40 SAY 'Voucher Type  '
         		MSNO= 1
			ELSE
			*Windows
         		@ 3, 80 SAY 'Voucher Type' FONT 'FOXFONT',11
         		MSNO= 1
			ENDIF



			IF _DOS
         		SET COLOR TO /w 
			ELSE
				SET COLOR TO
			ENDIF


				IF _DOS
         			@ 3, 54 SAY MVCH_TYPE PICTURE '9'
				ELSE
				*Windows
					@ 3, 98 SAY MVCH_TYPE PICTURE '9' FONT 'FOXFONT',11
				ENDIF

	
			IF _DOS	
         		IF MVCH_TYPE=1
            		@ 3, 58 SAY 'CR'
            		T= 'CR-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=1
            		@ 3, 105 SAY 'CR-Cash Receipt' FONT 'FOXFONT',11
            		T= 'CR-'
         		ENDIF
			ENDIF


			IF _DOS
         		IF MVCH_TYPE=2
            		@ 3, 58 SAY 'CP'
            		T= 'CP-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=2
            		@ 3, 105 SAY 'CP-Cash Payment' FONT 'FOXFONT',11
            		T= 'CP-'
         		ENDIF
			ENDIF

			IF _DOS
         		IF MVCH_TYPE=3
            		@ 3, 58 SAY 'BR'
            		T= 'BR-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=3
            		@ 3, 105 SAY 'BR-Bank Receipt' FONT 'FOXFONT',11
            		T= 'BR-'
         		ENDIF
			ENDIF
			

			IF _DOS
						
         		IF MVCH_TYPE=4
            		@ 3, 58 SAY 'BP'
            		T= 'BP-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=4
            		@ 3, 105 SAY 'BP-Bank Payment' FONT 'FOXFONT',11
            		T= 'BP-'
         		ENDIF
			
			ENDIF
			
			IF _DOS
						
         		IF MVCH_TYPE=5
            		@ 3, 58 SAY 'JV'
            		T= 'JV-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=5
            		@ 3, 105 SAY 'JV-Journal' FONT 'FOXFONT',11
            		T= 'JV-'
         		ENDIF
			
			ENDIF
			
			IF _DOS
			
         		IF MVCH_TYPE=6
            		@ 3, 58 SAY 'SV'
            		T= 'SV-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=6
            		@ 3, 105 SAY 'SV-Sales' FONT 'FOXFONT',11
            		T= 'SV-'
         		ENDIF
			
			ENDIF
			
			IF _DOS
						
         		IF MVCH_TYPE=7
            		@ 3, 58 SAY 'PV'
            		T= 'PV-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=7
            		@ 3, 105 SAY 'PV-Purchase' FONT 'FOXFONT',11
            		T= 'PV-'
         		ENDIF
			
			ENDIF
			
         
         
         MVCH_NO1= VCH_NO1
         MVCH_NO2= VCH_NO2

         MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))
         MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))



			IF _DOS
         		SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF



			IF _DOS
         		@ 5, 5 SAY 'Voucher No '
			ELSE
			*Windows
				@ 5, 5 SAY 'Voucher No:' FONT 'FOXFONT',11
			ENDIF
			
			
			IF _DOS
         		SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF

         		IF _DOS
         		
         			@ 5, 17 SAY T
         			@ 5, 20 SAY '  -     '
         			@ 5, 20 SAY MVCH1
         			@ 5, 23 SAY MVCH2
				ELSE
				*Windows
         			@ 5, 20 SAY T FONT 'FOXFONT',11
         			@ 5, 24 SAY MVCH1 FONT 'FOXFONT',11
         			@ 5, 27 SAY '-' FONT 'FOXFONT',11
         			@ 5, 29 SAY MVCH2 FONT 'FOXFONT',11
				
				ENDIF
				
				
			IF _DOS
         		SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF


	IF _DOS
	
         @ 6, 1 SAY REPLICATE('-',78)
         @ 7, 2 SAY 'SR   ACCT-NO.  T I T L E                    DR/CR     DR-AMT.       CR-AMT.  '
         L= 8
	ELSE
	*Windows
		@ 6, 0 TO 6, 135 DOUBLE
        @ 6.100, 2 SAY 'SR' FONT 'Arial Narrow',8
        @ 6.100, 6 SAY 'ACCT-CODE' FONT 'Arial Narrow',8
        @ 6.100, 20 SAY 'T I T L E' FONT 'Arial Narrow',8
        @ 6.100, 55 SAY 'Description' FONT 'Arial Narrow',8
        @ 6.100, 100 SAY 'DR/CR' FONT 'Arial Narrow',8
        @ 6.100, 110 SAY 'DR-AMT' FONT 'Arial Narrow',8
        @ 6.100, 125 SAY 'CR-AMT' FONT 'Arial Narrow',8
        @ 7, 0 TO 7,135 DOUBLE
        
        L= 8
	
	ENDIF




HEAD= .F.

ENDIF
*IF HEAD



      MC1= C1
      MC2= C2
      MC3= C3


		IF _DOS
      		SET COLOR TO /w
		ELSE
			SET COLOR TO
		ENDIF


		IF _DOS
		
      		@ L, 3 SAY SR_NO PICTURE '99'
      		@ L, 6 SAY '  -  -   '
      		MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
      		MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
      		MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
      		@ L, 6 SAY MPC1
      		@ L, 9 SAY MPC2
      		@ L, 12 SAY MPC3
		
		ELSE
		*Windows
      		@ L, 3 SAY SR_NO PICTURE '99' FONT 'Arial Narrow',8
      		MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
      		MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
      		MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
      		@ L, 6 SAY MPC1 FONT 'Arial Narrow',8
      		@ L, 8 SAY '-' FONT 'Arial Narrow',8
      		@ L, 9 SAY MPC2 FONT 'Arial Narrow',8
      		@ L, 11 SAY '-' FONT 'Arial Narrow',8
      		@ L, 12 SAY MPC3 FONT 'Arial Narrow',8
		ENDIF



		IF _DOS
      		SET COLOR TO 7/1
		ELSE
			SET COLOR TO
		ENDIF



      SELECT 2
      SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)


			IF _DOS
			
		      	IF FOUND()
         			@ L, 17 SAY TITLE
      			ELSE
         			@ L, 17 SAY ' '
      			ENDIF
			ELSE
			*Windows
		      	IF FOUND()
         			@ L, 17 SAY TITLE FONT 'Arial Narrow',8
      			ELSE
         			@ L, 17 SAY ' ' FONT 'Arial Narrow',8
      			ENDIF
			
			ENDIF


      SELECT 1

			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF


			IF _DOS
      			SET COLOR TO /W
			ELSE
				SET COLOR TO
			ENDIF

      		IF _DOS
      			@ L, 47 SAY DR_CR
      		ELSE
      		*Windows
      			
      			@ L, 48 SAY ALLTRIM(descrip)+" "+ALLTRIM(descrip1) ;
      				PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
      				FONT 'Arial Narrow',8
      			
      			@ L, 100 SAY DR_CR FONT 'Arial Narrow',8
      		ENDIF
      
      
      
      IF DR_CR='DR'
         
         	IF _DOS
         		@ L, 50 SAY AMOUNT PICTURE '999,999,999.99'
			ELSE
			*Windows
				@ L, 107 SAY AMOUNT PICTURE '999,999,999.99' FONT 'Arial Narrow',8
			ENDIF

				IF _DOS
         			SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF

      ELSE
      *IF DR_CR='DR'

         	IF _DOS
         		@ L, 64 SAY AMOUNT PICTURE '999,999,999.99'
			ELSE
			*Windows
				@ L, 122 SAY AMOUNT PICTURE '999,999,999.99' FONT 'Arial Narrow',8
			ENDIF
			
			IF _DOS
         		SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF

      ENDIF
      *IF DR_CR='DR'

			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF

      
      		IF _DOS
      		
      			IF L>20
         				IF .not. EOF()
            				SKIP
         				ENDIF
         			EXIT
      			ENDIF
      		
      		ELSE
      		*Windows
      			IF L>26
         				IF .not. EOF()
            				SKIP
         				ENDIF
         			EXIT
      			ENDIF
      		
      		ENDIF
      
      
      
      IF VCH_NO1<>MVCH_NO1.and.VCH_NO2<>MVCH_NO2
         EXIT
      ENDIF
      
      
      IF EOF()
         EXIT
      ENDIF
      
      
      							L= L+1
      
      
      IF .not. EOF()
         SKIP
      ENDIF
   
   
   ENDDO
   
   
   			IF _DOS
   				
   				@ 23, 1 SAY REPLICATE('-',79)
   				@ 24, 5 SAY 'For Next Page Press :'
   				@ 24, 30 SAY 'For Previous Page :'
   				@ 24, 60 SAY 'Quit :'
			
			ELSE
			*Windows
			
   				@ 28, 0 TO 28,135 DOUBLE
   				@ 29, 35 SAY 'For Next Page Press : Down-Arrow' ;
   					FONT 'Arial Narrow',8
   				@ 29, 70 SAY 'For Previous Page : Up-Arrow';
   					FONT 'Arial Narrow',8
   				@ 29, 110 SAY 'Quit : Left-Arrow';
   					FONT 'Arial Narrow',8
			
			ENDIF


			IF _DOS
   				SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF


			IF _DOS
			
   				@ 24, 27 SAY CHR(25)
   				@ 24, 50 SAY CHR(24)
   				@ 24, 67 SAY CHR(17)+CHR(45)+CHR(45)
			ELSE
			*Windows
			
				* no chracters of arrows in windows			
			ENDIF


			IF _DOS
   				SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF



   CHO= 0

			IF _DOS
			
   				DO WHILE .T.
      				@ 24, 70 GET CHO PICTURE '@z 9'
      				READ
      					IF READKEY()=0.or.READKEY()=4.or.READKEY()=5
         					EXIT
      					ENDIF
   				ENDDO
			
			ELSE
			*Windows

   				DO WHILE .T.
      				@ 31, 125 GET CHO PICTURE '@z 9' FONT 'Arial Narrow',8
      				READ
      					IF READKEY()=0.or.READKEY()=4.or.READKEY()=5
         					EXIT
      					ENDIF
   				ENDDO
			
			
			ENDIF


   IF READKEY()=0
      CLEAR
      CLOSE ALL
      CLOSE DATA
      RETURN
   ENDIF
   
   
   IF READKEY()=4
      CLEAR
      HEAD= .T.
      CNT= 0
      DO WHILE .T.
         SELECT 1
         IF BOF()
            RETURN
         ENDIF
         SKIP  -1
         IF SR_NO=1
            CNT= CNT+1
            IF CNT=2
               EXIT
            ELSE
               LOOP
            ENDIF
         ENDIF
      ENDDO
   ENDIF
   
   
   IF READKEY()=5
      HEAD= .T.
   ENDIF


ENDDO



CLEAR
CLOSE ALL


RETURN
******************




**************************************
* ---------- View On Screen ------   *
* 10 - Vouchers ....... Date Wise    *
**************************************
PROCEDURE vch_dvew
**********************

* Revision 22-07-2008
* at Smaks Group


CLEAR
CLOSE ALL
 *SET CLOCK ON
 *SET CLOCK TO 24,68


SELECT 1
USE tran ORDER trandate

SELECT 2
USE ldgrcode ORDER ac1

*First Screen
*Loop1
DO WHILE .T.

   CLEAR
   
   	IF _DOS
   		@ 6, 20 SAY 'VOUCHER DISPLAY DATE-WISE'
   		@ 21, 50 SAY 'Press Ctrl Q to Return'
   		STORE DATE() TO MDATE, LDATE
   		@ 10, 20 SAY 'Starting Date: ' GET MDATE
   		@ 12, 20 SAY 'Ending   Date: ' GET LDATE
   		READ
   ELSE
   *Windows
   		@ 6, 20 SAY 'VOUCHER DISPLAY DATE-WISE' FONT 'FOXFONT',11
   		@ 21, 50 SAY 'Press Ctrl Q to Return' FONT 'FOXFONT',11
   		STORE DATE() TO MDATE, LDATE
   		@ 10, 20 SAY 'Starting Date: ' FONT 'FOXFONT',11 GET MDATE FONT 'FOXFONT',11 
   		@ 12, 20 SAY 'Ending   Date: ' FONT 'FOXFONT',11 GET LDATE FONT 'FOXFONT',11 
   		READ
   
   ENDIF
   
   IF READKEY()=12
      CLEAR
      CLOSE DATA
      CLOSE ALL
      RETURN
   ENDIF

   SELECT 1

   LOCATE FOR DATE >= MDATE .and. DATE <= LDATE

	IF _DOS	   

	   IF .not. FOUND()
    	  	@ 23, 10 SAY 'No Voucher is Present For this Date ...'
      		WAIT ''
      		@ 23, 10
      		STORE DATE() TO MDATE
      		LOOP
   		ENDIF

	ELSE
	*Windows

	   IF .not. FOUND()
    	  	@ 28, 10 SAY 'No Voucher is Present For this Date ...';
    	  		FONT 'FOXFONT',11;
    	  		COLOR RGB(255,0,0) && Red
      		WAIT ''
      		@ 28, 10
      		STORE DATE() TO MDATE
      		LOOP
   		ENDIF

	ENDIF

   CLEAR

   EXIT

ENDDO
*End of Loop1 DO WHILE .T.
*First Screen


SELECT 1

GOTO TOP

SET FILTER TO DATE >= MDATE .and. DATE <= LDATE

GOTO TOP

MSNO= 1

HEAD= .T.

PAGE= 0

*Loop2
DO WHILE .not. EOF()

   MVCH_NO1= VCH_NO1
   MVCH_NO2= VCH_NO2
   MVCH_TYPE= VCH_TYPE


*Loop3
DO WHILE VCH_TYPE = MVCH_TYPE .and. VCH_NO1 = MVCH_NO1 .and. VCH_NO2 = MVCH_NO2


	*
	IF HEAD

    	CLEAR
    		**
    		IF FLAG='Y'

				***
				IF _DOS
            		SET COLOR TO */w
				ELSE
					SET COLOR TO
				ENDIF
				***
        
        		***
        		IF _DOS
            		@ 3, 5 SAY 'Posted Voucher '
				ELSE
            		@ 3, 5 SAY 'Posted Voucher ' FONT 'FOXFONT',11 COLOR RGB(255,0,0) && Red		
				ENDIF
				***
				
				***
				IF _DOS
            		SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF
				***
         	ELSE
			**IF FLAG='Y'
				***

				IF _DOS
            		SET COLOR TO */w
        		ELSE
        			SET COLOR TO
				ENDIF
				***
            	IF _DOS
            		@ 3, 5 SAY 'Not Yet Posted '
				ELSE
					@ 3, 5 SAY 'Not Yet Posted ' FONT 'FOXFONT',11 COLOR RGB(255,0,0) && Red
				ENDIF

				IF _DOS
            		SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF

         ENDIF
         **IF FLAG='Y'



         PAGE= PAGE+1



		IF _DOS
         	@ 2, 1 TO 2, 79 DOUBLE
         	@ 1, 30 SAY 'VOUCHER  DISPLAY '
         	@ 1, 60 SAY 'PAGE #'
         	@ 1, 67 SAY PAGE PICTURE '999'
		ELSE
         	@ 2, 0 TO 2, 135 DOUBLE COLOR RGB(0,0,255) && Blue
         	@ 1, 30 SAY 'VOUCHER  DISPLAY - DATE WISE ' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
         	@ 1, 100 SAY 'PAGE #' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
         	@ 1, 110 SAY PAGE PICTURE '999' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
		ENDIF

        SELECT 1

		IF _DOS
         	@ 5, 40 SAY 'Date:          '
		ELSE
         	@ 5, 90 SAY 'Date:' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
		ENDIF



		IF _DOS
         	SET COLOR TO /w
		ELSE
			SET COLOR TO
		ENDIF

        IF _DOS
         	@ 5, 50 SAY DATE
		ELSE
         	@ 5, 108 SAY DATE FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
		ENDIF
		
		IF _DOS
        	SET COLOR TO 7/1 
		ELSE
			SET COLOR TO
		ENDIF
		
		IF _DOS
        	@ 3, 40 SAY 'Voucher Type  '
		ELSE
			@ 3, 90 SAY 'Voucher Type  ' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
		ENDIF

         MSNO= 1

		IF _DOS
        	SET COLOR TO /w 
		ELSE
			SET COLOR TO
		ENDIF

		IF _DOS
        	@ 3, 54 SAY MVCH_TYPE PICTURE '9'
		ELSE
        	@ 3, 108 SAY MVCH_TYPE PICTURE '9' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green		
		ENDIF
		

		IF _DOS

	        IF MVCH_TYPE=1
    	        @ 3, 58 SAY 'CR'
        	    T= 'CR-'
         	ENDIF

		ELSE
		*Windows

	        IF MVCH_TYPE=1
    	        @ 3, 112 SAY 'CR-Cash Receipt' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
        	    T= 'CR-'
         	ENDIF

		ENDIF

			IF _DOS
		        IF MVCH_TYPE=2
        		    @ 3, 58 SAY 'CP'
            		T= 'CP-'
         		ENDIF
			ELSE
			*Windows
		        IF MVCH_TYPE=2
        		    @ 3, 112 SAY 'CP-Cash Payment' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'CP-'
         		ENDIF
			ENDIF

         
         	IF _DOS
         		IF MVCH_TYPE=3
            		@ 3, 58 SAY 'BR'
            		T= 'BR-'
         		ENDIF
         	
         	ELSE
         	*Windows
         		IF MVCH_TYPE=3
            		@ 3, 112 SAY 'BR-Bank Receipt' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'BR-'
         		ENDIF
         	ENDIF
         
         
         	IF _DOS
         		IF MVCH_TYPE=4
            		@ 3, 58 SAY 'BP'
            		T= 'BP-'
         		ENDIF
         	ELSE
         	*Windows
         		IF MVCH_TYPE=4
            		@ 3, 112 SAY 'BP-Bank Payment' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'BP-'
         		ENDIF
         	ENDIF
         
         
         	IF _DOS
         		IF MVCH_TYPE=5
            		@ 3, 58 SAY 'JV'
            		T= 'JV-'
         		ENDIF
         	ELSE
         	*Windows
         		IF MVCH_TYPE=5
            		@ 3, 112 SAY 'JV-Journal' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'JV-'
         		ENDIF
         	ENDIF
         

			IF _DOS
         		IF MVCH_TYPE=6
            		@ 3, 58 SAY 'SV'
            		T= 'SV-'
         		ENDIF
			ELSE
			*Windows
         		IF MVCH_TYPE=6
            		@ 3, 112 SAY 'SV-Sales' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'SV-'
         		ENDIF
			ENDIF

         
         	IF _DOS
         		IF MVCH_TYPE=7
            		@ 3, 58 SAY 'PV'
            		T= 'PV-'
         		ENDIF
         	ELSE
         	*Windows
         		IF MVCH_TYPE=7
            		@ 3, 112 SAY 'PV-Purchase' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
            		T= 'PV-'
         		ENDIF
         	ENDIF
         
         MVCH_NO1= VCH_NO1
         MVCH_NO2= VCH_NO2
         MVCH1= REPLICATE('0',2-LEN(LTRIM(STR(MVCH_NO1))))+LTRIM(STR(MVCH_NO1))
         MVCH2= REPLICATE('0',5-LEN(LTRIM(STR(MVCH_NO2))))+LTRIM(STR(MVCH_NO2))

		IF _DOS
         SET COLOR TO 7/1
		ELSE
			SET COLOR TO
		ENDIF

         
        IF _DOS 
         @ 5, 5 SAY 'Voucher No '
		ELSE
		*Windows
		 @ 5, 5 SAY 'Voucher No ' FONT 'FOXFONT',11 COLOR RGB(0,0,255) && Blue
		ENDIF
		
		
		IF _DOS
         SET COLOR TO /w
		ELSE
			SET COLOR TO
		ENDIF

			IF _DOS
	         	@ 5, 17 SAY T
    	     	@ 5, 20 SAY '  -     '
        	 	@ 5, 20 SAY MVCH1
         		@ 5, 23 SAY MVCH2
			ELSE
			*Windows
	         	@ 5, 25 SAY T FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
    	     	@ 5, 28 SAY '-' FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
	       	 	@ 5, 29 SAY MVCH1 FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
         		@ 5, 33 SAY MVCH2 FONT 'FOXFONT',11 COLOR RGB(0,75,0) && Dark Green
			ENDIF

		IF _DOS
        	SET COLOR TO 7/1
		ELSE
			SET COLOR TO
		ENDIF

        IF _DOS
        	@ 6, 1 SAY REPLICATE('-',78)
		ELSE
		*Windows
			@ 6, 0 TO 6, 135 DOUBLE COLOR RGB(0,0,255) && Blue
        ENDIF
        
         
         IF _DOS
         	@ 7, 2 SAY 'SR   ACCT-NO.  T I T L E                    DR/CR     DR-AMT.       CR-AMT.  '
         	L= 8
         	HEAD= .F.
      	ELSE
      	*Windows
         	@ 6.100, 2 SAY 'SR.' FONT 'FOXFONT',11
         	@ 6.100, 12 SAY 'ACCT-CODE' FONT 'FOXFONT',11
         	@ 6.100, 30 SAY 'T I T L E' FONT 'FOXFONT',11
         	@ 6.100, 70 SAY 'DR/CR' FONT 'FOXFONT',11
         	@ 6.100, 91 SAY 'DR-AMT' FONT 'FOXFONT',11
         	@ 6.100, 120 SAY 'CR-AMT' FONT 'FOXFONT',11
			
			@ 7, 0 TO 7, 135 DOUBLE COLOR RGB(0,0,255) && Blue
			@ 29, 0 TO 29, 135 DOUBLE COLOR RGB(0,0,255) && Blue
         	
			@ 7.900, 2 TO 7.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 8.900, 2 TO 8.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 9.900, 2 TO 9.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 10.900, 2 TO 10.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 11.900, 2 TO 11.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 12.900, 2 TO 12.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 13.900, 2 TO 13.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 14.900, 2 TO 14.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 15.900, 2 TO 15.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 16.900, 2 TO 16.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 17.900, 2 TO 17.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 18.900, 2 TO 18.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 19.900, 2 TO 19.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 20.900, 2 TO 20.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 21.900, 2 TO 21.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 22.900, 2 TO 22.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 23.900, 2 TO 23.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 24.900, 2 TO 24.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 25.900, 2 TO 25.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 26.900, 2 TO 26.900, 130 DOUBLE COLOR RGB(0,255,100) 
			@ 27.900, 2 TO 27.900, 130 DOUBLE COLOR RGB(0,255,100) 
         	
				PUBLIC mCdir,mDrive
  				STORE sys(5) TO mDrive
 				STORE curdir() TO mCdir
				* BL Bottom Line
				BL = 30
  				@ BL, 3 SAY 'Working Directory :';
				FONT "FoxFont",11
 				@ BL+1, 0 TO BL+1, 135 DOUBLE
 				@ BL+2, 3 SAY ALLTRIM(mDrive)+ALLTRIM(mCdir);
				FONT "FoxFont",11
 				@ BL+2, 75 SAY cdow(date());
				FONT "FoxFont",11
 				@ BL+2, 95 SAY date();
				FONT "FoxFont",11
				* SET CLOCK ON
				* SET CLOCK TO 30,105
         	L= 8
         	HEAD= .F.
      	
      	ENDIF
      
	ENDIF
	*IF HEAD
      
      MC1= C1
      MC2= C2
      MC3= C3

			IF _DOS
      			SET COLOR TO /w
			ELSE
				SET COLOR TO
			ENDIF

      	IF _DOS		
      			
      			@ L, 3 SAY SR_NO PICTURE '99'
      			@ L, 6 SAY '  -  -   '
      			MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
      			MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
      			MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
      			@ L, 6 SAY MPC1
      			@ L, 9 SAY MPC2
      			@ L, 12 SAY MPC3
		ELSE
		*Windows
      			@ L, 3 SAY SR_NO PICTURE '99' FONT 'FOXFONT',11
      			MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1)) 
      			MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2)) 
      			MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3)) 
      			@ L, 10 SAY MPC1 FONT 'FOXFONT',11
      			@ L, 13 SAY '-' FONT 'FOXFONT',11
      			@ L, 15 SAY MPC2 FONT 'FOXFONT',11
      			@ L, 18 SAY '-' FONT 'FOXFONT',11
      			@ L, 20 SAY MPC3 FONT 'FOXFONT',11
	
		ENDIF


			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF

      SELECT 2
      *ldgrcode ORDER ac1
      SEEK STR(MC1,2)+STR(MC2,2)+STR(MC3,3)


		IF _DOS
		    IF FOUND()
         		@ L, 17 SAY TITLE
      		ELSE
         		@ L, 17 SAY ' '
      		ENDIF
		ELSE
		*Windows
		    IF FOUND()
         		@ L, 30 SAY TITLE FONT 'FOXFONT',11
      		ELSE
         		@ L, 30 SAY ' '
      		ENDIF
		ENDIF



      SELECT 1

			IF _DOS
      			SET COLOR TO 7/1
			ELSE
				SET COLOR TO
			ENDIF


					IF _DOS
      					SET COLOR TO /W
					ELSE
						SET COLOR TO
					ENDIF


			IF _DOS
			      @ L, 47 SAY DR_CR
      		ELSE
      		*Windows
			      @ L, 74 SAY DR_CR FONT 'FOXFONT',11
      		ENDIF
      

      *IF BLOCK
      **
      IF DR_CR='DR'
      
	
				IF _DOS
	         		@ L, 50 SAY AMOUNT PICTURE '999,999,999.99'
				ELSE
				*Windows
	         		@ L, 80 SAY AMOUNT PICTURE '999,999,999.99' FONT 'FOXFONT',11
				ENDIF


					IF _DOS
         				SET COLOR TO 7/1
					ELSE
					*Windows
						SET COLOR TO
					ENDIF

      ELSE
      **IF DR_CR='DR'
      **NOW IT IS 'CR'   		
         			
         		IF _DOS
         			@ L, 64 SAY AMOUNT PICTURE '999,999,999.99'
				ELSE
				*Windows
         			@ L, 109 SAY AMOUNT PICTURE '999,999,999.99' FONT 'FOXFONT',11
				ENDIF
				
				
				
					IF _DOS
         				SET COLOR TO 7/1
					ELSE
						SET COLOR TO
					ENDIF

      
      ENDIF
	  **
	  *END OF IF BLOCK
		
		
		
				IF _DOS
    	  			SET COLOR TO 7/1
				ELSE
					SET COLOR TO
				ENDIF


		IF _DOS

		      IF L>20
      
        		 	IF .not. EOF()
            			SKIP
         			ENDIF
      
         			EXIT
      
      		ENDIF
      		*L>20
      	ELSE
      	*Windows Revision on 22-07-2008
		      IF L>26
      
        		 	IF .not. EOF()
            			SKIP
         			ENDIF
      
         			EXIT
      
      		ENDIF
      		*L>26
      	ENDIF


      **
      IF VCH_TYPE<>MVCH_TYPE.and.VCH_NO1<>MVCH_NO1.and.VCH_NO2<>MVCH_NO2
         EXIT
      ENDIF
      **
      **
      IF EOF()
         EXIT
      ENDIF
      **


							      L= L+1



      **
      IF .not. EOF()
         SKIP
      ENDIF
      **
   ENDDO
   * Loop3 - DO WHILE VCH_TYPE=MVCH_TYPE.and.VCH_NO1=MVCH_NO1.and.VCH_NO2=MVCH_NO2
   
   
   
   
   		IF _DOS
			   	@ 23, 1 SAY REPLICATE('-',79)
   				@ 24, 5 SAY 'For Next Page Press :'
   				@ 24, 30 SAY 'For Previous Page :'
   				@ 24, 60 SAY 'Quit :'
		ELSE
		*Windows

   				@ 30, 35 SAY 'For Next Page Press Down-Arrow' FONT 'Arial Narrow',8
   				@ 30, 65 SAY 'For Previous Page Up-Arrow' FONT 'Arial Narrow',8
   				@ 30, 100 SAY 'For Quit Press Left-Arrow' FONT 'Arial Narrow',8
	
		ENDIF



	IF _DOS
   		SET COLOR TO /w
	ELSE
		SET COLOR TO
	ENDIF


			IF _DOS
   				@ 24, 27 SAY CHR(25)
   				@ 24, 50 SAY CHR(24)
   				@ 24, 67 SAY CHR(17)+CHR(45)+CHR(45)
			ELSE
			*Windows
   				@ 30, 125 SAY CHR(17)+CHR(45)+CHR(45)
			ENDIF
			
			
	IF _DOS
   		SET COLOR TO 7/1
	ENDIF


   CHO= 0



		IF _DOS
		   	DO WHILE .T.
      			@ 24, 70 GET CHO PICTURE '@z 9'
      			READ
      				IF READKEY()=0.or.READKEY()=4.or.READKEY()=5
         				EXIT
      				ENDIF
   			ENDDO
		ELSE
		*Windows
		   	DO WHILE .T.
      			@ 30, 128 GET CHO PICTURE '@z 9' FONT 'FOXFONT',11
      			READ
      				IF READKEY()=0.or.READKEY()=4.or.READKEY()=5
         				EXIT
      				ENDIF
   			ENDDO
		ENDIF



   IF READKEY()=0
      CLEAR
      CLOSE ALL
      CLOSE DATA
      RETURN
   ENDIF



   IF READKEY()=4
      CLEAR
      HEAD= .T.
      CNT= 0

	*Loop-2
      DO WHILE .T.
         SELECT 1
         IF BOF()
            RETURN
         ENDIF
         SKIP  -1
         IF SR_NO=1
            CNT= CNT+1
            IF CNT=2
               EXIT
            ELSE
               LOOP
            ENDIF
         ENDIF
      ENDDO
	*End of Loop-2


   ENDIF
   IF READKEY()=5
      HEAD= .T.
   ENDIF



ENDDO
*End of Loop2- DO WHILE .not. EOF()

CLEAR
CLOSE ALL

 *SET CLOCK ON
 *SET CLOCK TO 24,68

RETURN
**************

*****************************
PROCEDURE VPOP001 && VALID VPOP001
*****************************

MC1 = Ldgr0001.C1
MC2 = Ldgr0001.C2
MC3 = Ldgr0001.C3

RETURN
*********************














************************
PROCEDURE GEN0001
*****************************

SELECT * FROM item;
WHERE INV=.T.;
ORDER BY item;
INTO CURSOR item0001


DEFINE POPUP _1ld12jnkf ;
PROMPT FIELD "  "+item0001.item+STR(I1,2)+"-"+STR(I2,2)+"-"+STR(I3,4) ;
SCROLL


@ 18,30 GET mItem ;
 	PI