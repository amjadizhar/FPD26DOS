*****************************************************
* PROGRAM: BHM_PROC.PRG
* Author: Amjad Izhar
* Budget Heads Maintenance
* Revised Again On : 18-01-2001
*****************************************************

* 1 - Budget Heads ..... Creation 			 budg_ent
* 2 - Budget Heads ..... Printing/Display 	 budg_prt


*******************************************************
* 1 - Budget Heads ..... Creation 			 budg_ent *
*******************************************************
PROCEDURE budg_ent
**********************

CLEAR
CLOSE ALL
SET CONFIRM OFF

IF _DOS
SET COLOR TO 7/1
ENDIF

SELECT 1
USE ldgrcode ORDER ac1

SELECT 3
USE chart ORDER crt

STORE 0 TO MC1, MC2, MC3
DO WHILE .T.
   CLEAR
   DO top IN tbl_proc.prg

IF _DOS
   SET COLOR TO +7/1
ENDIF

   @ 6, 25 SAY 'Budget Maintenance Entry '

IF _DOS
   SET COLOR TO 7/1 
ENDIF

   @ 23, 1 TO 23, 79
   SELECT 1

IF _DOS
   SET COLOR TO 7/1
ENDIF

   @ 24, 51 SAY 'Press Ctrl Q To Quit '
   @ 8, 8 SAY 'Ledger Head Code '

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 8, 30 SAY '  -  -   '
   @ 8, 30 GET MC1 PICTURE '@z 99'

IF _DOS
   SET COLOR TO 7/1
ENDIF

   READ
   IF READKEY()=12
      CLEAR
      CLOSE ALL
      SET CONFIRM OFF
      RETURN
   ENDIF
   @ 24, 50 CLEAR TO 24, 78
   IF MC1=0
      LOOP
   ENDIF
   SELECT 3
   SET FILTER TO MC1>=FR.and.MC1<=TO
   GOTO TOP
   IF MC1>=FR.and.MC1<=TO
      SEEK STR(FR,2)+STR(TO,2)
      IF FOUND()
         MCH= CHART
      ENDIF
   ENDIF
   SET FILTER TO
   SELECT 1
   IF MC1<10
      @ 24, 1 SAY 'Code C1 less than 10 not allowed.'
      WAIT ''
      @ 24, 1
      LOOP
   ENDIF

IF _DOS
   SET COLOR TO *+7/1
ENDIF

   @ 8, 50 SAY MCH

IF _DOS
   SET COLOR TO 7/1
ENDIF

   IF MC1>99.and.MC1<100

IF _DOS
      SET COLOR TO *+7/1
ENDIF

      @ 8, 50 SAY 'Not Defined Head      '

IF _DOS
      SET COLOR TO 7/1
ENDIF

   ENDIF
   MPC1= REPLICATE('0',2-LEN(LTRIM(STR(MC1))))+LTRIM(STR(MC1))

IF _DOS
   SET COLOR TO /w
ENDIF

   @ 8, 30 SAY MPC1
   @ 8, 33 GET MC2 PICTURE '@z 99'
   READ
   MPC2= REPLICATE('0',2-LEN(LTRIM(STR(MC2))))+LTRIM(STR(MC2))
   @ 8, 33 SAY MPC2
   @ 8, 36 GET MC3 PICTURE '@z 999'
   READ
   MPC3= REPLICATE('0',3-LEN(LTRIM(STR(MC3))))+LTRIM(STR(MC3))
   @ 8, 36 SAY MPC3

IF _DOS
   SET COLOR TO 7/1
ENDIF


   IF READKEY()=12
      CLOSE DATA
      CLEAR
      RETURN
   ENDIF
   SELECT 1
   STORE STR(MC1,2)+STR(MC2,2)+STR(MC3,3) TO MLCODE
   SEEK MLCODE
   IF .not. FOUND()
      @ 24, 15 SAY 'This Code Does Not Exist  -- Please Re-try '
      WAIT ''
      @ 24, 8 CLEAR TO 24, 63
      LOOP
   ENDIF
   IF MC3=0
      @ 12, 1 CLEAR TO 22, 79
      @ 12, 8 SAY ' Note:-   Three zeros at the end of the ledger code'
      @ 13, 8 SAY '          will make it a consolidation head i.e you'
      @ 14, 8 SAY '          will  not be  able  to Post  Transactions'
      @ 15, 8 SAY '          directly into this head.'
      @ 16, 8 SAY '          Hit any key to continue ..........'
      WAIT ''
      CLEAR
      LOOP
   ENDIF
   @ 10, 8 SAY 'Title of Ledger Head ' GET TITLE
   CLEAR GETS
   IF SR_NO>1
      @ 14, 17 SAY 'Transactions already  exist for this  '
      @ 15, 17 SAY 'Ledger Head  therefore  you can only  '
      @ 16, 17 SAY 'make changes in the Title and cannot  '
      @ 17, 17 SAY 'make changes in the Budget Amount   '
      WAIT ''
      CLEAR
      LOOP
   ENDIF
   IF SR_NO=1.and.C3<>0
      @ 12, 8 SAY 'Budget Amount  Rs.   ' GET BUDGET PICTURE '999999999.99'
      READ
   ENDIF
   Q= ' '
   DO WHILE .not. Q$'YN'
      @ 24, 25 SAY 'More Data Entry - Y/N' GET Q FUNCTION '!'
      READ
   ENDDO
   IF Q='N'
      CLEAR
      CLOSE ALL
      SET CONFIRM OFF
      RETURN
   ENDIF
   MC3= MC3+1
ENDDO

RETURN
********************


*******************************************************
* 2 - Budget Heads ..... Printing/Display 	 budg_prt *
*******************************************************
PROCEDURE budg_prt
**********************

CLEAR
CLOSE ALL
USE ldgrcode ORDER ac1

IF RECCOUNT()=0
   CLEAR
   @ 12, 12 SAY 'No Ledger Heads Exist in Data File  -  Press any key to return to menu .... '
   WAIT ''
   CLEAR
   CLOSE ALL
   RETURN
ENDIF
P= ' '
DO WHILE .not. P$'PSQ'
   @ 23, 45 SAY 'Printer/Screen/Quit  -  P/S/Q  ' GET P FUNCTION '!'
   READ
ENDDO
IF P='Q'
   CLOSE ALL
   CLEAR
   RETURN
ENDIF
IF P='S'
   CLEAR
   SET PRINTER OFF
   SET DEVICE TO SCREEN
ELSE
   CLEAR
   PANS= ' '
   do PRNCHK in tbl_proc
   IF PANS='Q'
      CLOSE ALL
      CLEAR
      RETURN
   ENDIF
   @ 11, 20 SAY 'Please wait ... Printing in progress '
   SET PRINTER ON
   SET DEVICE TO PRINTER
ENDIF
HEADING= .T.
PAGE= 0
DO WHILE .not. EOF()
   IF HEADING
      L= 3
      PAGE= PAGE+1
      IF P='P'
         DO top_prt1 IN tbl_proc.prg
         @ 3, 15 SAY CHR(18)
         @ 3, 33 SAY 'BUDGET  HEADS'
         @ 4, 32 SAY '--------------'
         @ 4, 65 SAY 'Page -'
         @ 4, 71 SAY PAGE PICTURE '99'
         L= L+1
      ELSE
         DO screen IN tbl_proc.prg
         @ 3, 30 SAY 'BUDGET  HEADS'
         L= L+1
         @ L, 30 SAY '--------------                   Page - '
         @ L, 70 SAY PAGE PICTURE '999'
      ENDIF
      L= L+2
      @ L, 7 SAY 'Code'
      @ L, 28 SAY 'Title'
      @ L, 52 SAY 'Budget'
      L= L+1
      @ L, 5 SAY REPLICATE('-',72)
      HEADING= .F.
   ENDIF
   IF C3=0
      SKIP
      LOOP
   ENDIF
   IF BUDGET=0
      SKIP
      LOOP
   ENDIF
   L= L+1
   IF C2=0.and.C3=0.and.RIGHT(STR(C1),1)='0'
      L= L+1
      MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
      @ L, 5 SAY MPC1
      @ L, 7 SAY '-'
      MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
      @ L, 8 SAY MPC2
      @ L, 10 SAY '-'
      MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
      @ L, 11 SAY MPC3
      @ L, 20 SAY TITLE
      MLEN= LEN(RTRIM(TITLE))
      L= L+1
      @ L, 5 SAY REPLICATE('-',15+MLEN)
   ENDIF
   IF C3=0.and.RIGHT(STR(C1),1)<>'0'
      L= L+1
      MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
      @ L, 5 SAY MPC1
      @ L, 7 SAY '-'
      MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
      @ L, 8 SAY MPC2
      @ L, 10 SAY '-'
      MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
      @ L, 11 SAY MPC3
      @ L, 20 SAY TITLE
   ELSE
      IF C3<>0
         MPC1= REPLICATE('0',2-LEN(LTRIM(STR(C1))))+LTRIM(STR(C1))
         @ L, 8 SAY MPC1
         @ L, 10 SAY '-'
         MPC2= REPLICATE('0',2-LEN(LTRIM(STR(C2))))+LTRIM(STR(C2))
         @ L, 11 SAY MPC2
         @ L, 13 SAY '-'
         MPC3= REPLICATE('0',3-LEN(LTRIM(STR(C3))))+LTRIM(STR(C3))
         @ L, 14 SAY MPC3
         @ L, 20 SAY TITLE
      ENDIF
   ENDIF
   @ L, 45 SAY BUDGET PICTURE '999,999,999.99'
   SKIP
   IF EOF()
      IF P='P'
         EJECT
         SET PRINTER OFF
         SET DEVICE TO SCREEN
      ENDIF
   ENDIF
   IF P='S'
      IF L>21
         @ 24, 15 SAY ''
         XYZ= ' '
         DO WHILE .not. XYZ$'CQ'
            SET CONFIRM OFF
            @ 24, 55 SAY 'Continue/Quit - C/Q ' GET XYZ FUNCTION '!'
            READ
         ENDDO
         IF XYZ='Q'
            CLEAR
            CLOSE ALL
            RETURN
         ENDIF
         CLEAR
         L= 3
         HEADING= .T.
      ENDIF
   ENDIF
   IF P='P'
      IF L>56
         EJECT
         L= 3
         HEADING= .T.
      ENDIF
   ENDIF
ENDDO
IF P='S'
   @ 24, 7 SAY 'End of Screen Printing  -  Press any key to return to menu.... '
   WAIT ''
ELSE
   EJECT
   SET PRINTER OFF
   SET DEVICE TO SCREEN
ENDIF
CLOSE ALL


RETURN
*******************

