* A-MAIN.FXP    û 
* ATTEND.FRX      
* ATTEND.FRT      
* ATTEND.FXP    û 
* C-CATEG.FXP   û 
* C-CHECK.FXP   û 
* C-HOLIDA.FXP  û 
* C-PASS.FXP    û 
* C-ROUTE.FXP   û 
* C-SALE.FXP    û 
* C-SALESM.FXP  û 
* C-SHOP.FXP    û 
* C-WEEK.FXP    û 
* CATEG.FRX       
* CATEG.FRT       
* CATEG.FXP     û 
* D-ATTEND.FXP  û 
* D-CATEG.FXP   û 
* D-HOLIDA.FXP  û 
* D-ROUTE.FXP   û 
* D-SALE.FXP    û 
* D-SALESM.FXP  û 
* D-SHOP.FXP    û 
* D-SROUT.FXP   û 
* D-WEEK.FXP    û 
* HOLIDAY.FRX     
* HOLIDAY.FRT     
* HOLIDAY.FXP   û 
* PASS.FXP      û 
* R-ATTEND.FXP  û 
* R-CATEG.FXP   û 
* R-HOLIDA.FXP  û 
* R-ROUTE.FXP   û 
* R-SALESM.FXP  û 
* R-SHOP.FXP    û 
* R-SROUT.FXP   û 
* R-WEEK.FXP    û 
* RDT.FRX         
* RDT.FRT         
* RDT.FXP       û 
* REINDEX.FXP   û 
* ROUTE.FRX       
* ROUTE.FRT       
* ROUTE.FXP     û 
* RSD.FXP       û 
* RSMAN.FXP     û 
* RWS.FXP       û 
* RWSALE.FXP    û 
* SALE.FXP      û 
* SALESMEN.FRX    
* SALESMEN.FRT    
* SALESMEN.FXP  û 
* SHOP.FRX        
* SHOP.FRT        
* SHOP.FXP      û 
* SROUT.FRX       
* SROUT.FRT       
* SROUT.FXP     û 
* WEEK.FRX        
* WEEK.FRT        
* WEEK.FXP      û 
* CSROUT.FRX      
* CSROUT.FRT      
* RSWEEK.FXP    û 
* RBSTAND.FXP   û 
* D-SUND.FXP    û 
* R-SUND.FRX      
* R-SUND.FRT      
* R-SUND.FXP    û 
* SUNDAY.FXP    û 
* C-FILE.FXP    û 
* R-UNACTI.FXP  û 
* =========================== 
* 
* 
* A-MAIN.FXP 
* ---------- 
*


CLEAR
CLEA ALL
CLOSE ALL

DO A_Main


***********************
PROCEDURE A_Main
***********************

PUBLIC BACKGRND, OPENDBFS
CLEAR
CLEAR ALL
CLOSE ALL
SET DATE BRIT
SET CENTURY ON
SET SCOREBOARD OFF
SET BELL OFF
SET SAFETY OFF
SET TALK OFF
SET CONFIRM OFF
SET STATUS OFF
SET STEP OFF
SET ECHO OFF
SET DOHISTORY OFF
SET EXCLUSIVE OFF
SET SYSMENU OFF
SET DELETED ON
CLEAR MACROS
DO BACKGRND
DO C_File
DO OPENDBFS
DO UPDATEPRO
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
ON KEY LABEL Escape ?? CHR(7)
SAVE SCREEN TO BACKGRND
DEFINE POPUP MAINMENU FROM 1, 1 TO 17, 30 COLOR SCHEME 1
DEFINE BAR 1 OF MAINMENU PROMPT '²²²²²²²  Main Menu   ²²²²²²²' SKIP
DEFINE BAR 2 OF MAINMENU PROMPT '\-'
DEFINE BAR 3 OF MAINMENU PROMPT ' Daily Sales \<Entry'
DEFINE BAR 4 OF MAINMENU PROMPT '\-'
DEFINE BAR 5 OF MAINMENU PROMPT ' \<Reports'
DEFINE BAR 6 OF MAINMENU PROMPT '\-'
DEFINE BAR 7 OF MAINMENU PROMPT ' Routes Set-\<Up'
DEFINE BAR 8 OF MAINMENU PROMPT '\-'
DEFINE BAR 9 OF MAINMENU PROMPT ' \<Database Maintenance'
DEFINE BAR 10 OF MAINMENU PROMPT '\-'
DEFINE BAR 11 OF MAINMENU PROMPT ' System \<Maintenance'
DEFINE BAR 12 OF MAINMENU PROMPT '\-'
DEFINE BAR 13 OF MAINMENU PROMPT ' \<System Security'
DEFINE BAR 14 OF MAINMENU PROMPT '\-'
DEFINE BAR 15 OF MAINMENU PROMPT ' \<Quit'
ON SELECTION POPUP MAINMENU DO mmchoice
DEFINE POPUP SALMENU FROM 3, 25 TO 17, 51 COLOR SCHEME 10
DEFINE BAR 1 OF SALMENU PROMPT '°°°°°°°° Sale Menu °°°°°°°°' SKIP
DEFINE BAR 2 OF SALMENU PROMPT '\-'
DEFINE BAR 3 OF SALMENU PROMPT ' \<Entry'
DEFINE BAR 4 OF SALMENU PROMPT '\-'
DEFINE BAR 5 OF SALMENU PROMPT ' \<Correction'
DEFINE BAR 6 OF SALMENU PROMPT '\-'
DEFINE BAR 7 OF SALMENU PROMPT ' \<Deletion'
DEFINE BAR 8 OF SALMENU PROMPT '\-'
DEFINE BAR 9 OF SALMENU PROMPT ' C\<ross Check'
DEFINE BAR 10 OF SALMENU PROMPT '\-'
DEFINE BAR 11 OF SALMENU PROMPT ' Daily \<Transaction Report'
DEFINE BAR 12 OF SALMENU PROMPT '\-'
DEFINE BAR 13 OF SALMENU PROMPT ' E\<xit'
ON SELECTION POPUP SALMENU DO salmenu
DEFINE POPUP REPMENU FROM 5, 25 TO 23, 57 COLOR SCHEME 10
DEFINE BAR 1 OF REPMENU PROMPT '°°°°°°°°°°° Reports °°°°°°°°°°°' SKIP
DEFINE BAR 2 OF REPMENU PROMPT '\-'
DEFINE BAR 3 OF REPMENU PROMPT ' \<Day Report'
DEFINE BAR 4 OF REPMENU PROMPT '\-'
DEFINE BAR 5 OF REPMENU PROMPT ' \<Week Report'
DEFINE BAR 6 OF REPMENU PROMPT '\-'
DEFINE BAR 7 OF REPMENU PROMPT ' Weekly \<Progress Salesmen Wise'
DEFINE BAR 8 OF REPMENU PROMPT '\-'
DEFINE BAR 9 OF REPMENU PROMPT ' Weekly Progress \<Route Wise'
DEFINE BAR 10 OF REPMENU PROMPT '\-'
DEFINE BAR 11 OF REPMENU PROMPT ' Weekly Progress \<Shop Wise'
DEFINE BAR 12 OF REPMENU PROMPT '\-'
DEFINE BAR 13 OF REPMENU PROMPT ' \<Basket & Stand Points'
DEFINE BAR 14 OF REPMENU PROMPT '\-'
DEFINE BAR 15 OF REPMENU PROMPT ' \<Action Shops Today'
DEFINE BAR 16 OF REPMENU PROMPT '\-'
DEFINE BAR 17 OF REPMENU PROMPT ' \<Exit'
ON SELECTION POPUP REPMENU DO repmenu
DEFINE POPUP ROTMENU FROM 7, 25 TO 19, 51 COLOR SCHEME 10
DEFINE BAR 1 OF ROTMENU PROMPT '°°°°° Routes Set-Up °°°°°' SKIP
DEFINE BAR 2 OF ROTMENU PROMPT '\-'
DEFINE BAR 3 OF ROTMENU PROMPT ' \<Entry'
DEFINE BAR 4 OF ROTMENU PROMPT '\-'
DEFINE BAR 5 OF ROTMENU PROMPT ' \<Deletion'
DEFINE BAR 6 OF ROTMENU PROMPT '\-'
DEFINE BAR 7 OF ROTMENU PROMPT ' \<Route Wise Shops List'
DEFINE BAR 8 OF ROTMENU PROMPT '\-'
DEFINE BAR 9 OF ROTMENU PROMPT ' Routes \<Set-Up Report'
DEFINE BAR 10 OF ROTMENU PROMPT '\-'
DEFINE BAR 11 OF ROTMENU PROMPT ' E\<xit'
ON SELECTION POPUP ROTMENU DO rotmenu
DEFINE POPUP DATMENU FROM 9, 25 TO 21, 51 COLOR SCHEME 10
DEFINE BAR 1 OF DATMENU PROMPT '°°°°°°°° Database °°°°°°°°' SKIP
DEFINE BAR 2 OF DATMENU PROMPT '\-'
DEFINE BAR 3 OF DATMENU PROMPT ' \<Entry'
DEFINE BAR 4 OF DATMENU PROMPT '\-'
DEFINE BAR 5 OF DATMENU PROMPT ' \<Correction'
DEFINE BAR 6 OF DATMENU PROMPT '\-'
DEFINE BAR 7 OF DATMENU PROMPT ' \<Deletion'
DEFINE BAR 8 OF DATMENU PROMPT '\-'
DEFINE BAR 9 OF DATMENU PROMPT ' Database \<Report'
DEFINE BAR 10 OF DATMENU PROMPT '\-'
DEFINE BAR 11 OF DATMENU PROMPT ' E\<xit'
ON SELECTION POPUP DATMENU DO datmenu
DEFINE POPUP MANMENU FROM 11, 25 TO 17, 51 COLOR SCHEME 10
DEFINE BAR 1 OF MANMENU PROMPT '°°°°°° Maintenance °°°°°°' SKIP
DEFINE BAR 2 OF MANMENU PROMPT '\-'
DEFINE BAR 3 OF MANMENU PROMPT ' \<Re-Index Data Files'
DEFINE BAR 4 OF MANMENU PROMPT '\-'
DEFINE BAR 5 OF MANMENU PROMPT ' \<Exit'
ON SELECTION POPUP MANMENU DO manMenu
DEFINE POPUP SECMENU FROM 13, 25 TO 19, 51 COLOR SCHEME 10
DEFINE BAR 1 OF SECMENU PROMPT '°°°° System Security °°°°' SKIP
DEFINE BAR 2 OF SECMENU PROMPT '\-'
DEFINE BAR 3 OF SECMENU PROMPT ' \<Change Passwords'
DEFINE BAR 4 OF SECMENU PROMPT '\-'
DEFINE BAR 5 OF SECMENU PROMPT ' \<Exit'
ON SELECTION POPUP SECMENU DO secMenu
DEFINE POPUP SENTMENU FROM 3, 50 TO 11, 77 COLOR SCHEME 10
DEFINE BAR 1 OF SENTMENU PROMPT '°°°°°°°°  Entry  °°°°°°°°' SKIP
DEFINE BAR 2 OF SENTMENU PROMPT '\-'
DEFINE BAR 3 OF SENTMENU PROMPT ' Daily \<Sales'
DEFINE BAR 4 OF SENTMENU PROMPT '\-'
DEFINE BAR 5 OF SENTMENU PROMPT ' \<Daily Un-Attended Routes'
DEFINE BAR 6 OF SENTMENU PROMPT '\-'
DEFINE BAR 7 OF SENTMENU PROMPT ' \<Exit'
ON SELECTION POPUP SENTMENU DO sentMenu
DEFINE POPUP SCORMENU FROM 5, 50 TO 11, 77 COLOR SCHEME 10
DEFINE BAR 1 OF SCORMENU PROMPT '°°°°°°° Correction °°°°°°°' SKIP
DEFINE BAR 2 OF SCORMENU PROMPT '\-'
DEFINE BAR 3 OF SCORMENU PROMPT ' Daily \<Sales'
DEFINE BAR 4 OF SCORMENU PROMPT '\-'
DEFINE BAR 5 OF SCORMENU PROMPT ' \<Exit'
ON SELECTION POPUP SCORMENU DO scorMenu
DEFINE POPUP SDELMENU FROM 7, 50 TO 15, 77 COLOR SCHEME 10
DEFINE BAR 1 OF SDELMENU PROMPT '°°°°°°° Delection °°°°°°°' SKIP
DEFINE BAR 2 OF SDELMENU PROMPT '\-'
DEFINE BAR 3 OF SDELMENU PROMPT ' Daily \<Sales'
DEFINE BAR 4 OF SDELMENU PROMPT '\-'
DEFINE BAR 5 OF SDELMENU PROMPT ' \<Daily Un-Attended Routes'
DEFINE BAR 6 OF SDELMENU PROMPT '\-'
DEFINE BAR 7 OF SDELMENU PROMPT ' \<Exit'
ON SELECTION POPUP SDELMENU DO sdelMenu
DEFINE POPUP DBFREP FROM 3, 50 TO 23, 77 COLOR SCHEME 10
DEFINE BAR 1 OF DBFREP PROMPT '°°°°°Database Reports°°°°°' SKIP
DEFINE BAR 2 OF DBFREP PROMPT '\-'
DEFINE BAR 3 OF DBFREP PROMPT ' \<Routes Data'
DEFINE BAR 4 OF DBFREP PROMPT '\-'
DEFINE BAR 5 OF DBFREP PROMPT ' \<Salesmen Data'
DEFINE BAR 6 OF DBFREP PROMPT '\-'
DEFINE BAR 7 OF DBFREP PROMPT ' Shop \<Type Data'
DEFINE BAR 8 OF DBFREP PROMPT '\-'
DEFINE BAR 9 OF DBFREP PROMPT ' S\<hops Data'
DEFINE BAR 10 OF DBFREP PROMPT '\-'
DEFINE BAR 11 OF DBFREP PROMPT ' \<Week Date'
DEFINE BAR 12 OF DBFREP PROMPT '\-'
DEFINE BAR 13 OF DBFREP PROMPT ' Hoil\<day'
DEFINE BAR 14 OF DBFREP PROMPT '\-'
DEFINE BAR 15 OF DBFREP PROMPT ' Routes \<Attendence'
DEFINE BAR 16 OF DBFREP PROMPT '\-'
DEFINE BAR 17 OF DBFREP PROMPT ' Sunday Wor\<k'
DEFINE BAR 18 OF DBFREP PROMPT '\-'
DEFINE BAR 19 OF DBFREP PROMPT ' \<Exit'
ON SELECTION POPUP DBFREP DO dbfrep
DEFINE POPUP ENTMENU FROM 5, 50 TO 23, 77 COLOR SCHEME 10
DEFINE BAR 1 OF ENTMENU PROMPT '°°°°°°°°  Entry  °°°°°°°°' SKIP
DEFINE BAR 2 OF ENTMENU PROMPT '\-'
DEFINE BAR 3 OF ENTMENU PROMPT ' \<Routes Data'
DEFINE BAR 4 OF ENTMENU PROMPT '\-'
DEFINE BAR 5 OF ENTMENU PROMPT ' \<Salesmen Data'
DEFINE BAR 6 OF ENTMENU PROMPT '\-'
DEFINE BAR 7 OF ENTMENU PROMPT ' Shop \<Type Data'
DEFINE BAR 8 OF ENTMENU PROMPT '\-'
DEFINE BAR 9 OF ENTMENU PROMPT ' S\<hops Data'
DEFINE BAR 10 OF ENTMENU PROMPT '\-'
DEFINE BAR 11 OF ENTMENU PROMPT ' \<Week Date'
DEFINE BAR 12 OF ENTMENU PROMPT '\-'
DEFINE BAR 13 OF ENTMENU PROMPT ' Hoil\<day'
DEFINE BAR 14 OF ENTMENU PROMPT '\-'
DEFINE BAR 15 OF ENTMENU PROMPT ' Sunday Wor\<k'
DEFINE BAR 16 OF ENTMENU PROMPT '\-'
DEFINE BAR 17 OF ENTMENU PROMPT ' \<Exit'
ON SELECTION POPUP ENTMENU DO entMenu
DEFINE POPUP CORMENU FROM 7, 50 TO 23, 77 COLOR SCHEME 10
DEFINE BAR 1 OF CORMENU PROMPT '°°°°°°° Correction °°°°°°°' SKIP
DEFINE BAR 2 OF CORMENU PROMPT '\-'
DEFINE BAR 3 OF CORMENU PROMPT ' \<Routes Data'
DEFINE BAR 4 OF CORMENU PROMPT '\-'
DEFINE BAR 5 OF CORMENU PROMPT ' \<Salesmen Data'
DEFINE BAR 6 OF CORMENU PROMPT '\-'
DEFINE BAR 7 OF CORMENU PROMPT ' Shop \<Type Data'
DEFINE BAR 8 OF CORMENU PROMPT '\-'
DEFINE BAR 9 OF CORMENU PROMPT ' S\<hops Data'
DEFINE BAR 10 OF CORMENU PROMPT '\-'
DEFINE BAR 11 OF CORMENU PROMPT ' \<Week Date'
DEFINE BAR 12 OF CORMENU PROMPT '\-'
DEFINE BAR 13 OF CORMENU PROMPT ' Hoil\<day'
DEFINE BAR 14 OF CORMENU PROMPT '\-'
DEFINE BAR 15 OF CORMENU PROMPT ' \<Exit'
ON SELECTION POPUP CORMENU DO corMenu
DEFINE POPUP DELMENU FROM 5, 50 TO 23, 77 COLOR SCHEME 10
DEFINE BAR 1 OF DELMENU PROMPT '°°°°°°° Delection °°°°°°°' SKIP
DEFINE BAR 2 OF DELMENU PROMPT '\-'
DEFINE BAR 3 OF DELMENU PROMPT ' \<Routes Data'
DEFINE BAR 4 OF DELMENU PROMPT '\-'
DEFINE BAR 5 OF DELMENU PROMPT ' \<Salesmen Data'
DEFINE BAR 6 OF DELMENU PROMPT '\-'
DEFINE BAR 7 OF DELMENU PROMPT ' Shop \<Type Data'
DEFINE BAR 8 OF DELMENU PROMPT '\-'
DEFINE BAR 9 OF DELMENU PROMPT ' S\<hops Data'
DEFINE BAR 10 OF DELMENU PROMPT '\-'
DEFINE BAR 11 OF DELMENU PROMPT ' \<Week Date'
DEFINE BAR 12 OF DELMENU PROMPT '\-'
DEFINE BAR 13 OF DELMENU PROMPT ' Hoil\<day'
DEFINE BAR 14 OF DELMENU PROMPT '\-'
DEFINE BAR 15 OF DELMENU PROMPT ' Sunday Wor\<k'
DEFINE BAR 16 OF DELMENU PROMPT '\-'
DEFINE BAR 17 OF DELMENU PROMPT ' \<Exit'
ON SELECTION POPUP DELMENU DO delMenu
ACTIVATE POPUP MAINMENU

RETURN
**********************

***********************
PROCEDURE MMCHOICE
************************


DO CASE
   CASE BAR()=3
      MSRNO = 1
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP SALMENU
      ENDIF
   CASE BAR()=5
      MSRNO = 2
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP REPMENU
      ENDIF
   CASE BAR()=7
      MSRNO = 3
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP ROTMENU
      ENDIF
   CASE BAR()=9
      MSRNO = 4
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP DATMENU
      ENDIF
   CASE BAR()=11
      MSRNO = 5
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP MANMENU
      ENDIF
   CASE BAR()=13
      MSRNO = 6
      DO PASS
      IF MPERMIT='OK'
         ACTIVATE POPUP SECMENU
      ENDIF
   CASE BAR()=15
      ON KEY LABEL Escape 
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      CLOSE ALL
      CLEAR
      CANCEL
      CLEAR ALL
ENDCASE
RETURN
*********************************

************************
PROCEDURE SALMENU
************************
DO CASE
   CASE BAR()=3
      ACTIVATE POPUP SENTMENU
   CASE BAR()=5
      ACTIVATE POPUP SCORMENU
   CASE BAR()=7
      ACTIVATE POPUP SDELMENU
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Check
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RDT
   CASE BAR()=13
      DEACTIVATE POPUP SALMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN
****************************

*****************************
PROCEDURE REPMENU
*****************************
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RWSALE
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RWS
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RSMAN
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RSD
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RSWEEK
   CASE BAR()=13
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO RBSTAND
   CASE BAR()=15
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Unacti
   CASE BAR()=17
      DEACTIVATE POPUP REPMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN
***********************

**************************
PROCEDURE DBFREP
****************************
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Route
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Salesm
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Categ
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Shop
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Week
   CASE BAR()=13
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Holida
   CASE BAR()=15
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Attend
   CASE BAR()=17
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO R-Sund
   CASE BAR()=19
      DEACTIVATE POPUP DBFREP
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN
**********************

*************************
PROCEDURE DATMENU
**************************
DO CASE
   CASE BAR()=3
      ACTIVATE POPUP ENTMENU
   CASE BAR()=5
      ACTIVATE POPUP CORMENU
   CASE BAR()=7
      ACTIVATE POPUP DELMENU
   CASE BAR()=9
      ACTIVATE POPUP DBFREP
   CASE BAR()=11
      DEACTIVATE POPUP DATMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE ROTMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO SROUT
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Srout
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      MCA = 'C'
      DO R-SRout
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      MCA = 'A'
      DO R-SRout
   CASE BAR()=11
      DEACTIVATE POPUP ROTMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE MANMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO REINDEX
   CASE BAR()=5
      DEACTIVATE POPUP MANMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE SECMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Pass
   CASE BAR()=5
      DEACTIVATE POPUP SECMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE SENTMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO SALE
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO ATTEND
   CASE BAR()=7
      DEACTIVATE POPUP SENTMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE SCORMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Sale
   CASE BAR()=5
      DEACTIVATE POPUP SCORMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE SDELMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Sale
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Attend
   CASE BAR()=7
      DEACTIVATE POPUP SDELMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE ENTMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO ROUTE
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO SALESMEN
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO CATEG
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO SHOP
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO WEEK
   CASE BAR()=13
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO HOLIDAY
   CASE BAR()=15
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO SUNDAY
   CASE BAR()=17
      DEACTIVATE POPUP ENTMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE CORMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Route
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Salesm
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Categ
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Shop
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Week
   CASE BAR()=13
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO C-Holida
   CASE BAR()=15
      DEACTIVATE POPUP CORMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE DELMENU
DO CASE
   CASE BAR()=3
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Route
   CASE BAR()=5
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Salesm
   CASE BAR()=7
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Categ
   CASE BAR()=9
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Shop
   CASE BAR()=11
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Week
   CASE BAR()=13
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Holida
   CASE BAR()=15
      ON KEY LABEL Rightarrow 
      ON KEY LABEL Leftarrow 
      DO D-Sund
   CASE BAR()=17
      DEACTIVATE POPUP DELMENU
   OTHERWISE
ENDCASE
ON KEY LABEL Rightarrow ?? CHR(7)
ON KEY LABEL Leftarrow ?? CHR(7)
RETURN

PROCEDURE BACKGRND
PRIVATE M.CURRAREA, M.TALKSTAT, M.COMPSTAT
IF SET('TALK')='ON'
   SET TALK OFF
   M.TALKSTAT = 'ON'
ELSE
   M.TALKSTAT = 'OFF'
ENDIF
M.COMPSTAT = SET('COMPATIBLE')
SET COMPATIBLE TO FOXPLUS
@ 0, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 1, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 2, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 3, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 4, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 5, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 6, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 7, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 8, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 9, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 10, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 11, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 12, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 13, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 14, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 15, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 16, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 17, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 18, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 19, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 20, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 21, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 22, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 23, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 24, 0 SAY '' SIZE 1, 80, 0 COLOR G/N 
@ 0, 33 SAY ' SALE PROGRAMME ' SIZE 1, 16, 0 COLOR SCHEME 1
@ 1, 35 SAY ' MULTI USER ' SIZE 1, 12, 0 COLOR SCHEME 1
@ 22, 22 SAY ' Designed & Developed by Muhammad Usman ' SIZE 1, 40, 0 COLOR SCHEME 1
IF M.TALKSTAT='ON'
   SET TALK ON
ENDIF
IF M.COMPSTAT='ON'
   SET COMPATIBLE TO DB4
ENDIF
RETURN

PROCEDURE OPENDBFS
SELECT 1
USE SHARED Routes ALIAS ROUT
SELECT 2
USE SHARED Salesmen ALIAS SALEM
SELECT 3
USE SHARED Week ALIAS WEEK
SELECT 4
USE SHARED Categ ALIAS CATE
SELECT 5
USE SHARED Shop ALIAS SHOP
SELECT 6
USE SHARED Sale ALIAS SALE
SELECT 7
USE SHARED Pass ALIAS PASS
SELECT 8
USE SHARED Attend ALIAS ATTE
SELECT 9
USE SHARED Holiday ALIAS HOLI
SELECT 10
USE SHARED Licen ALIAS LICE

PROCEDURE UPDATEPRO
SELECT LICE
SET ORDER TO Ok
GOTO TOP
IF OK='Y'
   SELECT PASS
   GOTO TOP
   DO WHILE  .NOT. EOF()
      REPLACE PASS WITH '²²²²²²'
      IF EOF()
         EXIT
      ENDIF
      SKIP
   ENDDO
   DEFINE WINDOW LICE FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+10, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/W 
   ACTIVATE WINDOW SAME LICE
   @ 1, 22 SAY 'NOTE'
   @ 3, 14 SAY 'Your licence is expired'
   @ 4, 8 SAY 'Please contact authorised person in'
   @ 5, 7 SAY 'M/s. Asia Snakcs (Pvt) Ltd for renewal'
   @ 7, 21 SAY 'Regards'
   WAIT WINDOW 'Press Any Key To Exit'
   RELEASE WINDOW LICE
   CLOSE ALL
   CLEAR
   QUIT
   RETURN
ENDIF
* 
* 
* ATTEND.FXP 
* ---------- 
*
MA_DATE = CTOD('  /  /    ')
MR_CODE = SPACE(3)
DEFINE WINDOW ATTEND FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'DAILY UN-ATTENDED ROUTES ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME ATTEND
DO WHILE .T.
   DO DSPHEDPRO
   MR_CODE = SPACE(3)
   SELECT ATTE
   SET ORDER TO AR
   @ 8, 25 CLEAR TO 11, 67
   @ 12, 18 SAY 'Press F1 to see Route Name List'
   ON KEY LABEL F1 DO ShwRotPro
   @ 4, 25 GET MA_DATE PICTURE ('99/99/9999')
   READ
   IF MA_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   @ 8, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 8, 25 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      MR_CODE = SPACE(3)
      LOOP
   ENDIF
   @ 10, 25 SAY ROUT.ROUTE
   SELECT ATTE
   SET ORDER TO AR
   SEEK DTOC(MA_DATE)+MR_CODE
   IF FOUND()
      WAIT WINDOW 'Route Un-Attended Already Exist'
      LOOP
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW ATTEND
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Date'
@ 8, 1 SAY 'Enter Route Code'

PROCEDURE SAVDATPRO
SELECT ATTE
APPEND BLANK
REPLACE A_DATE WITH MA_DATE
REPLACE R_CODE WITH MR_CODE
FLUSH

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-CATEG.FXP 
* ----------- 
*
MC_CODE = SPACE(2)
MC_CATE = SPACE(20)
DEFINE WINDOW CCATEG FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'CATEGORY CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CCATEG
DO WHILE .T.
   DO DSPHEDPRO
   MC_CODE = SPACE(2)
   MC_CATE = SPACE(20)
   SELECT CATE
   SET ORDER TO C_Code
   @ 12, 18 SAY 'Press F1 to see Shop Type List'
   ON KEY LABEL F1 DO ShwCatPro
   @ 4, 25 GET MC_CODE PICTURE '@2K 99' VALID MC_CODE<>SPACE(2) ERROR 'Category Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MC_CODE)))
   MC_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MC_CODE))
   IF MC_CODE='00'
      EXIT
   ENDIF
   @ 4, 25 SAY MC_CODE PICTURE '99'
   SEEK MC_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Category Code Not Exist'
      LOOP
   ELSE
      MC_CATE = C_CATE
      @ 8, 25 GET MC_CATE PICTURE '@!X20' VALID MC_CATE<>SPACE(20) ERROR 'Category Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CCATEG
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Category Code'
@ 8, 1 SAY 'Enter Category'

PROCEDURE SAVDATPRO
SELECT CATE
REPLACE C_CODE WITH MC_CODE
REPLACE C_CATE WITH MC_CATE
FLUSH

PROCEDURE SHWCATPRO
PUSH KEY
@ 12, 18 CLEAR TO 12, 53
DEFINE WINDOW SHWCAT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWCAT
SELECT CATE
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS C_CODE : 4 :H = ' ', C_CATE :H = 'Shop Type List' NOAPPEND NOEDIT NODELETE IN SHWCAT
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MC_CODE = C_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-CHECK.FXP 
* ----------- 
*
SELECT ROUT
SET ORDER TO R_Code
SELECT SALE
SET ORDER TO R_Code
SET RELATION TO R_CODE INTO ROUT ADDITIVE
MR_CODE = SPACE(3)
MS_DATE = CTOD('  /  /    ')
MCOUNT = 0
MBASKIT = 0
MBAG = 0
MECOUNT = 0
MEBASKIT = 0
MEBAG = 0
MDCOUNT = 0
MDBASKIT = 0
MDBAG = 0
DEFINE WINDOW CHECK FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'CROSS CHECK PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME CHECK
DO WHILE .T.
   DO DSPHEDPRO
   MS_DATE = CTOD('  /  /    ')
   MCOUNT = 0
   MBASKIT = 0
   MBAG = 0
   MECOUNT = 0
   MEBASKIT = 0
   MEBAG = 0
   MDCOUNT = 0
   MDBASKIT = 0
   MDBAG = 0
   @ 2, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   IF MR_CODE='0'
      EXIT
   ENDIF
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 2, 25 SAY MR_CODE
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      MR_CODE = SPACE(3)
      LOOP
   ENDIF
   @ 2, 25 SAY MR_CODE PICTURE '999'
   @ 2, 30 SAY ROUT.ROUTE
   @ 2, 56 GET MS_DATE PICTURE ('99/99/9999') VALID MS_DATE<>CTOD('  /  /    ') ERROR 'Date Can Not Be Blank'
   READ
   COUNT FOR R_CODE=MR_CODE .AND. S_DATE=MS_DATE TO MCOUNT
   SUM FOR R_CODE=MR_CODE .AND. S_DATE=MS_DATE BASKIT TO MBASKIT
   SUM FOR R_CODE=MR_CODE .AND. S_DATE=MS_DATE BAG TO MBAG
   @ 6, 25 GET MECOUNT PICTURE '9999'
   @ 8, 25 GET MEBASKIT PICTURE '9999'
   @ 10, 25 GET MEBAG PICTURE '9999'
   READ
   @ 6, 35 SAY MCOUNT PICTURE '9999'
   @ 8, 35 SAY MBASKIT PICTURE '9999'
   @ 10, 35 SAY MBAG PICTURE '9999'
   MDCOUNT = MECOUNT-MCOUNT
   MDBASKIT = MEBASKIT-MBASKIT
   MDBAG = MEBAG-MBAG
   @ 6, 45 SAY MDCOUNT PICTURE '9999'
   @ 8, 45 SAY MDBASKIT PICTURE '9999'
   @ 10, 45 SAY MDBAG PICTURE '9999'
ENDDO
RELEASE WINDOW CHECK
SET RELATION TO
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Route Code'
@ 2, 50 SAY 'Date'
@ 4, 25 SAY 'Manual'
@ 4, 35 SAY 'Enterd'
@ 4, 45 SAY 'Balance'
@ 6, 1 SAY 'Number of Visit'
@ 8, 1 SAY 'Number of Baskits'
@ 10, 1 SAY 'Sold Bags'
* 
* 
* C-HOLIDA.FXP 
* ------------ 
*
MH_DATE = CTOD('  /  /    ')
MH_DESC = SPACE(20)
DEFINE WINDOW CHOLIDAY FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'HOLIDAY CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CHOLIDAY
DO WHILE .T.
   DO DSPHEDPRO
   MH_DATE = CTOD('  /  /    ')
   @ 8, 25 CLEAR TO 8, 67
   SELECT HOLI
   SET ORDER TO H_Date
   @ 4, 25 GET MH_DATE PICTURE ('99/99/9999')
   READ
   IF MH_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   SEEK DTOC(MH_DATE)
   IF  .NOT. FOUND()
      WAIT WINDOW 'Holiday Date Not Exist'
      LOOP
   ENDIF
   MH_DESC = H_DESC
   @ 8, 25 GET MH_DESC PICTURE '@!X20' VALID MH_DESC<>SPACE(20) ERROR 'Holiday Description Can Not Be Blank'
   READ
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CHOLIDAY
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Holiday Date'
@ 8, 1 SAY 'Enter Description'

PROCEDURE SAVDATPRO
SELECT HOLI
REPLACE H_DATE WITH MH_DATE
REPLACE H_DESC WITH MH_DESC
FLUSH
* 
* 
* C-PASS.FXP 
* ---------- 
*
STORE SPACE(6) TO MPASS1, MPASS2, MPASS3, MPASS4, MPASS5, MPASS6
STORE 0 TO MSR_NO1, MSR_NO2, MSR_NO3, MSR_NO4, MSR_NO5, MSR_NO6
DEFINE WINDOW CPASS FROM INT((SROWS()-15)/2), INT((SCOLS()-40)/2) TO INT((SROWS()-15)/2)+15, INT((SCOLS()-40)/2)+40 NOFLOAT NOCLOSE SHADOW TITLE 'CHANGE PASSWORD PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CPASS
@ 2, 6 SAY 'Password'
SELECT PASS
SET ORDER TO Sr_No
GOTO TOP
MSR_NO1 = SR_NO
MPASS1 = PASS
SKIP
MSR_NO2 = SR_NO
MPASS2 = PASS
SKIP
MSR_NO3 = SR_NO
MPASS3 = PASS
SKIP
MSR_NO4 = SR_NO
MPASS4 = PASS
SKIP
MSR_NO5 = SR_NO
MPASS5 = PASS
SKIP
MSR_NO6 = SR_NO
MPASS6 = PASS
NCODE1 = SUBSTR(MPASS1,1,1)
NCODE2 = SUBSTR(MPASS1,2,1)
NCODE3 = SUBSTR(MPASS1,3,1)
NCODE4 = SUBSTR(MPASS1,4,1)
NCODE5 = SUBSTR(MPASS1,5,1)
NCODE6 = SUBSTR(MPASS1,6,1)
Mpass1 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
NCODE1 = SUBSTR(MPASS2,1,1)
NCODE2 = SUBSTR(MPASS2,2,1)
NCODE3 = SUBSTR(MPASS2,3,1)
NCODE4 = SUBSTR(MPASS2,4,1)
NCODE5 = SUBSTR(MPASS2,5,1)
NCODE6 = SUBSTR(MPASS2,6,1)
Mpass2 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
NCODE1 = SUBSTR(MPASS3,1,1)
NCODE2 = SUBSTR(MPASS3,2,1)
NCODE3 = SUBSTR(MPASS3,3,1)
NCODE4 = SUBSTR(MPASS3,4,1)
NCODE5 = SUBSTR(MPASS3,5,1)
NCODE6 = SUBSTR(MPASS3,6,1)
Mpass3 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
NCODE1 = SUBSTR(MPASS4,1,1)
NCODE2 = SUBSTR(MPASS4,2,1)
NCODE3 = SUBSTR(MPASS4,3,1)
NCODE4 = SUBSTR(MPASS4,4,1)
NCODE5 = SUBSTR(MPASS4,5,1)
NCODE6 = SUBSTR(MPASS4,6,1)
Mpass4 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
NCODE1 = SUBSTR(MPASS5,1,1)
NCODE2 = SUBSTR(MPASS5,2,1)
NCODE3 = SUBSTR(MPASS5,3,1)
NCODE4 = SUBSTR(MPASS5,4,1)
NCODE5 = SUBSTR(MPASS5,5,1)
NCODE6 = SUBSTR(MPASS5,6,1)
Mpass5 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
NCODE1 = SUBSTR(MPASS6,1,1)
NCODE2 = SUBSTR(MPASS6,2,1)
NCODE3 = SUBSTR(MPASS6,3,1)
NCODE4 = SUBSTR(MPASS6,4,1)
NCODE5 = SUBSTR(MPASS6,5,1)
NCODE6 = SUBSTR(MPASS6,6,1)
Mpass6 = chr(asc("&ncode1")-26)+chr(asc("&ncode2")-30)+chr(asc("&ncode3")-29)+chr(asc("&ncode4")-21)+chr(asc("&ncode5")-19)+chr(asc("&ncode6")-13)
@ 2, 20 SAY MSR_NO1 PICTURE '9'
@ 2, 30 GET MPASS1 PICTURE '@!X6'
@ 4, 20 SAY MSR_NO2 PICTURE '9'
@ 4, 30 GET MPASS2 PICTURE '@!X6'
@ 6, 20 SAY MSR_NO3 PICTURE '9'
@ 6, 30 GET MPASS3 PICTURE '@!X6'
@ 8, 20 SAY MSR_NO4 PICTURE '9'
@ 8, 30 GET MPASS4 PICTURE '@!X6'
@ 10, 20 SAY MSR_NO5 PICTURE '9'
@ 10, 30 GET MPASS5 PICTURE '@!X6'
@ 12, 20 SAY MSR_NO6 PICTURE '9'
@ 12, 30 GET MPASS6 PICTURE '@!X6'
READ
NCODE1 = SUBSTR(MPASS1,1,1)
NCODE2 = SUBSTR(MPASS1,2,1)
NCODE3 = SUBSTR(MPASS1,3,1)
NCODE4 = SUBSTR(MPASS1,4,1)
NCODE5 = SUBSTR(MPASS1,5,1)
NCODE6 = SUBSTR(MPASS1,6,1)
Mpass1 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
NCODE1 = SUBSTR(MPASS2,1,1)
NCODE2 = SUBSTR(MPASS2,2,1)
NCODE3 = SUBSTR(MPASS2,3,1)
NCODE4 = SUBSTR(MPASS2,4,1)
NCODE5 = SUBSTR(MPASS2,5,1)
NCODE6 = SUBSTR(MPASS2,6,1)
Mpass2 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
NCODE1 = SUBSTR(MPASS3,1,1)
NCODE2 = SUBSTR(MPASS3,2,1)
NCODE3 = SUBSTR(MPASS3,3,1)
NCODE4 = SUBSTR(MPASS3,4,1)
NCODE5 = SUBSTR(MPASS3,5,1)
NCODE6 = SUBSTR(MPASS3,6,1)
Mpass3 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
NCODE1 = SUBSTR(MPASS4,1,1)
NCODE2 = SUBSTR(MPASS4,2,1)
NCODE3 = SUBSTR(MPASS4,3,1)
NCODE4 = SUBSTR(MPASS4,4,1)
NCODE5 = SUBSTR(MPASS4,5,1)
NCODE6 = SUBSTR(MPASS4,6,1)
Mpass4 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
NCODE1 = SUBSTR(MPASS5,1,1)
NCODE2 = SUBSTR(MPASS5,2,1)
NCODE3 = SUBSTR(MPASS5,3,1)
NCODE4 = SUBSTR(MPASS5,4,1)
NCODE5 = SUBSTR(MPASS5,5,1)
NCODE6 = SUBSTR(MPASS5,6,1)
Mpass5 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
NCODE1 = SUBSTR(MPASS6,1,1)
NCODE2 = SUBSTR(MPASS6,2,1)
NCODE3 = SUBSTR(MPASS6,3,1)
NCODE4 = SUBSTR(MPASS6,4,1)
NCODE5 = SUBSTR(MPASS6,5,1)
NCODE6 = SUBSTR(MPASS6,6,1)
Mpass6 = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
GOTO TOP
REPLACE PASS WITH MPASS1
SKIP
REPLACE PASS WITH MPASS2
SKIP
REPLACE PASS WITH MPASS3
SKIP
REPLACE PASS WITH MPASS4
SKIP
REPLACE PASS WITH MPASS5
SKIP
REPLACE PASS WITH MPASS6
RELEASE WINDOW CPASS
RETURN
* 
* 
* C-ROUTE.FXP 
* ----------- 
*
MR_CODE = SPACE(3)
MROUTE = SPACE(20)
MRDESC = SPACE(60)
MT_SURV = 0
MT_VISIT = 0
MSA_CODE = SPACE(3)
MDAY = SPACE(15)
DEFINE WINDOW CROUTE FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'ROUTE CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CROUTE
DO WHILE .T.
   DO DSPHEDPRO
   MR_CODE = SPACE(3)
   MROUTE = SPACE(20)
   MRDESC = SPACE(60)
   MT_SURV = 0
   MT_VISIT = 0
   MSA_CODE = SPACE(3)
   MDAY = SPACE(15)
   SELECT ROUT
   SET ORDER TO R_Code
   @ 13, 18 SAY 'Press F1 to see Route Name List'
   ON KEY LABEL F1 DO ShwRotPro
   @ 2, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MR_CODE PICTURE '999'
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ELSE
      MROUTE = ROUTE
      MRDESC = RDESC
      MT_SURV = T_SURV
      MT_VISIT = T_VISIT
      MSA_CODE = SA_CODE
      MDAY = DAY
      @ 4, 25 GET MROUTE PICTURE '@!X20' VALID MROUTE<>SPACE(20) ERROR 'Route Name Can Not Be Blank'
      @ 6, 25 GET MRDESC PICTURE '@!X60' VALID MRDESC<>SPACE(60) ERROR 'Route Description Can Not Be Blank'
      @ 9, 25 GET MT_SURV PICTURE '9999' VALID MT_SURV<>0 ERROR 'Total Surveyed Can Not Be 0'
      READ
      DO WHILE .T.
         @ 13, 1 CLEAR TO 13, 67
         @ 13, 16 SAY 'Press F2 to see Salesmen Name List'
         ON KEY LABEL F2 DO ShwSalPro
         @ 9, 50 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank'
         READ
         MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
         MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
         @ 9, 50 SAY MSA_CODE PICTURE '999'
         SELECT SALEM
         SET ORDER TO Sa_Code
         SEEK MSA_CODE
         IF FOUND()
            EXIT
         ELSE
            WAIT WINDOW 'Salesmen Code Not Exist'
            MSA_CODE = SPACE(3)
            LOOP
         ENDIF
      ENDDO
      @ 10, 50 SAY SA_NAME
      @ 13, 1 CLEAR TO 13, 67
      @ 11, 25 GET MT_VISIT PICTURE '9999' VALID MT_VISIT<>0 ERROR 'Total Visitable Can Not Be 0'
      @ 11, 50 GET MDAY PICTURE '@!X15' VALID MDAY<>SPACE(15) ERROR 'Day Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CROUTE
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Route Code'
@ 4, 1 SAY 'Route Name'
@ 6, 1 SAY 'Route Description'
@ 9, 1 SAY 'Total Surveyed'
@ 9, 35 SAY 'Salesmen Code'
@ 11, 1 SAY 'Total Visitable'
@ 11, 35 SAY 'Day'

PROCEDURE SAVDATPRO
SELECT ROUT
REPLACE R_CODE WITH MR_CODE
REPLACE ROUTE WITH MROUTE
REPLACE RDESC WITH MRDESC
REPLACE T_SURV WITH MT_SURV
REPLACE T_VISIT WITH MT_VISIT
REPLACE SA_CODE WITH MSA_CODE
REPLACE DAY WITH MDAY
FLUSH

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSAL FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcSalPro
BROWSE FIELDS SA_CODE : 4 :H = ' ', SA_NAME :H = 'Salesmen List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSALPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-SALE.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Shop ALIAS SHOP
SELECT 2
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 3
USE SHARED Sale ALIAS SALE
SET RELATION TO R_CODE INTO ROUT
SELECT 4
USE SHARED Salesmen ALIAS SALEM
MS_DATE = CTOD('  /  /    ')
MSA_CODE = SPACE(3)
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MSALE = SPACE(1)
MBAG = 0
MBASKIT = 0
MR_CODE = SPACE(3)
DEFINE WINDOW CSALE FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SALE CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME CSALE
DO WHILE .T.
   DO DSPHEDPRO
   MS_DATE = CTOD('  /  /    ')
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSA_CODE = SPACE(3)
   MSALE = SPACE(1)
   MBAG = 0
   MBASKIT = 0
   MR_CODE = SPACE(3)
   SELECT SALE
   SET ORDER TO DRSH
   @ 3, 25 CLEAR TO 16, 69
   @ 17, 20 CLEAR TO 17, 69
   @ 2, 25 GET MS_DATE PICTURE ('99/99/9999')
   READ
   IF MS_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   DO WHILE .T.
      @ 6, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 To Exit'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
      MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
      IF MSUR_CODE='000'
         EXIT
      ENDIF
      @ 6, 25 SAY MSUR_CODE+'-'
      @ 17, 20 CLEAR TO 17, 69
      @ 17, 21 SAY 'Press F2 to see Shopes List'
      ON KEY LABEL F2 DO ShwShoPro
      @ 6, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank - Enter 0 To Exit'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
      MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
      IF MSH_CODE='00'
         EXIT
      ENDIF
      SELECT SHOP
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Shop Code Not Exist'
         MSUR_CODE = SPACE(3)
         MSH_CODE = SPACE(2)
         LOOP
      ELSE
         @ 6, 29 SAY MSH_CODE PICTURE '99'
         @ 7, 25 SAY SH_NAME
         EXIT
      ENDIF
   ENDDO
   IF MSUR_CODE='000' .OR. MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SALE
   SET ORDER TO DRSH
   SEEK DTOC(MS_DATE)+MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'This Entry Not Exist'
      LOOP
   ENDIF
   @ 9, 25 SAY SALE.R_CODE+'  '+ROUT.ROUTE
   MSA_CODE = SA_CODE
   MBAG = BAG
   MBASKIT = BASKIT
   MSALE = SALE
   DO WHILE .T.
      @ 17, 21 SAY 'Press F1 to see Salesmen List'
      ON KEY LABEL F1 DO ShwSalPro
      @ 4, 25 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
      MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
      SELECT SALEM
      SET ORDER TO Sa_Code
      SEEK MSA_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Salesmen Code Not Exist'
         MSA_CODE = SPACE(3)
         LOOP
      ELSE
         @ 4, 25 SAY MSA_CODE PICTURE '999'
         @ 4, 30 SAY SA_NAME
         EXIT
      ENDIF
   ENDDO
   @ 11, 25 GET MSALE PICTURE 'YN' VALID MSALE<>SPACE(1) ERROR 'Sale Can Not Be Blank - Yes No'
   READ
   IF MSALE='Y'
      @ 13, 25 GET MBAG PICTURE '@3K 999'
      READ
   ELSE
      MBAG = 0
   ENDIF
   @ 15, 25 GET MBASKIT PICTURE '@2K 99'
   READ
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CSALE
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Enter Sale Date'
@ 4, 1 SAY 'Enter Salemen Code'
@ 6, 1 SAY 'Enter Shop Code'
@ 9, 1 SAY 'Route Code/Name'
@ 11, 1 SAY 'Sale Y/N'
@ 13, 1 SAY 'Bags'
@ 15, 1 SAY 'Basket'

PROCEDURE SAVDATPRO
SELECT SALE
REPLACE SA_CODE WITH MSA_CODE
REPLACE SA_NAME WITH SALEM.SA_NAME
REPLACE SALE WITH MSALE
REPLACE BAG WITH MBAG
REPLACE BASKIT WITH MBASKIT
FLUSH

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSAL FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcSalPro
BROWSE FIELDS SA_CODE : 4 :H = ' ', SA_NAME :H = 'Salesmen List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSALPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F3 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-SALESM.FXP 
* ------------ 
*
MSA_CODE = SPACE(3)
MSA_NAME = SPACE(15)
DEFINE WINDOW CSALESMEN FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SALESMEN CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CSALESMEN
DO WHILE .T.
   DO DSPHEDPRO
   MSA_CODE = SPACE(3)
   MSA_NAME = SPACE(15)
   SELECT SALEM
   SET ORDER TO Sa_code
   @ 12, 18 SAY 'Press F1 to see Salesmens Name List'
   ON KEY LABEL F1 DO ShwSalPro
   @ 4, 25 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
   MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
   IF MSA_CODE='000'
      EXIT
   ENDIF
   @ 4, 25 SAY MSA_CODE PICTURE '999'
   SEEK MSA_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Salesmen Code Not Exist'
      LOOP
   ELSE
      MSA_NAME = SA_NAME
      @ 8, 25 GET MSA_NAME PICTURE '@!X15' VALID MSA_NAME<>SPACE(15) ERROR 'Salesmen Name Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CSALESMEN
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Salesmen Code'
@ 8, 1 SAY 'Enter Salesmen Name'

PROCEDURE SAVDATPRO
SELECT SALEM
REPLACE SA_CODE WITH MSA_CODE
REPLACE SA_NAME WITH MSA_NAME
FLUSH

PROCEDURE SHWSALPRO
PUSH KEY
@ 12, 18 CLEAR TO 12, 53
DEFINE WINDOW SHWSAL FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS SA_CODE : 5 :H = ' ', SA_NAME :H = 'Salesmen Name List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-SHOP.FXP 
* ---------- 
*
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MSH_NAME = SPACE(30)
MSH_ADD = SPACE(50)
MSH_CONTAC = SPACE(10)
MSH_PHONE = SPACE(15)
MC_CODE = SPACE(2)
MS_CATEG = SPACE(2)
MRETAIL = SPACE(1)
DEFINE WINDOW CSHOP FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SHOP CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CSHOP
DO WHILE .T.
   DO DSPHEDPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSH_NAME = SPACE(30)
   MSH_ADD = SPACE(50)
   MSH_CONTAC = SPACE(10)
   MSH_PHONE = SPACE(15)
   MC_CODE = SPACE(2)
   MS_CATEG = SPACE(2)
   MRETAIL = SPACE(1)
   @ 2, 25 CLEAR TO 16, 69
   @ 17, 15 CLEAR TO 17, 69
   DO DSPHEDPRO
   @ 2, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
   MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
   IF MSUR_CODE='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MSUR_CODE+'-'
   @ 17, 15 CLEAR TO 17, 69
   @ 17, 21 SAY 'Press F2 to see Shop List'
   ON KEY LABEL F2 DO ShwShoPro
   @ 2, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
   MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
   @ 2, 29 SAY MSH_CODE PICTURE '99'
   IF MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SHOP
   SET ORDER TO SS_Code
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Shop Code Not Exist'
      LOOP
   ENDIF
   @ 17, 15 CLEAR TO 17, 69
   MSH_NAME = SH_NAME
   MSH_ADD = SH_ADD
   MSH_CONTAC = SH_CONTACT
   MSH_PHONE = SH_PHONE
   MS_CATEG = S_CATEG
   MRETAIL = RETAIL
   @ 4, 25 GET MSH_NAME PICTURE '@!X30' VALID MSH_NAME<>SPACE(30) ERROR 'Shop Name Can Not Be Blank'
   @ 6, 25 GET MSH_ADD PICTURE '@!X50' VALID MSH_ADD<>SPACE(50) ERROR 'Shop Address Can Not Be Blank'
   @ 9, 25 GET MSH_CONTAC PICTURE '@!X10'
   @ 11, 25 GET MSH_PHONE PICTURE '@!X15'
   @ 13, 25 GET MS_CATEG PICTURE '@!X2' VALID MS_CATEG='A ' .OR. MS_CATEG='B ' .OR. MS_CATEG='C ' .OR. MS_CATEG='C1' .OR. MS_CATEG='D ' ERROR 'Shop Category Only A,B,C,C1,D'
   @ 13, 60 GET MRETAIL PICTURE '@!X1' VALID MRETAIL='Y' .OR. MRETAIL='N' ERROR 'Retail Y/N'
   READ
   DO WHILE .T.
      @ 17, 18 SAY 'Press F3 to see Shop Type List'
      ON KEY LABEL F3 DO ShwCatPro
      MC_CODE = C_CODE
      @ 15, 25 GET MC_CODE PICTURE '@2K 99' VALID MC_CODE<>SPACE(2) ERROR 'Shop Type Code Can Not Be Blank'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MC_CODE)))
      MC_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MC_CODE))
      SELECT CATE
      SET ORDER TO C_Code
      SEEK MC_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Category Code Not Exist'
         MC_CODE = SPACE(2)
         LOOP
      ELSE
         @ 15, 25 SAY MC_CODE PICTURE '99'
         @ 15, 30 SAY C_CATE
         EXIT
      ENDIF
   ENDDO
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CSHOP
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Shop Code'
@ 4, 1 SAY 'Shop Name'
@ 6, 1 SAY 'Shop Address'
@ 9, 1 SAY 'Contact Person'
@ 11, 1 SAY 'Phone Number'
@ 13, 1 SAY 'Category'
@ 13, 35 SAY 'Retail Y/N'
@ 15, 1 SAY 'Shop Type Code'

PROCEDURE SAVDATPRO
SELECT SHOP
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE SH_NAME WITH MSH_NAME
REPLACE SH_ADD WITH MSH_ADD
REPLACE SH_CONTACT WITH MSH_CONTAC
REPLACE SH_PHONE WITH MSH_PHONE
REPLACE S_CATEG WITH MS_CATEG
REPLACE C_CODE WITH MC_CODE
REPLACE RETAIL WITH MRETAIL
FLUSH

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWCATPRO
PUSH KEY
DEFINE WINDOW SHWCAT FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWCAT
SELECT CATE
ON KEY LABEL F3 
ON KEY LABEL ENTER DO SlcCatPro
BROWSE FIELDS C_CODE : 4 :H = ' ', C_CATE :H = 'Shop Type List' NOAPPEND NOEDIT NODELETE IN SHWCAT
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCCATPRO
MC_CODE = C_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-WEEK.FXP 
* ---------- 
*
MSR_NO = SPACE(3)
MWS_DATE = CTOD('  /  /    ')
MWE_DATE = CTOD('  /  /    ')
DEFINE WINDOW CWEEK FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'WEEK CORRECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 5
ACTIVATE WINDOW SAME CWEEK
SET CENTURY ON
DO WHILE .T.
   DO DSPHEDPRO
   MSR_NO = SPACE(3)
   MWS_DATE = CTOD('  /  /    ')
   MWE_DATE = CTOD('  /  /    ')
   SELECT WEEK
   SET ORDER TO SR_No
   @ 2, 25 CLEAR TO 13, 67
   @ 12, 18 SAY 'Press F1 to see Week List'
   ON KEY LABEL F1 DO ShwWekPro
   @ 4, 25 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Serial Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   IF MSR_NO='000'
      EXIT
   ENDIF
   @ 4, 25 SAY MSR_NO PICTURE '999'
   SEEK MSR_NO
   IF  .NOT. FOUND()
      WAIT WINDOW 'Serail Number Not Exist'
      LOOP
   ELSE
      MWS_DATE = WS_DATE
      MWE_DATE = WE_DATE
   ENDIF
   @ 7, 25 GET MWS_DATE PICTURE ('99/99/9999') VALID MWS_DATE<>CTOD('  /  /    ') ERROR 'Starting Date Can Not Be Blank'
   @ 10, 25 GET MWE_DATE PICTURE ('99/99/9999') VALID MWE_DATE<>CTOD('  /  /    ') ERROR 'Ending Date Can Not Be Blank'
   READ
   DO SAVDATPRO
   CLEAR GETS
ENDDO
RELEASE WINDOW CWEEK
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Serial Number'
@ 7, 1 SAY 'Enter Starting Date'
@ 10, 1 SAY 'Enter Ending Date'

PROCEDURE SAVDATPRO
SELECT WEEK
REPLACE SR_NO WITH MSR_NO
REPLACE WS_DATE WITH MWS_DATE
REPLACE WE_DATE WITH MWE_DATE
FLUSH

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
MSR_NO = SR_NO
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* CATEG.FXP 
* --------- 
*
MC_CODE = SPACE(2)
MC_CATE = SPACE(20)
DEFINE WINDOW CATEG FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'CATEGORY ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME CATEG
DO WHILE .T.
   DO DSPHEDPRO
   MC_CODE = SPACE(2)
   MC_CATE = SPACE(20)
   SELECT CATE
   SET ORDER TO C_Code
   @ 12, 18 SAY 'Press F5 to see Shop Type List'
   ON KEY LABEL F5 DO ShwCatPro
   @ 4, 25 GET MC_CODE PICTURE '@2K 99' VALID MC_CODE<>SPACE(2) ERROR 'Category Code Can Not Be Blank - Enter 0 to Exit'
   READ
   IF MC_CODE='0'
      EXIT
   ENDIF
   MCODLEN = LEN(LTRIM(RTRIM(MC_CODE)))
   MC_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MC_CODE))
   @ 4, 25 SAY MC_CODE PICTURE '99'
   SEEK MC_CODE
   IF FOUND()
      WAIT WINDOW 'Category Code Already Exist'
      LOOP
   ELSE
      @ 8, 25 GET MC_CATE PICTURE '@!X20' VALID MC_CATE<>SPACE(20) ERROR 'Category Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW CATEG
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Category Code'
@ 8, 1 SAY 'Enter Category'

PROCEDURE SAVDATPRO
SELECT CATE
APPEND BLANK
REPLACE C_CODE WITH MC_CODE
REPLACE C_CATE WITH MC_CATE
FLUSH

PROCEDURE SHWCATPRO
PUSH KEY
DEFINE WINDOW SHWCAT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWCAT
SELECT CATE
ON KEY LABEL F5 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS C_CODE : 4 :H = ' ', C_CATE :H = 'Shop Type List' NOAPPEND NOEDIT NODELETE IN SHWCAT
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
CLEAR GETS
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-ATTEND.FXP 
* ------------ 
*
SELECT ROUT
SET ORDER TO R_Code
SELECT ATTE
SET RELATION TO R_CODE INTO ROUT ADDITIVE
MA_DATE = CTOD('  /  /    ')
MR_CODE = SPACE(3)
MYN = SPACE(1)
DEFINE WINDOW DATTEND FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'DAILY UN-ATTENDED ROUTES DELETION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DATTEND
DO WHILE .T.
   DO DSPHEDPRO
   MA_DATE = CTOD('  /  /    ')
   MR_CODE = SPACE(3)
   MYN = SPACE(1)
   SELECT ATTE
   SET ORDER TO AR
   @ 8, 25 CLEAR TO 11, 67
   @ 12, 1 CLEAR TO 12, 67
   @ 12, 18 SAY 'Press F1 to see Route Name List'
   ON KEY LABEL F1 DO ShwRotPro
   @ 4, 25 GET MA_DATE PICTURE ('99/99/9999')
   READ
   IF MA_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   @ 8, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 8, 25 SAY MR_CODE PICTURE '999'
   SEEK DTOC(MA_DATE)+MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Date + Route Un-Attended Not Exist'
      LOOP
   ENDIF
   @ 10, 25 SAY ROUT.ROUTE
   @ 12, 1 CLEAR TO 12, 67
   @ 12, 18 SAY 'Do You Want To Delete This Entry  ' GET MYN PICTURE 'YN' VALID MYN<>'YN' ERROR 'Yes / No Only'
   READ
   IF MYN='Y'
      DELETE
   ENDIF
ENDDO
RELEASE WINDOW DATTEND
SET RELATION TO
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Date'
@ 8, 1 SAY 'Enter Route Code'

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ATTE
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS A_DATE :H = 'Date', R_CODE :H = 'Route Code' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MA_DATE = A_DATE
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-CATEG.FXP 
* ----------- 
*
MC_CODE = SPACE(2)
MC_CATE = SPACE(20)
MYN = SPACE(1)
DEFINE WINDOW DCATEG FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'CATEGORY DELETION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DCATEG
DO WHILE .T.
   @ 2, 1 CLEAR TO 12, 69
   DO DSPHEDPRO
   MC_CODE = SPACE(2)
   MYN = SPACE(1)
   SELECT CATE
   SET ORDER TO C_Code
   @ 12, 18 SAY 'Press F1 to see Shop Type List'
   ON KEY LABEL F1 DO ShwCatPro
   @ 4, 25 GET MC_CODE PICTURE '@2K 99' VALID MC_CODE<>SPACE(2) ERROR 'Category Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MC_CODE)))
   MC_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MC_CODE))
   IF MC_CODE='00'
      EXIT
   ENDIF
   @ 4, 25 SAY MC_CODE PICTURE '99'
   SEEK MC_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Category Code Not Exist'
      LOOP
   ELSE
      @ 8, 25 SAY C_CATE
   ENDIF
   @ 12, 1 CLEAR TO 12, 69
   @ 12, 17 SAY 'Do You Want Delete This Entry'
   @ 12, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SHOP
      SET ORDER TO C_Code
      SEEK MC_CODE
      IF FOUND()
         WAIT WINDOW 'Category Code Exist In The File Of Shop'
         LOOP
      ENDIF
      SELECT CATE
      DELETE ALL FOR MC_CODE=C_CODE
   ENDIF
ENDDO
RELEASE WINDOW DCATEG
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Category Code'
@ 8, 1 SAY 'Enter Category'

PROCEDURE SHWCATPRO
PUSH KEY
@ 12, 18 CLEAR TO 12, 53
DEFINE WINDOW SHWCAT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWCAT
SELECT CATE
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS C_CODE : 4 :H = ' ', C_CATE :H = 'Shop Type List' NOAPPEND NOEDIT NODELETE IN SHWCAT
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MC_CODE = C_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-HOLIDA.FXP 
* ------------ 
*
MH_DATE = CTOD('  /  /    ')
MH_DESC = SPACE(20)
MYN = SPACE(1)
DEFINE WINDOW DHOLIDAY FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'HOLIDAY DELECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DHOLIDAY
DO WHILE .T.
   DO DSPHEDPRO
   MH_DATE = CTOD('  /  /    ')
   @ 8, 25 CLEAR TO 10, 67
   @ 12, 1 CLEAR TO 12, 67
   SELECT HOLI
   SET ORDER TO H_Date
   @ 4, 25 GET MH_DATE PICTURE ('99/99/9999')
   READ
   IF MH_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   SEEK DTOC(MH_DATE)
   IF  .NOT. FOUND()
      WAIT WINDOW 'Holiday Date Not Exist'
      LOOP
   ENDIF
   @ 8, 25 SAY H_DESC PICTURE '@!X20'
   @ 12, 18 SAY 'Do You Want To Delete This Entry  ' GET MYN PICTURE 'YN' VALID MYN<>'YN' ERROR 'Yes / No Only'
   READ
   IF MYN='Y'
      DELETE
   ENDIF
ENDDO
RELEASE WINDOW DHOLIDAY
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Holiday Date'
@ 8, 1 SAY 'Enter Description'
* 
* 
* D-ROUTE.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
SELECT 2
USE SHARED Routes ALIAS ROUT
SELECT 3
USE SHARED SRout ALIAS SROUT
MR_CODE = SPACE(3)
MROUTE = SPACE(20)
MRDESC = SPACE(60)
MYN = SPACE(1)
MMSHOP = SPACE(5)
MMSALE = SPACE(5)
DEFINE WINDOW DROUTE FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'ROUTE DELETION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DROUTE
DO WHILE .T.
   @ 2, 1 CLEAR TO 12, 69
   DO DSPHEDPRO
   MR_CODE = SPACE(3)
   MYN = SPACE(1)
   SELECT ROUT
   SET ORDER TO R_Code
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 18 SAY 'Press F1 to see Route Name List'
   ON KEY LABEL F1 DO ShwRotPro
   @ 2, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MR_CODE PICTURE '999'
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ELSE
      @ 4, 25 SAY ROUTE
      @ 6, 25 SAY LEFT(RDESC,30)
      @ 7, 25 SAY RIGHT(RDESC,30)
      @ 9, 25 SAY T_SURV
      @ 9, 50 SAY SA_CODE
      @ 11, 25 SAY T_VISIT
      @ 11, 50 SAY DAY
   ENDIF
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 17 SAY 'Do You Want Delete This Entry' COLOR W/N 
   @ 13, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SROUT
      SET ORDER TO R_Code
      SEEK MR_CODE
      IF FOUND()
         MMSHOP = 'Shop'
      ENDIF
      SELECT SALE
      SET ORDER TO R_Code
      SEEK MR_CODE
      IF FOUND()
         MMSALE = 'Sale'
      ENDIF
      IF MMSHOP<>SPACE(5) .OR. MMSALE<>SPACE(5)
         WAIT WINDOW 'Route Code Exist In The File Of '+MMSHOP+' & '+MMSALE
         LOOP
      ENDIF
      SELECT ROUT
      DELETE ALL FOR MR_CODE=R_CODE
   ENDIF
ENDDO
RELEASE WINDOW DROUTE
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Route Code'
@ 4, 1 SAY 'Route Name'
@ 6, 1 SAY 'Route Description'
@ 9, 1 SAY 'Total Surveyed'
@ 9, 35 SAY 'Salesmen Code'
@ 11, 1 SAY 'Total Visitable'
@ 11, 35 SAY 'Day'

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-SALE.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Shop ALIAS SHOP
SELECT 2
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 3
USE SHARED Sale ALIAS SALE
SET RELATION TO R_CODE INTO ROUT
MS_DATE = CTOD('  /  /    ')
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MYN = SPACE(1)
DEFINE WINDOW DSALE FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SALE DELECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME DSALE
DO WHILE .T.
   DO DSPHEDPRO
   MS_DATE = CTOD('  /  /    ')
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MYN = SPACE(1)
   SELECT SALE
   SET ORDER TO DRSH
   @ 3, 25 CLEAR TO 16, 69
   @ 17, 1 CLEAR TO 17, 69
   @ 2, 25 GET MS_DATE PICTURE ('99/99/9999')
   READ
   IF MS_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   DO WHILE .T.
      @ 6, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 To Exit'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
      MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
      IF MSUR_CODE='000'
         EXIT
      ENDIF
      @ 6, 25 SAY MSUR_CODE+'-'
      @ 17, 1 CLEAR TO 17, 69
      @ 17, 21 SAY 'Press F2 to see Shopes List'
      ON KEY LABEL F2 DO ShwShoPro
      @ 6, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank - Enter 0 To Exit'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
      MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
      IF MSH_CODE='00'
         EXIT
      ENDIF
      SELECT SHOP
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Shop Code Not Exist'
         MSUR_CODE = SPACE(3)
         MSH_CODE = SPACE(2)
         LOOP
      ELSE
         @ 6, 29 SAY MSH_CODE PICTURE '99'
         @ 7, 25 SAY SH_NAME
         EXIT
      ENDIF
   ENDDO
   IF MSUR_CODE='000' .OR. MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SALE
   SET ORDER TO DRSH
   SEEK DTOC(MS_DATE)+MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'This Entry Not Exist'
      LOOP
   ENDIF
   @ 4, 25 SAY SA_CODE
   @ 4, 30 SAY SA_NAME
   @ 9, 25 SAY SALE.R_CODE+'  '+ROUT.ROUTE
   @ 11, 25 SAY SALE
   @ 13, 25 SAY BAG
   @ 15, 25 SAY BASKIT
   @ 17, 1 CLEAR TO 17, 69
   @ 17, 17 SAY 'Do You Want Delete This Entry'
   @ 17, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SALE
      DELETE
   ENDIF
ENDDO
RELEASE WINDOW DSALE
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Enter Sale Date'
@ 4, 1 SAY 'Enter Salemen Code'
@ 6, 1 SAY 'Enter Shop Code'
@ 9, 1 SAY 'Route Code/Name'
@ 11, 1 SAY 'Sale Y/N'
@ 13, 1 SAY 'Bags'
@ 15, 1 SAY 'Basket'

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F3 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-SALESM.FXP 
* ------------ 
*
MSA_CODE = SPACE(3)
MSA_NAME = SPACE(15)
MYN = SPACE(1)
DEFINE WINDOW DSALESMEN FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SALESMEN DELECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DSALESMEN
DO WHILE .T.
   @ 2, 1 CLEAR TO 12, 69
   DO DSPHEDPRO
   MSA_CODE = SPACE(3)
   MYN = SPACE(1)
   SELECT SALEM
   SET ORDER TO Sa_code
   @ 12, 18 SAY 'Press F1 to see Salesmens Name List'
   ON KEY LABEL F1 DO ShwSalPro
   @ 4, 25 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
   MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
   IF MSA_CODE='000'
      EXIT
   ENDIF
   @ 4, 25 SAY MSA_CODE PICTURE '999'
   SEEK MSA_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Salesmen Code Not Exist'
      LOOP
   ELSE
      @ 8, 25 SAY SA_NAME
   ENDIF
   @ 12, 1 CLEAR TO 12, 69
   @ 12, 17 SAY 'Do You Want Delete This Entry'
   @ 12, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SALE
      SET ORDER TO Sa_Code
      SEEK MSA_CODE
      IF FOUND()
         WAIT WINDOW 'Salesmen Code Exist In The File Of Sale'
         LOOP
      ENDIF
      SELECT SALEM
      DELETE ALL FOR MSA_CODE=SA_CODE
   ENDIF
ENDDO
RELEASE WINDOW DSALESMEN
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Salesmen Code'
@ 8, 1 SAY 'Enter Salesmen Name'

PROCEDURE SHWSALPRO
PUSH KEY
@ 12, 18 CLEAR TO 12, 53
DEFINE WINDOW SHWSAL FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS SA_CODE : 5 :H = ' ', SA_NAME :H = 'Salesmen Name List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-SHOP.FXP 
* ---------- 
*
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MYN = SPACE(1)
DEFINE WINDOW DSHOP FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SHOP DELECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DSHOP
DO WHILE .T.
   @ 2, 15 CLEAR TO 17, 69
   DO DSPHEDPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MYN = SPACE(1)
   SELECT SHOP
   @ 2, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
   MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
   IF MSUR_CODE='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MSUR_CODE+'-'
   @ 17, 15 CLEAR TO 17, 69
   @ 17, 21 SAY 'Press F2 to see Shop List'
   ON KEY LABEL F2 DO ShwShoPro
   @ 2, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
   MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
   @ 2, 29 SAY MSH_CODE
   SELECT SHOP
   SET ORDER TO SS_Code
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Shop Code Not Exist'
      LOOP
   ENDIF
   @ 4, 25 SAY SH_NAME
   @ 6, 25 SAY SH_ADD
   @ 9, 25 SAY SH_CONTACT
   @ 11, 25 SAY SH_PHONE
   @ 13, 25 SAY S_CATEG
   @ 13, 60 SAY RETAIL
   @ 15, 25 SAY C_CODE
   @ 17, 1 CLEAR TO 17, 69
   @ 17, 17 SAY 'Do You Want Delete This Entry'
   @ 17, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SALE
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF FOUND()
         WAIT WINDOW 'Shop Code Exist In The File Of Sale'
         LOOP
      ENDIF
      SELECT SHOP
      DELETE ALL FOR SUR_CODE+SH_CODE=MSUR_CODE+MSH_CODE
   ENDIF
ENDDO
RELEASE WINDOW DSHOP
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Shop Code'
@ 4, 1 SAY 'Shop Name'
@ 6, 1 SAY 'Shop Address'
@ 9, 1 SAY 'Contact Person'
@ 11, 1 SAY 'Phone Number'
@ 13, 1 SAY 'Shop Category'
@ 13, 35 SAY 'Retail Y/N'
@ 15, 1 SAY 'Shop Type Code'

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-SROUT.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 2
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 3
USE SHARED SRout ALIAS SROUT
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SELECT 4
USE Sale ALIAS SALE
MSR_DATE = CTOD('  /  /    ')
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MR_CODE = SPACE(3)
MYN = SPACE(1)
DEFINE WINDOW DSROUT FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SHOP & ROUTE DELECTION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME DSROUT
DO WHILE .T.
   DO DSPHEDPRO
   MSR_DATE = CTOD('  /  /    ')
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MR_CODE = SPACE(3)
   MYN = SPACE(1)
   SELECT SROUT
   SET ORDER TO SSSR
   @ 13, 1 CLEAR TO 13, 69
   @ 3, 25 CLEAR TO 12, 69
   @ 2, 25 GET MSR_DATE PICTURE ('99/99/9999')
   READ
   IF MSR_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   @ 6, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
   MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
   IF MSUR_CODE='000'
      LOOP
   ENDIF
   @ 6, 25 SAY MSUR_CODE+'-'
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 21 SAY 'Press F1 to see Shop List'
   ON KEY LABEL F1 DO ShwShoPro
   @ 6, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
   MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
   @ 6, 29 SAY MSH_CODE PICTURE '99'
   IF MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SROUT
   SET ORDER TO SSS
   SEEK DTOC(MSR_DATE)+MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Date+Shop Code Not Exist'
      LOOP
   ENDIF
   @ 6, 35 SAY SHOP.SH_NAME
   MR_CODE = R_CODE
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 20 SAY 'Press F2 to see Route List'
   ON KEY LABEL F2 DO ShwRotPro
   @ 10, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 To Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 10, 25 SAY MR_CODE
   IF MR_CODE='000'
      LOOP
   ENDIF
   SELECT SROUT
   SET ORDER TO SSSR
   SEEK DTOC(MSR_DATE)+MSUR_CODE+MSH_CODE+MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'This Entry Not Exist'
      LOOP
   ENDIF
   @ 10, 30 SAY ROUT.ROUTE
   SELECT SALE
   SET ORDER TO SSR_Code
   SEEK MSUR_CODE+MSH_CODE+MR_CODE
   IF FOUND()
      SET FILTER TO SUR_CODE+SH_CODE+R_CODE=MSUR_CODE+MSH_CODE+MR_CODE
      SET ORDER TO S_Date
      GOTO BOTTOM
      IF S_DATE>=MSR_DATE
         WAIT WINDOW 'Route + Shop Code Exist In The File Of Sale'
         LOOP
      ENDIF
   ENDIF
   SELECT SROUT
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 17 SAY 'Do You Want Delete This Entry'
   @ 13, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      SELECT SROUT
      DELETE
   ENDIF
ENDDO
RELEASE WINDOW DSROUT
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Date'
@ 6, 1 SAY 'Shope Code'
@ 10, 1 SAY 'Route Code'

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
SET ORDER TO R_Code
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcRotPro
BROWSE FIELDS R_CODE : 4 :H = ' ', ROUTE :H = 'Route List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCROTPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-WEEK.FXP 
* ---------- 
*
MYN = SPACE(1)
MSR_NO = SPACE(3)
MWS_DATE = CTOD('  /  /    ')
MWE_DATE = CTOD('  /  /    ')
DEFINE WINDOW DWEEK FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'WEEK DELETION PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 7
ACTIVATE WINDOW SAME DWEEK
SET CENTURY ON
DO WHILE .T.
   DO DSPHEDPRO
   MYN = SPACE(1)
   MSR_NO = SPACE(3)
   MWS_DATE = CTOD('  /  /    ')
   MWE_DATE = CTOD('  /  /    ')
   SELECT WEEK
   SET ORDER TO SR_No
   @ 2, 25 CLEAR TO 13, 67
   @ 12, 18 SAY 'Press F1 to see Week List'
   ON KEY LABEL F1 DO ShwWekPro
   @ 4, 25 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Serial Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   IF MSR_NO='000'
      EXIT
   ENDIF
   @ 4, 25 SAY MSR_NO PICTURE '999'
   SEEK MSR_NO
   IF  .NOT. FOUND()
      WAIT WINDOW 'Serail Number Not Exist'
      LOOP
   ELSE
      MWS_DATE = WS_DATE
      MWE_DATE = WE_DATE
      @ 7, 25 SAY MWS_DATE PICTURE ('99/99/9999')
      @ 10, 25 SAY MWE_DATE PICTURE ('99/99/9999')
   ENDIF
   @ 12, 1 CLEAR TO 12, 69
   @ 12, 17 SAY 'Do You Want Delete This Entry'
   @ 12, 52 GET MYN PICTURE 'YN' VALID MYN<>SPACE(1) ERROR 'Can Not Be Blank - Yes No'
   READ
   IF MYN='Y'
      DELETE ALL FOR MSR_NO=SR_NO
   ENDIF
   CLEAR GETS
ENDDO
RELEASE WINDOW DWEEK
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Serial Number'
@ 7, 1 SAY 'Enter Starting Date'
@ 10, 1 SAY 'Enter Ending Date'

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
MSR_NO = SR_NO
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* HOLIDAY.FXP 
* ----------- 
*
MH_DATE = CTOD('  /  /    ')
MH_DESC = SPACE(20)
DEFINE WINDOW HOLIDAY FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'HOLIDAY ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME HOLIDAY
DO WHILE .T.
   DO DSPHEDPRO
   MH_DATE = CTOD('  /  /    ')
   MH_DESC = SPACE(20)
   @ 8, 25 CLEAR TO 8, 67
   SELECT HOLI
   SET ORDER TO H_Date
   @ 4, 25 GET MH_DATE PICTURE ('99/99/9999')
   READ
   IF MH_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   SEEK DTOC(MH_DATE)
   IF FOUND()
      WAIT WINDOW 'Holiday Date Already Exist'
      LOOP
   ENDIF
   @ 8, 25 GET MH_DESC PICTURE '@!X20' VALID MH_DESC<>SPACE(20) ERROR 'Holiday Description Can Not Be Blank'
   READ
   DO SAVDATPRO
ENDDO
RELEASE WINDOW HOLIDAY
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Holiday Date'
@ 8, 1 SAY 'Enter Description'

PROCEDURE SAVDATPRO
SELECT HOLI
APPEND BLANK
REPLACE H_DATE WITH MH_DATE
REPLACE H_DESC WITH MH_DESC
FLUSH
* 
* 
* PASS.FXP 
* -------- 
*
PUBLIC MPERMIT, MPASS
MPASS = SPACE(6)
MPERMIT = SPACE(2)
DEFINE WINDOW PASS FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/BG 
ACTIVATE WINDOW SAME PASS
@ 2, 8 SAY 'Enter Your Password :'
SET COLOR TO W/N, N
@ 2, 30 GET MPASS FUNCTION '!'
READ
NCODE1 = SUBSTR(MPASS,1,1)
NCODE2 = SUBSTR(MPASS,2,1)
NCODE3 = SUBSTR(MPASS,3,1)
NCODE4 = SUBSTR(MPASS,4,1)
NCODE5 = SUBSTR(MPASS,5,1)
NCODE6 = SUBSTR(MPASS,6,1)
Mpass = chr(asc("&ncode1")+26)+chr(asc("&ncode2")+30)+chr(asc("&ncode3")+29)+chr(asc("&ncode4")+21)+chr(asc("&ncode5")+19)+chr(asc("&ncode6")+13)
SELECT PASS
SET ORDER TO Sr_No
SEEK MSRNO
IF MPASS=PASS
   MPERMIT = 'OK'
ELSE
   WAIT WINDOW 'Your Password Is Not Correct'
ENDIF
RELEASE WINDOW PASS
RETURN
* 
* 
* R-ATTEND.FXP 
* ------------ 
*
CLOSE DATABASES
SELECT 1
USE SHARED Attend ALIAS ATTE
SET ORDER TO AR
GOTO TOP
SELECT 2
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RATTEND FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RATTEND
SELECT ATTE
SET RELATION TO R_CODE INTO ROUT ADDITIVE
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT attend.Frx TO PRINTER
ELSE
   REPORT FORMAT attend.Frx PREVIEW
ENDIF
RELEASE WINDOW RATTEND
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-CATEG.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Categ ALIAS CATE
SET ORDER TO C_Code
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RCATEG FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RCATEG
SELECT CATE
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT categ.Frx TO PRINTER
ELSE
   REPORT FORMAT categ.Frx PREVIEW
ENDIF
RELEASE WINDOW RCATEG
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-HOLIDA.FXP 
* ------------ 
*
CLOSE DATABASES
SELECT 1
USE SHARED Holiday ALIAS HOLI
SET ORDER TO H_Date
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RHOLIDA FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RHOLIDA
SELECT HOLI
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT Holiday.Frx TO PRINTER
ELSE
   REPORT FORMAT Holiday.Frx PREVIEW
ENDIF
RELEASE WINDOW RHOLIDA
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-ROUTE.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
GOTO TOP
SELECT 2
USE SHARED Routes ALIAS ROUT
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET ORDER TO R_Code
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RROUTE FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RROUTE
SELECT ROUT
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT Route.Frx TO PRINTER
ELSE
   REPORT FORMAT Route.Frx PREVIEW
ENDIF
RELEASE WINDOW RROUTE
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-SALESM.FXP 
* ------------ 
*
CLOSE DATABASES
SELECT 1
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RSALESM FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSALESM
SELECT SALEM
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT Salesmen.Frx TO PRINTER
ELSE
   REPORT FORMAT Salesmen.Frx PREVIEW
ENDIF
RELEASE WINDOW RSALESM
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-SHOP.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
GOTO TOP
SELECT 2
USE SHARED Categ ALIAS CATE
SET ORDER TO C_Code
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RSHOP FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSHOP
SELECT SHOP
SET RELATION TO C_CODE INTO CATE ADDITIVE
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT shop.Frx TO PRINTER
ELSE
   REPORT FORMAT shop.Frx PREVIEW
ENDIF
RELEASE WINDOW RSHOP
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* R-SROUT.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
GOTO TOP
SELECT 2
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
GOTO TOP
SELECT 3
USE SHARED SRout ALIAS SROUT
SET ORDER TO SSSD DESCENDING
TMP = SYS(3)
COPY TO (TMP+'.Dbf')
SELECT 4
USE EXCLUSIVE (TMP)
SELECT 6
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
MPS = SPACE(1)
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MCOUNT = 0
MR_CODE = SPACE(3)
DEFINE WINDOW RSROUT FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSROUT
SELECT ROUT
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
CLEAR
IF MCA='C'
   DO REPCRNPRO
ELSE
   DO REPALLPRO
ENDIF
RELEASE WINDOW RSROUT
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE REPCRNPRO
CLEAR
DO WHILE .T.
   @ 4, 10 SAY 'Press F1 to see Route List' COLOR W/N 
   ON KEY LABEL F1 DO ShwRotPro
   @ 2, 10 SAY 'Enter Route Code'
   @ 2, 30 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      RELEASE WINDOW RSD
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 2, 30 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF FOUND()
      EXIT
   ELSE
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ENDIF
ENDDO
SELECT 4
SET FILTER TO R_CODE=MR_CODE
INDEX ON SUR_CODE+SH_CODE TAG SSU_CODE UNIQUE
SET ORDER TO SSU_Code
CLEAR
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
DO PRNSCRPRO

PROCEDURE PRNSCRPRO
SELECT 4
GOTO TOP
MR_CODE = R_CODE
SET FILTER TO R_CODE=MR_CODE
MSRNO = 0
GOTO TOP
DO WHILE  .NOT. EOF()
   MSRNO = MSRNO+1
   REPLACE SRNO WITH MSRNO
   SKIP
ENDDO
GOTO TOP
IF MPS='P'
   REPORT FORMAT CSRout.Frx TO PRINTER
ELSE
   REPORT FORMAT CSRout.Frx PREVIEW
ENDIF

PROCEDURE REPALLPRO
SELECT 4
INDEX ON SUR_CODE+SH_CODE+DTOC(SR_DATE) TAG SSS
SET ORDER TO SSS
GOTO TOP
MSUR_CODE = SUR_CODE
MSH_CODE = SH_CODE
DO WHILE  .NOT. EOF()
   MCOUNT = 0
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE+SH_CODE=MSUR_CODE+MSH_CODE
      MCOUNT = MCOUNT+1
      SKIP
   ENDDO
   IF MCOUNT>1
      SKIP -1
      REPLACE SIGN WITH 'û'
      SKIP
   ENDIF
   LOOP
ENDDO
CLEAR
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT SRout.Frx TO PRINTER
ELSE
   REPORT FORMAT SRout.Frx PREVIEW
ENDIF

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* R-WEEK.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Week ALIAS WEEK
SET ORDER TO SR_No
GOTO TOP
MPS = SPACE(1)
DEFINE WINDOW RWEEK FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RWEEK
SELECT WEEK
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT week.Frx TO PRINTER
ELSE
   REPORT FORMAT week.Frx PREVIEW
ENDIF
RELEASE WINDOW RWEEK
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* RDT.FXP 
* ------- 
*
MS_DATE = CTOD('  /  /    ')
MR_CODE = SPACE(3)
MPS = SPACE(1)
MTCOUNT = 0
MVCOUNT = 0
MBAG = 0
MBASKET = 0
DEFINE WINDOW RDT FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RDT
DO WHILE .T.
   MS_DATE = CTOD('  /  /    ')
   MR_CODE = SPACE(3)
   @ 1, 10 SAY 'Route Code'
   @ 3, 10 SAY 'Date'
   @ 1, 30 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      RELEASE WINDOW RDT
      CLOSE DATABASES
      DO OPENDBFS
      RETURN
      EXIT
   ENDIF
   @ 1, 30 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ENDIF
   @ 2, 30 SAY ROUTE
   @ 3, 30 GET MS_DATE PICTURE ('99/99/9999')
   READ
   IF MS_DATE=CTOD('  /  /    ')
      RELEASE WINDOW RDT
      CLOSE DATABASES
      DO OPENDBFS
      RETURN
      EXIT
   ENDIF
   SELECT SALE
   SET ORDER TO S_Date
   SEEK MS_DATE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Transation Date Not Exist'
      LOOP
   ELSE
      EXIT
   ENDIF
ENDDO
CLEAR
@ 1, 13 SAY 'Report in Processing'
@ 3, 13 SAY "Please Don't Distrub"
DO REPPRTPRO
RELEASE WINDOW RDT
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE REPPRTPRO
SELECT SHOP
SET ORDER TO SS_Code
SELECT SALE
SET FILTER TO R_CODE=MR_CODE .AND. S_DATE=MS_DATE
SET ORDER TO Sh_Code
GOTO TOP
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
COUNT TO MTCOUNT
COUNT FOR SALE='N' TO MVCOUNT
SUM BAG TO MBAG
SUM BASKIT TO MBASKET
CLEAR
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   REPORT FORMAT Rdt.Frx TO PRINTER
ELSE
   REPORT FORMAT Rdt.Frx PREVIEW
ENDIF
RETURN
* 
* 
* REINDEX.FXP 
* ----------- 
*
DEFINE WINDOW RINDEX FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW TITLE 'RE-INDEX PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR R/G 
CLOSE DATABASES
WAIT WINDOW 'Make Sure No Body Using This Program On Any Terminal'
WAIT WINDOW NOWAIT 'Re-Indexing in progress, Please Dont Distrub'
ACTIVATE WINDOW SAME RINDEX
SET EXCLUSIVE ON
SET DELETED OFF
DBF1 = ('Week.Dbf')
DBF2 = ('Shop.Dbf')
DBF3 = ('Attend.Dbf')
DBF4 = ('Sale.Dbf')
DBF5 = ('RWS.Dbf')
DBF6 = ('Routes.Dbf')
DBF7 = ('Salesmen.Dbf')
DBF8 = ('Sunday.Dbf')
DBF9 = ('Pass.Dbf')
DBF10 = ('Licen.Dbf')
DBF11 = ('Holiday.Dbf')
DBF12 = ('Day.Dbf')
DBF13 = ('Categ.Dbf')
DBF14 = ('SRout.Dbf')
@ 3, 4 SAY '²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²'
USE &DBF1
@1,10 SAY FULLPATH('&DBF1')
PACK
REINDEX
READ TIMEOUT 0.10
@ 3, 4 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF2
@1,10 SAY FULLPATH('&DBF2')
PACK
REINDEX
READ TIMEOUT 0.20
@ 3, 7 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF3
@1,10 SAY FULLPATH('&DBF3')
PACK
REINDEX
READ TIMEOUT 0.30
@ 3, 10 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF4
@1,10 SAY FULLPATH('&DBF4')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 13 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF5
@1,10 SAY FULLPATH('&DBF5')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 16 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF6
@1,10 SAY FULLPATH('&DBF6')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 19 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF7
@1,10 SAY FULLPATH('&DBF7')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 22 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF8
@1,10 SAY FULLPATH('&DBF8')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 25 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF9
@1,10 SAY FULLPATH('&DBF9')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 28 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF10
@1,10 SAY FULLPATH('&DBF10')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 31 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF11
@1,10 SAY FULLPATH('&DBF11')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 34 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF12
@1,10 SAY FULLPATH('&DBF12')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 37 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF13
@1,10 SAY FULLPATH('&DBF13')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 40 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
USE &DBF14
@1,10 SAY FULLPATH('&DBF14')
PACK
REINDEX
READ TIMEOUT 0.40
@ 3, 43 SAY 'ÛÛÛ'
@ 1, 1 CLEAR TO 1, 65
RELEASE WINDOW RINDEX
WAIT WINDOW 'Reindex Process Completed'
SET EXCLUSIVE OFF
SET DELETED ON
DO OPENDBFS
RETURN
* 
* 
* ROUTE.FXP 
* --------- 
*
MR_CODE = SPACE(3)
MROUTE = SPACE(20)
MRDESC = SPACE(60)
MT_SURV = 0
MT_VISIT = 0
MSA_CODE = SPACE(3)
MDAY = SPACE(15)
DEFINE WINDOW ROUTE FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'ROUTE ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME ROUTE
DO WHILE .T.
   DO DSPHEDPRO
   MR_CODE = SPACE(3)
   MROUTE = SPACE(20)
   MRDESC = SPACE(60)
   MT_SURV = 0
   MT_VISIT = 0
   MSA_CODE = SPACE(3)
   MDAY = SPACE(15)
   SELECT ROUT
   SET ORDER TO R_Code
   @ 13, 18 SAY 'Press F5 to see Route Name List'
   ON KEY LABEL F5 DO ShwRotPro
   @ 2, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   IF MR_CODE='0'
      EXIT
   ENDIF
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 2, 25 SAY MR_CODE PICTURE '999'
   SEEK MR_CODE
   IF FOUND()
      WAIT WINDOW 'Route Code Already Exist'
      LOOP
   ELSE
      @ 4, 25 GET MROUTE PICTURE '@!X20' VALID MROUTE<>SPACE(20) ERROR 'Route Name Can Not Be Blank'
      @ 6, 25 GET MRDESC PICTURE '@!X60' VALID MRDESC<>SPACE(60) ERROR 'Route Description Can Not Be Blank'
      @ 9, 25 GET MT_SURV PICTURE '9999' VALID MT_SURV<>0 ERROR 'Total Surveyed Can Not Be 0'
      READ
      DO WHILE .T.
         @ 13, 1 CLEAR TO 13, 67
         @ 13, 16 SAY 'Press F1 to see Salesmen Name List'
         ON KEY LABEL F1 DO ShwSalPro
         @ 9, 50 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank'
         READ
         MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
         MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
         @ 9, 50 SAY MSA_CODE PICTURE '999'
         SELECT SALEM
         SET ORDER TO Sa_Code
         SEEK MSA_CODE
         IF FOUND()
            EXIT
         ELSE
            WAIT WINDOW 'Salesmen Code Not Exist'
            MSA_CODE = SPACE(3)
            LOOP
         ENDIF
      ENDDO
      @ 10, 50 SAY SA_NAME
      @ 13, 1 CLEAR TO 13, 67
      @ 11, 25 GET MT_VISIT PICTURE '9999' VALID MT_VISIT<>0 ERROR 'Total Visitable Can Not Be 0'
      @ 11, 50 GET MDAY PICTURE '@!X15' VALID MDAY<>SPACE(15) ERROR 'Day Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW ROUTE
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Route Code'
@ 4, 1 SAY 'Route Name'
@ 6, 1 SAY 'Route Description'
@ 9, 1 SAY 'Total Surveyed'
@ 9, 35 SAY 'Salesmen Code'
@ 11, 1 SAY 'Total Visitable'
@ 11, 35 SAY 'Day'

PROCEDURE SAVDATPRO
SELECT ROUT
APPEND BLANK
REPLACE R_CODE WITH MR_CODE
REPLACE ROUTE WITH MROUTE
REPLACE RDESC WITH MRDESC
REPLACE T_SURV WITH MT_SURV
REPLACE T_VISIT WITH MT_VISIT
REPLACE SA_CODE WITH MSA_CODE
REPLACE DAY WITH MDAY
FLUSH

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F5 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSAL FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcSalPro
BROWSE FIELDS SA_CODE : 4 :H = ' ', SA_NAME :H = 'Salesmen List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSALPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN
* 
* 
* RSD.FXP 
* ------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
TMP2 = SYS(3)
COPY TO (TMP2+'.Dbf') STRUCTURE
SELECT 2
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
GOTO TOP
SELECT 3
USE SHARED Week ALIAS WEEK
SET ORDER TO Sr_No
SELECT 4
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 5
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf') STRUCTURE
SELECT 6
USE EXCLUSIVE (TMP)
SELECT 7
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 8
USE EXCLUSIVE (TMP1)
SELECT 9
STORE 0 TO MBAG, MSBAG
STORE 0 TO MSALE, MSSALE
STORE 0 TO MVISIT, MSVISIT
MSA_CODE = SPACE(3)
MR_CODE = SPACE(3)
MROUTE = SPACE(15)
MFWEEK = SPACE(3)
MFDATE = DATE()
MWS_DATE = DATE()
MTWEEK = SPACE(3)
MTDATE = DATE()
MWE_DATE = DATE()
MPS = SPACE(1)
MPAGE = 1
MLINE = 6
MCQ = SPACE(1)
MSR_NO = SPACE(3)
STORE 0 TO MWSSALE, MSWSSALE
STORE 0 TO MCSALE, MSCSALE
MRBAG = 0
DEFINE WINDOW RSD FROM INT((SROWS()-17)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-17)/1)+9, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSD
SET CENTURY OFF
DO WHILE .T.
   DO DSPHEDPRO
   @ 7, 12 SAY 'Press F1 to see Salesmen List' COLOR W/N 
   ON KEY LABEL F1 DO ShwSalPro
   @ 1, 30 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
   MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
   IF MSA_CODE='000'
      RELEASE WINDOW RSD
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 1, 30 SAY MSA_CODE PICTURE '999'
   SELECT SALEM
   SET ORDER TO Sa_Code
   SEEK MSA_CODE
   IF FOUND()
      @ 2, 30 SAY SA_NAME
   ELSE
      WAIT WINDOW 'Salesmen Code Not Exist'
      LOOP
   ENDIF
   @ 7, 0 CLEAR TO 7, 67
   @ 7, 12 SAY 'Press F2 to see Week List' COLOR W/N 
   ON KEY LABEL F2 DO ShwWekPro
   @ 3, 30 GET MFWEEK PICTURE '@3K 999' VALID MFWEEK<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MFWEEK)))
   MFWEEK = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MFWEEK))
   IF MFWEEK='000'
      RELEASE WINDOW RSMAN
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 3, 30 SAY MFWEEK PICTURE '999'
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MFWEEK
   IF  .NOT. FOUND()
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
   @ 4, 30 SAY DTOC(WS_DATE)+'  '+DTOC(WE_DATE)
   MFDATE = WS_DATE
   @ 5, 30 GET MTWEEK PICTURE '@3K 999' VALID MTWEEK<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MTWEEK)))
   MTWEEK = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MTWEEK))
   IF MTWEEK='000'
      RELEASE WINDOW RSMAN
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 5, 30 SAY MTWEEK PICTURE '999'
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MTWEEK
   IF FOUND()
      @ 6, 30 SAY DTOC(WS_DATE)+'  '+DTOC(WE_DATE)
      MTDATE = WE_DATE
      EXIT
   ELSE
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
ENDDO
CLEAR
@ 3, 13 SAY 'Report in Processing'
@ 5, 13 SAY "Please Don't Distrub"
SELECT 6
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
SELECT SALE
SET FILTER TO S_DATE>=MFDATE .AND. S_DATE<=MTDATE
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET ORDER TO S_Date
GOTO TOP
COPY TO (TMP2)
SELECT 9
USE EXCLUSIVE (TMP2)
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
INDEX ON SA_CODE TAG SA_CODE
INDEX ON R_CODE TAG R_CODE
GOTO TOP
REPLACE SA_CODE WITH '   ' ALL
SET ORDER TO R_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   REPLACE SA_CODE WITH ROUT.SA_CODE
   SKIP
ENDDO
DELETE ALL FOR SA_CODE<>MSA_CODE
GOTO TOP
SELECT WEEK
SET FILTER TO SR_NO>=MFWEEK .AND. SR_NO<=MTWEEK
GOTO TOP
MSR_NO = SR_NO
MWS_DATE = WS_DATE
MWE_DATE = WE_DATE
DO WHILE .T.
   SELECT 9
   SET FILTER TO S_DATE>=MWS_DATE .AND. S_DATE<=MWE_DATE
   SET ORDER TO R_Code
   GOTO TOP
   DO WHILE  .NOT. EOF()
      MBAG = 0
      MSALE = 0
      MVISIT = 0
      MWSSALE = 0
      MCSALE = 0
      MR_CODE = SPACE(3)
      MR_CODE = R_CODE
      DO WHILE R_CODE=MR_CODE
         MBAG = MBAG+BAG
         MVISIT = MVISIT+1
         IF SALE='Y'
            MSALE = MSALE+1
         ENDIF
         SELECT SHOP
         IF RETAIL='N'
            MRBAG = 0
            SELECT 9
            MRBAG = BAG
            MWSSALE = MWSSALE+MRBAG
         ENDIF
         SELECT SHOP
         IF S_CATEG='C'
            MRBAG = 0
            SELECT 9
            MRBAG = BAG
            MCSALE = MCSALE+MRBAG
         ENDIF
         SELECT 9
         SKIP
      ENDDO
      DO SAVDATPRO
      SELECT 9
      LOOP
   ENDDO
   SET FILTER TO
   SELECT WEEK
   SKIP
   IF EOF()
      EXIT
   ENDIF
   MSR_NO = SR_NO
   MWS_DATE = WS_DATE
   MWE_DATE = WE_DATE
   LOOP
ENDDO
CLEAR
@ 4, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 4, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RSD
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DELETE FILE TMP2+'.Dbf'
DELETE FILE TMP2+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 1, 10 SAY 'Salesmen:'
@ 3, 10 SAY 'Week No From:'
@ 5, 10 SAY 'Week No To:'

PROCEDURE SAVDATPRO
SELECT 6
APPEND BLANK
REPLACE SR_NO WITH MSR_NO
REPLACE SA_CODE WITH MSA_CODE
REPLACE R_CODE WITH MR_CODE
REPLACE BAG WITH MBAG
REPLACE SALE WITH MSALE
REPLACE VISIT WITH MVISIT
REPLACE WSSALE WITH MWSSALE
REPLACE CSALE WITH MCSALE
FLUSH

PROCEDURE REPPRTPRO
SET PRINTER ON
SET DEVICE TO PRINTER
MLINE = 6
SELECT 6
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
@ 2, 0 SAY 'Salesmen: '+SALEM.SA_NAME+' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
@ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
@ 6, 0 SAY REPLICATE('-',77)
GOTO TOP
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
DO WHILE  .NOT. EOF()
   MSR_NO = SPACE(3)
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSR_NO = SR_NO
   DO WHILE SR_NO=MSR_NO
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
   ENDDO
   SELECT 8
   APPEND BLANK
   REPLACE SR_NO WITH MSR_NO
   REPLACE BAG WITH MBAG
   REPLACE SALE WITH MSALE
   REPLACE VISIT WITH MVISIT
   REPLACE WSSALE WITH MWSSALE
   REPLACE CSALE WITH MCSALE
   FLUSH
   SELECT 6
   LOOP
ENDDO
SELECT 8
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
MBAG = 0
MSALE = 0
MVISIT = 0
MWSSALE = 0
MCSALE = 0
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'GRAND TOTAL                '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
CALCULATE MAX ( BAG ) TO MSBAG
CALCULATE MAX ( SALE ) TO MSSALE
CALCULATE MAX ( VISIT ) TO MSVISIT
CALCULATE MAX ( WSSALE ) TO MSWSSALE
CALCULATE MAX ( CSALE ) TO MSCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'MAXIMUM                    '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
SET ORDER TO Sr_No
GOTO TOP
DO WHILE  .NOT. EOF()
   MLINE = MLINE+1
   @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
   SKIP
   IF MLINE>59
      EJECT
      MPAGE = MPAGE+1
      MLINE = 7
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 0 SAY 'Salesmen: '+SALEM.SA_NAME+' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
      @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
      @ 6, 0 SAY REPLICATE('-',77)
   ENDIF
   LOOP
ENDDO
SELECT 6
GOTO TOP
INDEX ON R_CODE+SR_NO TAG SS
SET ORDER TO SS
DO WHILE  .NOT. EOF()
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSBAG = 0
   MSSALE = 0
   MSVISIT = 0
   MSWSSALE = 0
   MSCSALE = 0
   MR_CODE = SPACE(3)
   MR_CODE = R_CODE
   IF MLINE>53
      EJECT
      MPAGE = MPAGE+1
      MLINE = 7
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 0 SAY 'Salesmen: '+SALEM.SA_NAME+' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
      @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
      @ 6, 0 SAY REPLICATE('-',77)
   ENDIF
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+2
   @ MLINE, 0 SAY 'Route  Name'
   MROUTE = ROUT.ROUTE
   DO WHILE MR_CODE=R_CODE
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
      LOOP
   ENDDO
   @ MLINE, 21 SAY 'Total '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
   CALCULATE FOR R_CODE=MR_CODE MAX ( BAG ) TO MSBAG
   CALCULATE FOR R_CODE=MR_CODE MAX ( SALE ) TO MSSALE
   CALCULATE FOR R_CODE=MR_CODE MAX ( VISIT ) TO MSVISIT
   CALCULATE FOR R_CODE=MR_CODE MAX ( WSSALE ) TO MSWSSALE
   CALCULATE FOR R_CODE=MR_CODE MAX ( CSALE ) TO MSCSALE
   MLINE = MLINE+1
   @ MLINE, 0 SAY MR_CODE+'   '+MROUTE
   @ MLINE, 19 SAY 'Maximum '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MR_CODE=R_CODE
      @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
      SKIP
      MLINE = MLINE+1
      IF MLINE>53
         EJECT
         MPAGE = MPAGE+1
         MLINE = 7
         @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
         @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
         @ 2, 0 SAY 'Salesmen: '+SALEM.SA_NAME+' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
         @ 3, 0 SAY REPLICATE('-',77)
         @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
         @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
         @ 6, 0 SAY REPLICATE('-',77)
      ENDIF
      LOOP
   ENDDO
   DELETE ALL FOR MR_CODE=R_CODE
   GOTO TOP
   LOOP
ENDDO
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
MLINE = MLINE+1
@ MLINE, 65 SAY 'End Of Report'
EJECT
RETURN

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MLINE = 6
SELECT 6
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 0 SAY 'Salesmen: '+SALEM.SA_NAME+' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
@ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
@ 6, 0 SAY REPLICATE('-',77)
GOTO TOP
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
DO WHILE  .NOT. EOF()
   MSR_NO = SPACE(3)
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSR_NO = SR_NO
   DO WHILE SR_NO=MSR_NO
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
   ENDDO
   SELECT 8
   APPEND BLANK
   REPLACE SR_NO WITH MSR_NO
   REPLACE BAG WITH MBAG
   REPLACE SALE WITH MSALE
   REPLACE VISIT WITH MVISIT
   REPLACE WSSALE WITH MWSSALE
   REPLACE CSALE WITH MCSALE
   FLUSH
   SELECT 6
   LOOP
ENDDO
SELECT 8
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
MBAG = 0
MSALE = 0
MVISIT = 0
MWSSALE = 0
MCSALE = 0
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'GRAND TOTAL                '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
CALCULATE MAX ( BAG ) TO MSBAG
CALCULATE MAX ( SALE ) TO MSSALE
CALCULATE MAX ( VISIT ) TO MSVISIT
CALCULATE MAX ( WSSALE ) TO MSWSSALE
CALCULATE MAX ( CSALE ) TO MSCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'MAXIMUM                    '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
SET ORDER TO Sr_No
GOTO TOP
DO WHILE  .NOT. EOF()
   MLINE = MLINE+1
   @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
   SKIP
   IF MLINE>19
      MCQ = SPACE(1)
      @ 21, 28 SAY 'Continue Or Quit C/Q'
      @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
      READ
      IF MCQ='Q'
         RELEASE WINDOW SCR
         RETURN
      ENDIF
      @ 10, 0 CLEAR TO 21, 78
      MLINE = 10
   ENDIF
   LOOP
ENDDO
IF MLINE>8
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      RELEASE WINDOW SCR
      RETURN
   ENDIF
   @ 7, 0 CLEAR TO 21, 78
   MLINE = 7
ENDIF
SELECT 6
GOTO TOP
INDEX ON R_CODE+SR_NO TAG SS
SET ORDER TO SS
DO WHILE  .NOT. EOF()
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSBAG = 0
   MSSALE = 0
   MSVISIT = 0
   MSWSSALE = 0
   MSCSALE = 0
   MR_CODE = SPACE(3)
   MR_CODE = R_CODE
   @ MLINE, 0 SAY 'Route  Name'
   MROUTE = ROUT.ROUTE
   DO WHILE MR_CODE=R_CODE
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
      LOOP
   ENDDO
   @ MLINE, 21 SAY 'Total '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
   CALCULATE FOR R_CODE=MR_CODE MAX ( BAG ) TO MSBAG
   CALCULATE FOR R_CODE=MR_CODE MAX ( SALE ) TO MSSALE
   CALCULATE FOR R_CODE=MR_CODE MAX ( VISIT ) TO MSVISIT
   CALCULATE FOR R_CODE=MR_CODE MAX ( WSSALE ) TO MSWSSALE
   CALCULATE FOR R_CODE=MR_CODE MAX ( CSALE ) TO MSCSALE
   MLINE = MLINE+1
   @ MLINE, 0 SAY MR_CODE+'   '+MROUTE COLOR B/W 
   @ MLINE, 19 SAY 'Maximum '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MR_CODE=R_CODE
      @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
      SKIP
      MLINE = MLINE+1
      IF MLINE>19
         MCQ = SPACE(1)
         @ 21, 28 SAY 'Continue Or Quit C/Q'
         @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
         READ
         IF MCQ='Q'
            RELEASE WINDOW SCR
            RETURN
         ENDIF
         @ 10, 0 CLEAR TO 21, 78
         MLINE = 10
      ENDIF
      LOOP
   ENDDO
   IF MLINE>8
      MCQ = SPACE(1)
      @ 21, 28 SAY 'Continue Or Quit C/Q'
      @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
      READ
      IF MCQ='Q'
         RELEASE WINDOW SCR
         RETURN
      ENDIF
      @ 7, 0 CLEAR TO 21, 78
      MLINE = 7
   ENDIF
   DELETE ALL FOR MR_CODE=R_CODE
   GOTO TOP
   LOOP
ENDDO
RELEASE WINDOW SCR
RETURN

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSAL FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS SA_CODE : 5 :H = ' ', SA_NAME :H = 'Salesmen Name List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
SET ORDER TO Sr_No
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* RSMAN.FXP 
* --------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
TMP2 = SYS(3)
COPY TO (TMP2+'.Dbf') STRUCTURE
SELECT 2
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
GOTO TOP
SELECT 3
USE SHARED Week ALIAS WEEK
SET ORDER TO Sr_No
SELECT 4
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 5
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf') STRUCTURE
SELECT 6
USE EXCLUSIVE (TMP)
SELECT 7
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 8
USE EXCLUSIVE (TMP1)
SELECT 9
STORE 0 TO MBAG, MSBAG
STORE 0 TO MSALE, MSSALE
STORE 0 TO MVISIT, MSVISIT
MSA_CODE = SPACE(3)
MFWEEK = SPACE(3)
MFDATE = DATE()
MWS_DATE = DATE()
MTWEEK = SPACE(3)
MTDATE = DATE()
MWE_DATE = DATE()
MPS = SPACE(1)
MPAGE = 1
MLINE = 6
MCQ = SPACE(1)
MSR_NO = SPACE(3)
STORE 0 TO MWSSALE, MSWSSALE
STORE 0 TO MCSALE, MSCSALE
MRBAG = 0
DEFINE WINDOW RSMAN FROM INT((SROWS()-17)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-17)/1)+9, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSMAN
SET CENTURY OFF
DO WHILE .T.
   DO DSPHEDPRO
   @ 7, 12 SAY 'Press F2 to see Week List' COLOR W/N 
   ON KEY LABEL F2 DO ShwWekPro
   @ 1, 30 GET MFWEEK PICTURE '@3K 999' VALID MFWEEK<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MFWEEK)))
   MFWEEK = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MFWEEK))
   IF MFWEEK='000'
      RELEASE WINDOW RSMAN
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 1, 30 SAY MFWEEK PICTURE '999'
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MFWEEK
   IF  .NOT. FOUND()
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
   @ 2, 30 SAY DTOC(WS_DATE)+'  '+DTOC(WE_DATE)
   MFDATE = WS_DATE
   @ 4, 30 GET MTWEEK PICTURE '@3K 999' VALID MTWEEK<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MTWEEK)))
   MTWEEK = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MTWEEK))
   IF MTWEEK='000'
      RELEASE WINDOW RSMAN
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 4, 30 SAY MTWEEK PICTURE '999'
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MTWEEK
   IF FOUND()
      @ 5, 30 SAY DTOC(WS_DATE)+'  '+DTOC(WE_DATE)
      MTDATE = WE_DATE
      EXIT
   ELSE
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
ENDDO
CLEAR
@ 3, 13 SAY 'Report in Processing'
@ 5, 13 SAY "Please Don't Distrub"
SELECT 6
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
SELECT SALE
SET FILTER TO S_DATE>=MFDATE .AND. S_DATE<=MTDATE
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET ORDER TO S_Date
GOTO TOP
COPY TO (TMP2)
SELECT 9
USE EXCLUSIVE (TMP2)
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON SA_CODE TAG SA_CODE
INDEX ON R_CODE TAG R_CODE
GOTO TOP
REPLACE SA_CODE WITH '   ' ALL
SET ORDER TO R_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   REPLACE SA_CODE WITH ROUT.SA_CODE
   SKIP
ENDDO
GOTO TOP
SELECT WEEK
SET FILTER TO SR_NO>=MFWEEK .AND. SR_NO<=MTWEEK
GOTO TOP
MSR_NO = SR_NO
MWS_DATE = WS_DATE
MWE_DATE = WE_DATE
DO WHILE .T.
   SELECT 9
   SET FILTER TO S_DATE>=MWS_DATE .AND. S_DATE<=MWE_DATE
   SET ORDER TO Sa_Code
   GOTO TOP
   DO WHILE  .NOT. EOF()
      MBAG = 0
      MSALE = 0
      MVISIT = 0
      MWSSALE = 0
      MCSALE = 0
      MSA_CODE = SPACE(3)
      MSA_CODE = SA_CODE
      DO WHILE SA_CODE=MSA_CODE
         MBAG = MBAG+BAG
         MVISIT = MVISIT+1
         IF SALE='Y'
            MSALE = MSALE+1
         ENDIF
         SELECT SHOP
         IF RETAIL='N'
            MRBAG = 0
            SELECT 9
            MRBAG = BAG
            MWSSALE = MWSSALE+MRBAG
         ENDIF
         SELECT SHOP
         IF S_CATEG='C'
            MRBAG = 0
            SELECT 9
            MRBAG = BAG
            MCSALE = MCSALE+MRBAG
         ENDIF
         SELECT 9
         SKIP
      ENDDO
      DO SAVDATPRO
      SELECT 9
      LOOP
   ENDDO
   SET FILTER TO
   SELECT WEEK
   SKIP
   IF EOF()
      EXIT
   ENDIF
   MSR_NO = SR_NO
   MWS_DATE = WS_DATE
   MWE_DATE = WE_DATE
   LOOP
ENDDO
CLEAR
@ 4, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 4, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RSMAN
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DELETE FILE TMP2+'.Dbf'
DELETE FILE TMP2+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 1, 10 SAY 'Week No From:'
@ 4, 10 SAY 'Week No To:'

PROCEDURE SAVDATPRO
SELECT 6
APPEND BLANK
REPLACE SR_NO WITH MSR_NO
REPLACE SA_CODE WITH MSA_CODE
REPLACE BAG WITH MBAG
REPLACE SALE WITH MSALE
REPLACE VISIT WITH MVISIT
REPLACE WSSALE WITH MWSSALE
REPLACE CSALE WITH MCSALE
FLUSH

PROCEDURE REPPRTPRO
SET PRINTER ON
SET DEVICE TO PRINTER
MLINE = 6
SELECT 6
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
@ 2, 12 SAY ' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
@ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
@ 6, 0 SAY REPLICATE('-',77)
GOTO TOP
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
DO WHILE  .NOT. EOF()
   MSR_NO = SPACE(3)
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSR_NO = SR_NO
   DO WHILE SR_NO=MSR_NO
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
   ENDDO
   SELECT 8
   APPEND BLANK
   REPLACE SR_NO WITH MSR_NO
   REPLACE BAG WITH MBAG
   REPLACE SALE WITH MSALE
   REPLACE VISIT WITH MVISIT
   REPLACE WSSALE WITH MWSSALE
   REPLACE CSALE WITH MCSALE
   FLUSH
   SELECT 6
   LOOP
ENDDO
SELECT 8
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
MBAG = 0
MSALE = 0
MVISIT = 0
MWSSALE = 0
MCSALE = 0
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'GRAND TOTAL                '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
CALCULATE MAX ( BAG ) TO MSBAG
CALCULATE MAX ( SALE ) TO MSSALE
CALCULATE MAX ( VISIT ) TO MSVISIT
CALCULATE MAX ( WSSALE ) TO MSWSSALE
CALCULATE MAX ( CSALE ) TO MSCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'MAXIMUM                    '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
SET ORDER TO Sr_No
GOTO TOP
DO WHILE  .NOT. EOF()
   MLINE = MLINE+1
   @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
   SKIP
   IF MLINE>59
      EJECT
      MPAGE = MPAGE+1
      MLINE = 6
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 12 SAY ' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
      @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
      @ 6, 0 SAY REPLICATE('-',77)
   ENDIF
   LOOP
ENDDO
SELECT 6
GOTO TOP
INDEX ON SA_CODE+SR_NO TAG SS
SET ORDER TO SS
DO WHILE  .NOT. EOF()
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSBAG = 0
   MSSALE = 0
   MSVISIT = 0
   MSWSSALE = 0
   MSCSALE = 0
   MSA_CODE = SPACE(3)
   MSA_CODE = SA_CODE
   IF MLINE>53
      EJECT
      MPAGE = MPAGE+1
      MLINE = 6
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 12 SAY ' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
      @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
      @ 6, 0 SAY REPLICATE('-',77)
   ENDIF
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+2
   @ MLINE, 0 SAY 'Salesmen: '+LEFT(SALEM.SA_NAME,10)
   DO WHILE MSA_CODE=SA_CODE
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
      LOOP
   ENDDO
   @ MLINE, 21 SAY 'Total '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( BAG ) TO MSBAG
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( SALE ) TO MSSALE
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( VISIT ) TO MSVISIT
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( WSSALE ) TO MSWSSALE
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( CSALE ) TO MSCSALE
   MLINE = MLINE+1
   @ MLINE, 19 SAY 'Maximum '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MSA_CODE=SA_CODE
      @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
      SKIP
      MLINE = MLINE+1
      IF MLINE>53
         EJECT
         MPAGE = MPAGE+1
         MLINE = 6
         @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
         @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
         @ 2, 12 SAY ' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
         @ 3, 0 SAY REPLICATE('-',77)
         @ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
         @ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
         @ 6, 0 SAY REPLICATE('-',77)
      ENDIF
      LOOP
   ENDDO
   DELETE ALL FOR MSA_CODE=SA_CODE
   GOTO TOP
   LOOP
ENDDO
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
MLINE = MLINE+1
@ MLINE, 65 SAY 'End Of Report'
EJECT
RETURN

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MLINE = 6
SELECT 6
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 12 SAY ' Weeks: '+MFWEEK+' To: '+MTWEEK+' Date From: '+DTOC(MFDATE)+' To: '+DTOC(MTDATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY '         WEEK               BAGS  SP:SALE VP:VSTD  % SP   W/S   WS   (C)   (C)'
@ 5, 0 SAY '                            SOLD   POINTS  POINTS  OF VP  SALE   %   SALE   %'
@ 6, 0 SAY REPLICATE('-',77)
GOTO TOP
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
DO WHILE  .NOT. EOF()
   MSR_NO = SPACE(3)
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSR_NO = SR_NO
   DO WHILE SR_NO=MSR_NO
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
   ENDDO
   SELECT 8
   APPEND BLANK
   REPLACE SR_NO WITH MSR_NO
   REPLACE BAG WITH MBAG
   REPLACE SALE WITH MSALE
   REPLACE VISIT WITH MVISIT
   REPLACE WSSALE WITH MWSSALE
   REPLACE CSALE WITH MCSALE
   FLUSH
   SELECT 6
   LOOP
ENDDO
SELECT 8
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SET RELATION TO SR_NO INTO WEEK ADDITIVE
INDEX ON SR_NO TAG SR_NO
SET ORDER TO Sr_No
MBAG = 0
MSALE = 0
MVISIT = 0
MWSSALE = 0
MCSALE = 0
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'GRAND TOTAL                '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
CALCULATE MAX ( BAG ) TO MSBAG
CALCULATE MAX ( SALE ) TO MSSALE
CALCULATE MAX ( VISIT ) TO MSVISIT
CALCULATE MAX ( WSSALE ) TO MSWSSALE
CALCULATE MAX ( CSALE ) TO MSCSALE
MLINE = MLINE+1
@ MLINE, 0 SAY 'MAXIMUM                    '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
SET ORDER TO Sr_No
GOTO TOP
DO WHILE  .NOT. EOF()
   MLINE = MLINE+1
   @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
   SKIP
   IF MLINE>19
      MCQ = SPACE(1)
      @ 21, 28 SAY 'Continue Or Quit C/Q'
      @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
      READ
      IF MCQ='Q'
         RELEASE WINDOW SCR
         RETURN
      ENDIF
      @ 10, 0 CLEAR TO 21, 78
      MLINE = 9
   ENDIF
   LOOP
ENDDO
IF MLINE>8
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      RELEASE WINDOW SCR
      RETURN
   ENDIF
   @ 7, 0 CLEAR TO 21, 78
   MLINE = 7
ENDIF
SELECT 6
GOTO TOP
INDEX ON SA_CODE+SR_NO TAG SS
SET ORDER TO SS
DO WHILE  .NOT. EOF()
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   MSBAG = 0
   MSSALE = 0
   MSVISIT = 0
   MSWSSALE = 0
   MSCSALE = 0
   MSA_CODE = SPACE(3)
   MSA_CODE = SA_CODE
   @ MLINE, 0 SAY 'Salesmen: '+SALEM.SA_NAME COLOR B/W 
   DO WHILE MSA_CODE=SA_CODE
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      SKIP
      LOOP
   ENDDO
   @ MLINE, 21 SAY 'Total '+STR(MBAG,6)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,6)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,6)+' '+STR((MCSALE/MBAG*100),3)+'%'
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( BAG ) TO MSBAG
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( SALE ) TO MSSALE
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( VISIT ) TO MSVISIT
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( WSSALE ) TO MSWSSALE
   CALCULATE FOR SA_CODE=MSA_CODE MAX ( CSALE ) TO MSCSALE
   MLINE = MLINE+1
   @ MLINE, 19 SAY 'Maximum '+STR(MSBAG,6)+STR(MSSALE,8)+STR(MSVISIT,8)+STR((MSSALE/MSVISIT*100),6)+'%'+STR(MSWSSALE,6)+' '+STR((MSWSSALE/MSBAG*100),3)+'%'+STR(MSCSALE,6)+' '+STR((MSCSALE/MSBAG*100),3)+'%'
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MSA_CODE=SA_CODE
      @ MLINE, 0 SAY SR_NO+' '+DTOC(WEEK.WS_DATE)+' To '+DTOC(WEEK.WE_DATE)+'   '+STR(BAG,6)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,6)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,6)+' '+STR((CSALE/BAG*100),3)+'%'
      SKIP
      MLINE = MLINE+1
      IF MLINE>19
         MCQ = SPACE(1)
         @ 21, 28 SAY 'Continue Or Quit C/Q'
         @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
         READ
         IF MCQ='Q'
            RELEASE WINDOW SCR
            RETURN
         ENDIF
         @ 10, 0 CLEAR TO 21, 78
         MLINE = 10
      ENDIF
      LOOP
   ENDDO
   IF MLINE>8
      MCQ = SPACE(1)
      @ 21, 28 SAY 'Continue Or Quit C/Q'
      @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
      READ
      IF MCQ='Q'
         RELEASE WINDOW SCR
         RETURN
      ENDIF
      @ 7, 0 CLEAR TO 21, 78
      MLINE = 7
   ENDIF
   DELETE ALL FOR MSA_CODE=SA_CODE
   GOTO TOP
   LOOP
ENDDO
RELEASE WINDOW SCR
RETURN

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
SET ORDER TO Sr_No
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* RWS.FXP 
* ------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
SELECT 2
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
SELECT 3
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 4
USE SHARED Week ALIAS WEEK
SELECT 5
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
SELECT 6
USE EXCLUSIVE (TMP)
SELECT 7
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
MBAG = 0
MSALE = 0
MVISIT = 0
MR_CODE = SPACE(3)
MSA_CODE = SPACE(3)
MWEEK = SPACE(3)
MPS = SPACE(1)
MWS_DATE = CTOD('  /  /    ')
MWE_DATE = CTOD('  /  /    ')
MS_DATE = CTOD('  /  /    ')
MPAGE = 1
MLINE = 6
MDAY = SPACE(15)
MMONTH = SPACE(15)
MCQ = SPACE(1)
MWSSALE = 0
MCSALE = 0
DEFINE WINDOW RWS FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RWS
SET CENTURY OFF
DO WHILE .T.
   @ 4, 10 SAY 'Press F1 to see Week List' COLOR W/N 
   ON KEY LABEL F1 DO ShwWekPro
   @ 2, 10 SAY 'Enter Week No.'
   @ 2, 30 GET MWEEK PICTURE '@3K 999' VALID MWEEK<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MWEEK)))
   MWEEK = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MWEEK))
   IF MWEEK='000'
      RELEASE WINDOW RWS
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 2, 30 SAY MWEEK PICTURE '999'
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MWEEK
   IF FOUND()
      EXIT
   ELSE
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
ENDDO
MWS_DATE = WS_DATE
MWE_DATE = WE_DATE
CLEAR
@ 1, 13 SAY 'Report in Processing'
@ 3, 13 SAY "Please Don't Distrub"
SELECT 6
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SELECT SALE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET FILTER TO S_DATE>=MWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SR_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MS_DATE = S_DATE
   MSA_CODE = SA_CODE
   MR_CODE = R_CODE
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   DO WHILE SA_CODE=MSA_CODE .AND. R_CODE=MR_CODE .AND. S_DATE=MS_DATE
      MBAG = MBAG+BAG
      MVISIT = MVISIT+1
      IF SALE='Y'
         MSALE = MSALE+1
      ENDIF
      SELECT SHOP
      IF RETAIL='N'
         MWSSALE = MWSSALE+SALE.BAG
      ENDIF
      IF S_CATEG='C'
         MCSALE = MCSALE+SALE.BAG
      ENDIF
      SELECT SALE
      SKIP
   ENDDO
   DO SAVDATPRO
   SELECT SALE
   LOOP
ENDDO
SELECT 6
INDEX ON RDATE TAG R_DATE
SET ORDER TO R_Date
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf')
SELECT 8
USE EXCLUSIVE (TMP1)
INDEX ON SA_CODE TAG SA_CODE
SET ORDER TO Sa_Code
GOTO TOP
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
CLEAR
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RWS
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE SAVDATPRO
SELECT 6
APPEND BLANK
REPLACE R_CODE WITH MR_CODE
REPLACE SA_CODE WITH MSA_CODE
REPLACE RDATE WITH MS_DATE
REPLACE BAG WITH MBAG
REPLACE SALE WITH MSALE
REPLACE VISIT WITH MVISIT
REPLACE WSSALE WITH MWSSALE
REPLACE CSALE WITH MCSALE
FLUSH

PROCEDURE REPPRTPRO
MSA_CODE = SPACE(3)
MR_CODE = SPACE(3)
SELECT 8
GOTO TOP
SET PRINTER ON
SET DEVICE TO PRINTER
DO WHILE  .NOT. EOF()
   IF MLINE=6
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD' FONT 'B', 14
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 15 SAY 'Week No: '+WEEK.SR_NO+'    '+'Report From: '+DTOC(WEEK.WS_DATE)+' '+'To:  '+DTOC(WEEK.WE_DATE)
      @ 3, 0 SAY REPLICATE('-',79)
      @ 4, 0 SAY 'CODE ROUTE              DAY DATE  BAGS SP:SALE VP:VSTD % SP  W/S  WS  (C)  (C)'
      @ 5, 0 SAY '                                  SOLD  POINTS  POINTS OF VP SALE  %  SALE  %'
      @ 6, 0 SAY REPLICATE('-',79)
      IF MPAGE=1
         MLINE = MLINE+1
         SUM BAG TO MBAG
         SUM SALE TO MSALE
         SUM VISIT TO MVISIT
         SUM WSSALE TO MWSSALE
         SUM CSALE TO MCSALE
         @ MLINE, 0 SAY 'Grand Total                      '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
         MLINE = MLINE+1
         @ MLINE, 0 SAY REPLICATE('-',79)
         MBAG = 0
         MSALE = 0
         MVISIT = 0
         MWSSALE = 0
         MCSALE = 0
         GOTO TOP
      ENDIF
   ENDIF
   IF MLINE>52
      EJECT
      MPAGE = MPAGE+1
      MLINE = 6
      LOOP
   ENDIF
   MLINE = MLINE+1
   IF SA_CODE<>MSA_CODE
      @ MLINE, 0 SAY SA_CODE+'   '+SALEM.SA_NAME
      @ MLINE, 0 SAY REPLICATE('_',20)
      MLINE = MLINE+2
   ENDIF
   MDAY = CDOW(RDATE)
   MMONTH = CMONTH(RDATE)
   @ MLINE, 0 SAY R_CODE+' '+ROUT.ROUTE+LEFT(MDAY,3)+STR(DAY(RDATE),2)+' '+LEFT(MMONTH,3)+STR(BAG,4)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,4)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,4)+' '+STR((CSALE/BAG*100),3)+'%'
   MBAG = MBAG+BAG
   MSALE = MSALE+SALE
   MVISIT = MVISIT+VISIT
   MWSSALE = MWSSALE+WSSALE
   MCSALE = MCSALE+CSALE
   MSA_CODE = SA_CODE
   IF EOF()
      EXIT
   ENDIF
   SKIP
   IF SA_CODE<>MSA_CODE
      MLINE = MLINE+1
      @ MLINE, 0 SAY REPLICATE('-',79)
      MLINE = MLINE+1
      @ MLINE, 0 SAY 'Total                            '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
      MLINE = MLINE+1
      @ MLINE, 0 SAY REPLICATE('-',79)
      MBAG = 0
      MSALE = 0
      MVISIT = 0
      MWSSALE = 0
      MCSALE = 0
   ENDIF
   LOOP
ENDDO
EJECT
RETURN

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MSA_CODE = SPACE(3)
MR_CODE = SPACE(3)
MLINE = 8
SELECT 8
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 15 SAY 'Week No: '+WEEK.SR_NO+'    '+'Report From: '+DTOC(WEEK.WS_DATE)+' '+'To:  '+DTOC(WEEK.WE_DATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE ROUTE              DAY DATE  BAGS SP:SALE VP:VSTD % SP  W/S  WS  (C)  (C)'
@ 5, 0 SAY '                                  SOLD  POINTS  POINTS OF VP SALE  %  SALE  %'
@ 6, 0 SAY REPLICATE('-',77)
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
@ 7, 0 SAY 'Grand Total                      '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
@ 8, 0 SAY REPLICATE('-',77)
MBAG = 0
MSALE = 0
MVISIT = 0
MWSSALE = 0
MCSALE = 0
GOTO TOP
DO WHILE  .NOT. EOF()
   MLINE = MLINE+1
   MSA_CODE = SA_CODE
   @ MLINE, 0 SAY SA_CODE+'   '+SALEM.SA_NAME COLOR B/W 
   MLINE = MLINE+1
   DO WHILE MSA_CODE=SA_CODE
      MLINE = MLINE+1
      IF MLINE>20
         @ 21, 28 SAY 'Continue Or Quit C/Q'
         @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
         READ
         IF MCQ='Q'
            RELEASE WINDOW SCR
            RETURN
            EXIT
         ENDIF
         @ 9, 0 CLEAR TO 21, 78
         MLINE = 8
         MCQ = SPACE(1)
         LOOP
      ENDIF
      MDAY = CDOW(RDATE)
      MMONTH = CMONTH(RDATE)
      @ MLINE, 0 SAY R_CODE+' '+ROUT.ROUTE+LEFT(MDAY,3)+STR(DAY(RDATE),2)+' '+LEFT(MMONTH,3)+STR(BAG,4)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,4)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,4)+' '+STR((CSALE/BAG*100),3)+'%'
      MBAG = MBAG+BAG
      MSALE = MSALE+SALE
      MVISIT = MVISIT+VISIT
      MWSSALE = MWSSALE+WSSALE
      MCSALE = MCSALE+CSALE
      MSA_CODE = SA_CODE
      IF EOF()
         EXIT
      ENDIF
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   @ MLINE, 0 SAY 'Total                            '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      EXIT
   ENDIF
   @ 9, 0 CLEAR TO 21, 78
   MLINE = 8
   MCQ = SPACE(1)
   LOOP
ENDDO
RELEASE WINDOW SCR
RETURN

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
SET ORDER TO Sr_No
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
MWEEK = SR_NO
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* RWSALE.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
SELECT 2
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
SELECT 3
USE SHARED Routes ALIAS ROUT
SET ORDER TO R_Code
SELECT 4
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
SELECT 5
USE EXCLUSIVE (TMP)
SELECT 6
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
MS_DATE = CTOD('  /  /    ')
MBAG = 0
MSALE = 0
MVISIT = 0
MR_CODE = SPACE(3)
MSA_CODE = SPACE(3)
MDAY = SPACE(15)
MPS = SPACE(1)
MPAGE = 1
MLINE = 8
MCQ = SPACE(1)
MWSSALE = 0
MCSALE = 0
DEFINE WINDOW RWSALE FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RWSALE
SET CENTURY ON
DO WHILE .T.
   MS_DATE = CTOD('  /  /    ')
   @ 2, 10 SAY 'Enter Report Date'
   @ 2, 30 GET MS_DATE PICTURE ('99/99/9999')
   READ
   IF MS_DATE=CTOD('  /  /    ')
      RELEASE WINDOW RWSALE
      SET CENTURY ON
      SET PRINTER OFF
      SET DEVICE TO SCREEN
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DO OPENDBFS
      RETURN
      EXIT
   ENDIF
   SELECT SALE
   SET ORDER TO S_Date
   SEEK MS_DATE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Report Date Not Exist'
      LOOP
   ELSE
      EXIT
   ENDIF
ENDDO
CLEAR
@ 1, 13 SAY 'Report in Processing'
@ 3, 13 SAY "Please Don't Distrub"
SELECT 5
SET RELATION TO R_CODE INTO ROUT ADDITIVE
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SELECT SALE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET FILTER TO S_DATE=MS_DATE
SET ORDER TO RS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MSA_CODE = SA_CODE
   MR_CODE = R_CODE
   MBAG = 0
   MSALE = 0
   MVISIT = 0
   MWSSALE = 0
   MCSALE = 0
   DO WHILE SA_CODE=MSA_CODE .AND. R_CODE=MR_CODE
      MBAG = MBAG+BAG
      MVISIT = MVISIT+1
      IF SALE='Y'
         MSALE = MSALE+1
      ENDIF
      SELECT SHOP
      IF RETAIL='N'
         MWSSALE = MWSSALE+SALE.BAG
      ENDIF
      IF S_CATEG='C'
         MCSALE = MCSALE+SALE.BAG
      ENDIF
      SELECT SALE
      SKIP
   ENDDO
   DO SAVDATPRO
   SELECT SALE
   LOOP
ENDDO
CLEAR
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RWSALE
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE SAVDATPRO
SELECT 5
APPEND BLANK
REPLACE R_CODE WITH MR_CODE
REPLACE SA_CODE WITH MSA_CODE
REPLACE RDATE WITH MS_DATE
REPLACE BAG WITH MBAG
REPLACE SALE WITH MSALE
REPLACE VISIT WITH MVISIT
REPLACE WSSALE WITH MWSSALE
REPLACE CSALE WITH MCSALE
FLUSH

PROCEDURE REPPRTPRO
SELECT 5
INDEX ON SA_CODE TAG SA_CODE
SET ORDER TO Sa_Code
GOTO TOP
SET PRINTER ON
SET DEVICE TO PRINTER
DO WHILE  .NOT. EOF()
   IF MLINE=8
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD' FONT 'B', 14
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 22 SAY 'Date: '+DTOC(RDATE)+'    '+'Day: '+CDOW(RDATE)
      @ 3, 0 SAY REPLICATE('-',79)
      @ 4, 0 SAY 'CODE ROUTE              SALESMEN  BAGS SP:SALE VP:VSTD % SP  W/S  WS  (C)  (C)'
      @ 5, 0 SAY '                          NAME    SOLD  POINTS  POINTS OF VP SALE  %  SALE  %'
      @ 6, 0 SAY REPLICATE('-',79)
      IF MPAGE=1
         SUM BAG TO MBAG
         SUM SALE TO MSALE
         SUM VISIT TO MVISIT
         SUM WSSALE TO MWSSALE
         SUM CSALE TO MCSALE
         @ 7, 0 SAY 'Grand Total                      '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
         @ 8, 0 SAY REPLICATE('-',79)
         GOTO TOP
      ENDIF
   ENDIF
   IF MLINE>52
      EJECT
      MPAGE = MPAGE+1
      MLINE = 8
   ENDIF
   MLINE = MLINE+1
   MDAY = CDOW(RDATE)
   MMONTH = CMONTH(RDATE)
   @ MLINE, 0 SAY R_CODE+' '+ROUT.ROUTE+LEFT(SALEM.SA_NAME,9)+STR(BAG,4)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,4)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,4)+' '+STR((CSALE/BAG*100),3)+'%'
   IF EOF()
      EXIT
   ENDIF
   SKIP
   LOOP
ENDDO
EJECT
RETURN

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MLINE = 8
SELECT 5
INDEX ON SA_CODE TAG SA_CODE
SET ORDER TO Sa_Code
GOTO TOP
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 22 SAY 'Date: '+DTOC(RDATE)+'    '+'Day: '+CDOW(RDATE) COLOR B/W 
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE ROUTE              SALESMEN  BAGS SP:SALE VP:VSTD % SP  W/S  WS  (C)  (C)'
@ 5, 0 SAY '                          NAME    SOLD  POINTS  POINTS OF VP SALE  %  SALE  %'
@ 6, 0 SAY REPLICATE('-',77)
SUM BAG TO MBAG
SUM SALE TO MSALE
SUM VISIT TO MVISIT
SUM WSSALE TO MWSSALE
SUM CSALE TO MCSALE
@ 7, 0 SAY 'Grand Total                      '+STR(MBAG,4)+STR(MSALE,8)+STR(MVISIT,8)+STR((MSALE/MVISIT*100),6)+'%'+STR(MWSSALE,4)+' '+STR((MWSSALE/MBAG*100),3)+'%'+STR(MCSALE,4)+' '+STR((MCSALE/MBAG*100),3)+'%'
@ 8, 0 SAY REPLICATE('-',77)
GOTO TOP
DO WHILE  .NOT. EOF()
   MCQ = SPACE(1)
   MLINE = MLINE+1
   @ MLINE, 0 SAY R_CODE+' '+ROUT.ROUTE+LEFT(SALEM.SA_NAME,9)+STR(BAG,4)+STR(SALE,8)+STR(VISIT,8)+STR((SALE/VISIT*100),6)+'%'+STR(WSSALE,4)+' '+STR((WSSALE/BAG*100),3)+'%'+STR(CSALE,4)+' '+STR((CSALE/BAG*100),3)+'%'
   SKIP
   MLINE = MLINE+1
   IF MLINE>19
      @ 21, 28 SAY 'Continue Or Quit C/Q'
      @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
      READ
      IF MCQ='Q'
         EXIT
      ENDIF
      @ 9, 0 CLEAR TO 21, 78
      MLINE = 8
   ENDIF
   LOOP
ENDDO
IF MCQ=SPACE(1)
   @ 21, 32 SAY 'Quit (Q)'
   @ 21, 45 GET MCQ PICTURE '@!' VALID MCQ='Q' ERROR 'Quit (Q)'
   READ
ENDIF
RELEASE WINDOW SCR
RETURN
* 
* 
* SALE.FXP 
* -------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Shop ALIAS SHOP
SELECT 2
USE SHARED SRout ALIAS SROUT
SELECT 3
USE SHARED Routes ALIAS ROUT
SELECT 4
USE SHARED Sale ALIAS SALE
SELECT 5
USE SHARED Salesmen ALIAS SALEM
SELECT 6
USE SHARED Licen ALIAS LICE
SET ORDER TO Ok
MS_DATE = CTOD('  /  /    ')
MSA_CODE = SPACE(3)
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MSALE = SPACE(1)
MBAG = 0
MBASKIT = 0
MR_CODE = SPACE(3)
ML_DATE = DATE()
DEFINE WINDOW SALE FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SALE ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME SALE
DD = CHR(ASC('A')-14)+CHR(ASC('A')-16)
MM = CHR(ASC('A')-16)+CHR(ASC('A')-15)
YY = CHR(ASC('A')-15)+CHR(ASC('A')-17)+CHR(ASC('A')-17)+CHR(ASC('A')-16)
MS_DATE = DATE()
DO WHILE .T.
   DO DSPHEDPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = SPACE(1)
   MBAG = 0
   MBASKIT = 0
   MR_CODE = SPACE(3)
   SELECT SALE
   SET ORDER TO DRSH
   @ 3, 25 CLEAR TO 16, 69
   @ 17, 20 CLEAR TO 17, 69
   @ 2, 25 GET MS_DATE PICTURE ('99/99/9999')
   READ
   IF MS_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   DO WHILE .T.
      @ 17, 21 SAY 'Press F1 to see Salesmen List'
      ON KEY LABEL F1 DO ShwSalPro
      @ 4, 25 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
      MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
      IF MSA_CODE='000'
         EXIT
      ENDIF
      SELECT SALEM
      SET ORDER TO Sa_Code
      SEEK MSA_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Salesmen Code Not Exist'
         MSA_CODE = SPACE(3)
         LOOP
      ELSE
         @ 4, 25 SAY MSA_CODE PICTURE '999'
         @ 4, 30 SAY SA_NAME
         EXIT
      ENDIF
   ENDDO
   IF MSA_CODE='000'
      LOOP
   ENDIF
   DO WHILE .T.
      @ 6, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 To Exit'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
      MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
      IF MSUR_CODE='000'
         EXIT
      ENDIF
      @ 6, 25 SAY MSUR_CODE+'-'
      @ 17, 20 CLEAR TO 17, 69
      @ 17, 21 SAY 'Press F2 to see Shopes List'
      ON KEY LABEL F2 DO ShwShoPro
      @ 6, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
      MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
      IF MSH_CODE='00'
         EXIT
      ENDIF
      SELECT SHOP
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Shop Code Not Exist'
         MSUR_CODE = SPACE(3)
         MSH_CODE = SPACE(2)
         LOOP
      ELSE
         @ 6, 29 SAY MSH_CODE PICTURE '99'
         @ 7, 25 SAY SH_NAME
         EXIT
      ENDIF
   ENDDO
   IF MSUR_CODE='000' .OR. MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SROUT
   SET ORDER TO SSC_Desc
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Shop Not Exist In Route Set-Up'
      LOOP
   ENDIF
   MR_CODE = R_CODE
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   @ 9, 25 SAY MR_CODE+'  '+ROUTE
   SELECT SALE
   SET ORDER TO DRSH
   SEEK DTOC(MS_DATE)+MSUR_CODE+MSH_CODE
   IF FOUND()
      WAIT WINDOW 'This Entry Already Exist'
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      LOOP
   ENDIF
   @ 11, 25 GET MSALE PICTURE 'YN' VALID MSALE<>SPACE(1) ERROR 'Sale Can Not Be Blank - Yes No'
   READ
   IF MSALE='Y'
      @ 13, 25 GET MBAG PICTURE '@3K 999'
      READ
   ENDIF
   @ 15, 25 GET MBASKIT PICTURE '@2K 99'
   READ
   DO SAVDATPRO
ENDDO
RELEASE WINDOW SALE
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Enter Sale Date'
@ 4, 1 SAY 'Enter Salemen Code'
@ 6, 1 SAY 'Enter Shop Code'
@ 9, 1 SAY 'Route Code/Name'
@ 11, 1 SAY 'Sale Y/N'
@ 13, 1 SAY 'Bags'
@ 15, 1 SAY 'Basket'

PROCEDURE SAVDATPRO
SELECT SALE
APPEND BLANK
REPLACE S_DATE WITH MS_DATE
REPLACE SA_CODE WITH MSA_CODE
REPLACE SA_NAME WITH SALEM.SA_NAME
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE SALE WITH MSALE
REPLACE BAG WITH MBAG
REPLACE BASKIT WITH MBASKIT
REPLACE R_CODE WITH MR_CODE
ML_DATE = S_DATE
IF ML_DATE>CTOD(DD+'/'+MM+'/'+YY)
   RELEASE WINDOW SALE
   SELECT LICE
   APPEND BLANK
   REPLACE L_DATE WITH ML_DATE
   REPLACE OK WITH 'Y'
   SELECT SALE
   DELETE
   CLOSE DATABASES
   DO OPENDBFS
   DO UPDATEPRO IN A-Main
ENDIF
FLUSH

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSAL FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcSalPro
BROWSE FIELDS SA_CODE : 4 :H = ' ', SA_NAME :H = 'Salesmen List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSALPRO
MSA_CODE = SA_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F3 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN
* 
* 
* SALESMEN.FXP 
* ------------ 
*
MSA_CODE = SPACE(3)
MSA_NAME = SPACE(15)
DEFINE WINDOW SALESMEN FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SALESMEN ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME SALESMEN
DO WHILE .T.
   DO DSPHEDPRO
   MSA_CODE = SPACE(3)
   MSA_NAME = SPACE(15)
   SELECT SALEM
   SET ORDER TO Sa_code
   @ 12, 18 SAY 'Press F5 to see Salesmens Name List'
   ON KEY LABEL F5 DO ShwSalPro
   @ 4, 25 GET MSA_CODE PICTURE '@3K 999' VALID MSA_CODE<>SPACE(3) ERROR 'Salesmen Code Can Not Be Blank - Enter 0 to Exit'
   READ
   IF MSA_CODE='0'
      EXIT
   ENDIF
   MCODLEN = LEN(LTRIM(RTRIM(MSA_CODE)))
   MSA_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSA_CODE))
   @ 4, 25 SAY MSA_CODE PICTURE '999'
   SEEK MSA_CODE
   IF FOUND()
      WAIT WINDOW 'Salesmen Code Already Exist'
      LOOP
   ELSE
      @ 8, 25 GET MSA_NAME PICTURE '@!X15' VALID MSA_NAME<>SPACE(15) ERROR 'Salesmen Name Can Not Be Blank'
      READ
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW SALESMEN
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Salesmen Code'
@ 8, 1 SAY 'Enter Salesmen Name'

PROCEDURE SAVDATPRO
SELECT SALEM
APPEND BLANK
REPLACE SA_CODE WITH MSA_CODE
REPLACE SA_NAME WITH MSA_NAME
FLUSH

PROCEDURE SHWSALPRO
PUSH KEY
@ 12, 18 CLEAR TO 12, 53
DEFINE WINDOW SHWSAL FROM 5, 45 TO 20, 75 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWSAL
SELECT SALEM
ON KEY LABEL F5 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS SA_CODE : 5 :H = ' ', SA_NAME :H = 'Salesmen Name List' NOAPPEND NOEDIT NODELETE IN SHWSAL
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
CLEAR GETS
DEACTIVATE WINDOW SHWSAL
ON KEY LABEL ENTER 
RETURN
* 
* 
* SHOP.FXP 
* -------- 
*
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MSH_NAME = SPACE(30)
MSH_ADD = SPACE(50)
MSH_CONTAC = SPACE(10)
MSH_PHONE = SPACE(15)
MC_CODE = SPACE(2)
MS_CATEG = SPACE(2)
MRETAIL = SPACE(1)
DEFINE WINDOW SHOP FROM INT((SROWS()-19)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-19)/2)+19, INT((SCOLS()-69)/2)+70 NOFLOAT NOCLOSE SHADOW TITLE 'SHOP ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME SHOP
DO WHILE .T.
   DO DSPHEDPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSH_NAME = SPACE(30)
   MSH_ADD = SPACE(50)
   MSH_CONTAC = SPACE(10)
   MSH_PHONE = SPACE(15)
   MC_CODE = SPACE(2)
   MS_CATEG = SPACE(2)
   MRETAIL = SPACE(1)
   @ 2, 25 CLEAR TO 16, 69
   @ 17, 15 CLEAR TO 17, 69
   DO DSPHEDPRO
   @ 2, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
   MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
   IF MSUR_CODE='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MSUR_CODE+'-'
   @ 17, 15 CLEAR TO 17, 69
   @ 17, 21 SAY 'Press F2 to see Shop List'
   ON KEY LABEL F2 DO ShwShoPro
   @ 2, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
   MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
   @ 2, 29 SAY MSH_CODE PICTURE '99'
   IF MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SHOP
   SET ORDER TO SS_Code
   SEEK MSUR_CODE+MSH_CODE
   IF FOUND()
      WAIT WINDOW 'Shop Code Already Exist'
      LOOP
   ENDIF
   @ 17, 15 CLEAR TO 17, 69
   @ 4, 25 GET MSH_NAME PICTURE '@!X30' VALID MSH_NAME<>SPACE(30) ERROR 'Shop Name Can Not Be Blank'
   @ 6, 25 GET MSH_ADD PICTURE '@!X50' VALID MSH_ADD<>SPACE(50) ERROR 'Shop Address Can Not Be Blank'
   @ 9, 25 GET MSH_CONTAC PICTURE '@!X10'
   @ 11, 25 GET MSH_PHONE PICTURE '@!X15'
   @ 13, 25 GET MS_CATEG PICTURE '@!X2' VALID MS_CATEG='A ' .OR. MS_CATEG='B ' .OR. MS_CATEG='C ' .OR. MS_CATEG='C1' .OR. MS_CATEG='D ' ERROR 'Shop Category Only A,B,C,C1,D'
   @ 13, 60 GET MRETAIL PICTURE '@!X1' VALID MRETAIL='Y' .OR. MRETAIL='N' ERROR 'Retail Y/N'
   READ
   DO WHILE .T.
      @ 17, 18 SAY 'Press F3 to see Shop Type List'
      ON KEY LABEL F3 DO ShwCatPro
      @ 15, 25 GET MC_CODE PICTURE '@2K 99' VALID MC_CODE<>SPACE(2) ERROR 'Shop Type Can Not Be Blank'
      READ
      MCODLEN = LEN(LTRIM(RTRIM(MC_CODE)))
      MC_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MC_CODE))
      SELECT CATE
      SET ORDER TO C_Code
      SEEK MC_CODE
      IF  .NOT. FOUND()
         WAIT WINDOW 'Shop Type Code Not Exist'
         MC_CODE = SPACE(2)
         LOOP
      ELSE
         @ 15, 25 SAY MC_CODE PICTURE '99'
         @ 15, 30 SAY C_CATE
         EXIT
      ENDIF
   ENDDO
   DO SAVDATPRO
   CLEAR GETS
ENDDO
RELEASE WINDOW SHOP
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Shop Code'
@ 4, 1 SAY 'Shop Name'
@ 6, 1 SAY 'Shop Address'
@ 9, 1 SAY 'Contact Person'
@ 11, 1 SAY 'Phone Number'
@ 13, 1 SAY 'Shop Category'
@ 13, 35 SAY 'Retail Y/N'
@ 15, 1 SAY 'Shop Type Code'

PROCEDURE SAVDATPRO
SELECT SHOP
APPEND BLANK
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE SH_NAME WITH MSH_NAME
REPLACE SH_ADD WITH MSH_ADD
REPLACE SH_CONTACT WITH MSH_CONTAC
REPLACE SH_PHONE WITH MSH_PHONE
REPLACE S_CATEG WITH MS_CATEG
REPLACE C_CODE WITH MC_CODE
REPLACE RETAIL WITH MRETAIL
FLUSH

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWCATPRO
PUSH KEY
DEFINE WINDOW SHWCAT FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWCAT
SELECT CATE
ON KEY LABEL F3 
ON KEY LABEL ENTER DO SlcCatPro
BROWSE FIELDS C_CODE : 4 :H = ' ', C_CATE :H = 'Shop Type List' NOAPPEND NOEDIT NODELETE IN SHWCAT
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCCATPRO
MC_CODE = C_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWCAT
ON KEY LABEL ENTER 
RETURN
* 
* 
* SROUT.FXP 
* --------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Routes ALIAS ROUT
SELECT 2
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 3
USE SHARED SRout ALIAS SROUT
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
MSR_DATE = CTOD('  /  /    ')
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MR_CODE = SPACE(3)
DEFINE WINDOW SROUT FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SHOP & ROUTE ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME SROUT
DO WHILE .T.
   DO DSPHEDPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   SELECT SROUT
   SET ORDER TO SSSR
   @ 13, 1 CLEAR TO 13, 69
   @ 3, 25 CLEAR TO 12, 69
   @ 2, 25 GET MSR_DATE PICTURE ('99/99/9999')
   READ
   IF MSR_DATE=CTOD('  /  /    ')
      EXIT
   ENDIF
   @ 6, 25 GET MSUR_CODE PICTURE '@3K 999' VALID MSUR_CODE<>SPACE(3) ERROR 'Survey Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSUR_CODE)))
   MSUR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSUR_CODE))
   IF MSUR_CODE='000'
      LOOP
   ENDIF
   @ 6, 25 SAY MSUR_CODE+'-'
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 21 SAY 'Press F1 to see Shop List'
   ON KEY LABEL F1 DO ShwShoPro
   @ 6, 29 GET MSH_CODE PICTURE '@2K 99' VALID MSH_CODE<>SPACE(2) ERROR 'Shop Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSH_CODE)))
   MSH_CODE = REPLICATE('0',2-MCODLEN)+LTRIM(RTRIM(MSH_CODE))
   @ 6, 29 SAY MSH_CODE PICTURE '99'
   IF MSH_CODE='00'
      LOOP
   ENDIF
   SELECT SHOP
   SET ORDER TO SS_Code
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Shop Code Not Exist'
      LOOP
   ENDIF
   @ 6, 35 SAY SH_NAME
   SELECT SROUT
   SET ORDER TO SSS
   SEEK DTOC(MSR_DATE)+MSUR_CODE+MSH_CODE
   IF FOUND()
      WAIT WINDOW 'Date+Shop Code Already Exist'
      MSR_DATE = CTOD('  /  /    ')
      LOOP
   ENDIF
   @ 13, 1 CLEAR TO 13, 69
   @ 13, 20 SAY 'Press F2 to see Route List'
   ON KEY LABEL F2 DO ShwRotPro
   @ 10, 25 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 To Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   @ 10, 25 SAY MR_CODE
   IF MR_CODE='000'
      LOOP
   ENDIF
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ENDIF
   @ 10, 30 SAY ROUTE
   SELECT SROUT
   SET ORDER TO SSSR
   SEEK DTOC(MSR_DATE)+MSUR_CODE+MSH_CODE+MR_CODE
   IF FOUND()
      WAIT WINDOW 'This Entry Already Exist'
      LOOP
   ENDIF
   DO SAVDATPRO
ENDDO
RELEASE WINDOW SROUT
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Date'
@ 6, 1 SAY 'Shope Code'
@ 10, 1 SAY 'Route Code'

PROCEDURE SAVDATPRO
SELECT SROUT
APPEND BLANK
REPLACE SR_DATE WITH MSR_DATE
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE R_CODE WITH MR_CODE
FLUSH

PROCEDURE SHWSHOPRO
PUSH KEY
DEFINE WINDOW SHWSHO FROM 5, 40 TO 20, 78 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWSHO
SELECT SHOP
SET ORDER TO Sh_Code
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcShoPro
BROWSE FOR MSUR_CODE=SUR_CODE FIELDS SUR_CODE : 4 :H = ' ', SH_CODE : 4 :H = ' ', SH_NAME :H = 'Shopes Name List' NOAPPEND NOEDIT NODELETE IN SHWSHO
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSHOPRO
MSH_CODE = SH_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSHO
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select Code>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
SET ORDER TO R_Code
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcRotPro
BROWSE FIELDS R_CODE : 4 :H = ' ', ROUTE :H = 'Route List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCROTPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* WEEK.FXP 
* -------- 
*
MSR_NO = SPACE(3)
MWS_DATE = CTOD('  /  /    ')
MWE_DATE = CTOD('  /  /    ')
DEFINE WINDOW WEEK FROM INT((SROWS()-16)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-16)/2)+15, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'WEEK ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME WEEK
SET CENTURY ON
DO WHILE .T.
   DO DSPHEDPRO
   MSR_NO = SPACE(3)
   MWS_DATE = CTOD('  /  /    ')
   MWE_DATE = CTOD('  /  /    ')
   SELECT WEEK
   SET ORDER TO SR_No
   @ 2, 25 CLEAR TO 13, 67
   @ 12, 18 SAY 'Press F1 to see Week List'
   ON KEY LABEL F1 DO ShwWekPro
   @ 4, 25 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Serial Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   IF MSR_NO='000'
      EXIT
   ENDIF
   @ 4, 25 SAY MSR_NO PICTURE '999'
   SEEK MSR_NO
   IF FOUND()
      WAIT WINDOW 'Serail Number Already Exist'
      LOOP
   ENDIF
   @ 7, 25 GET MWS_DATE PICTURE ('99/99/9999') VALID MWS_DATE<>CTOD('  /  /    ') ERROR 'Starting Date Can Not Be Blank'
   @ 10, 25 GET MWE_DATE PICTURE ('99/99/9999') VALID MWE_DATE<>CTOD('  /  /    ') ERROR 'Ending Date Can Not Be Blank'
   READ
   DO SAVDATPRO
   CLEAR GETS
ENDDO
RELEASE WINDOW WEEK
RETURN

PROCEDURE DSPHEDPRO
@ 4, 1 SAY 'Enter Serial Number'
@ 7, 1 SAY 'Enter Starting Date'
@ 10, 1 SAY 'Enter Ending Date'

PROCEDURE SAVDATPRO
SELECT WEEK
APPEND BLANK
REPLACE SR_NO WITH MSR_NO
REPLACE WS_DATE WITH MWS_DATE
REPLACE WE_DATE WITH MWE_DATE
FLUSH

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
CLEAR GETS
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* RSWEEK.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
SELECT 2
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 3
USE SHARED Week ALIAS WEEK
SET ORDER TO Sr_No
GOTO TOP
SELECT 4
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
SELECT 5
USE EXCLUSIVE (TMP)
SELECT 6
USE SHARED SRout ALIAS SROUT
SET ORDER TO SS_code DESCENDING
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf')
SELECT 8
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
SELECT 7
USE SHARED Routes ALIAS ROUT
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SELECT 9
USE EXCLUSIVE (TMP1)
MPS = SPACE(1)
MPAGE = 1
MLINE = 7
MCQ = SPACE(1)
MSR_NO = SPACE(3)
MS_DATE = DATE()
MWS_DATE = DATE()
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
STORE 0 TO MWEEK1, MWEEK2, MWEEK3, MWEEK4, MWEEK5, MWEEK6, MWEEK7, MWEEK8
STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8
MS_CATEG = SPACE(2)
MR_CODE = SPACE(3)
STORE SPACE(3) TO MSR_NO1, MSR_NO2, MSR_NO3, MSR_NO4, MSR_NO5, MSR_NO6, MSR_NO7, MSR_NO8
MBAG = 0
STORE 0 TO MTOTAL, MSTOTAL
MCONTINUE = SPACE(8)
STORE 0 TO MGWEEK1, MGWEEK2, MGWEEK3, MGWEEK4, MGWEEK5, MGWEEK6, MGWEEK7, MGWEEK8, MGTOTAL
DEFINE WINDOW RSWEEK FROM INT((SROWS()-17)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-17)/1)+9, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSWEEK
SET CENTURY OFF
DO WHILE .T.
   @ 7, 10 SAY 'Press F1 to see Route List' COLOR W/N 
   ON KEY LABEL F1 DO ShwRotPro
   @ 1, 10 SAY 'Enter Route Code'
   @ 1, 30 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      RELEASE WINDOW RSWEEK
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 1, 30 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ENDIF
   SELECT SALE
   SET ORDER TO S_Date
   GOTO BOTTOM
   MS_DATE = S_DATE
   SELECT WEEK
   GOTO TOP
   DO WHILE WE_DATE<MS_DATE .AND. WE_DATE<>MS_DATE
      SKIP
   ENDDO
   MSR_NO = SR_NO
   @ 3, 4 SAY 'Data Is Available Upto End Week No: '+MSR_NO
   @ 4, 10 SAY 'From '+DTOC(WS_DATE)+' To '+DTOC(WE_DATE)
   @ 7, 1 CLEAR 7, 49
   @ 7, 12 SAY 'Press F2 to see Week List' COLOR W/N 
   ON KEY LABEL F2 DO ShwWekPro
   @ 6, 5 SAY 'Do You Want To Change The End Week?'
   @ 6, 41 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Week Serail Number Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   @ 6, 41 SAY MSR_NO
   IF MSR_NO='000'
      LOOP
   ENDIF
   SELECT WEEK
   SET ORDER TO Sr_No
   SEEK MSR_NO
   IF FOUND()
      EXIT
   ELSE
      WAIT WINDOW 'Week Serail Number Not Exist'
      LOOP
   ENDIF
ENDDO
CLEAR
@ 3, 13 SAY 'Report in Processing'
@ 5, 13 SAY "Please Don't Distrub"
SELECT 9
SET FILTER TO R_CODE=MR_CODE
INDEX ON SUR_CODE+SH_CODE TAG SSU_CODE UNIQUE
SET ORDER TO SSU_Code
GOTO TOP
MSUR_CODE = SUR_CODE
MSH_CODE = SH_CODE
SELECT SALE
GOTO BOTTOM
IF S_DATE>WEEK.WE_DATE
   MS_DATE = WEEK.WE_DATE
ELSE
   MS_DATE = SALE.S_DATE
ENDIF
SELECT WEEK
SKIP -7
MWS_DATE = WS_DATE
SELECT SALE
GOTO TOP
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET FILTER TO S_DATE>=MWS_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE .T.
   MS_CATEG = SPACE(2)
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      SELECT 9
      IF EOF()
         EXIT
      ENDIF
      SKIP
      MSUR_CODE = SUR_CODE
      MSH_CODE = SH_CODE
      SELECT SALE
      LOOP
   ENDIF
   DO WHILE SUR_CODE+SH_CODE=MSUR_CODE+MSH_CODE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK1 = MWEEK1+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -1
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK2 = MWEEK2+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -2
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK3 = MWEEK3+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -3
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK4 = MWEEK4+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -4
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK5 = MWEEK5+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -5
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK6 = MWEEK6+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -6
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK7 = MWEEK7+BAG
      ENDIF
      SELECT WEEK
      SKIP
      IF EOF()
         SKIP -7
         SELECT SALE
         SKIP
         LOOP
      ENDIF
      SELECT SALE
      IF S_DATE>=WEEK.WS_DATE .AND. S_DATE<=WEEK.WE_DATE
         MWEEK8 = MWEEK8+BAG
      ENDIF
      SELECT WEEK
      SKIP -7
      SELECT SALE
      SKIP
   ENDDO
   SELECT SHOP
   SEEK MSUR_CODE+MSH_CODE
   IF RETAIL='N'
      MS_CATEG = 'WS'
   ELSE
      MS_CATEG = S_CATEG
   ENDIF
   DO SAVDATPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   STORE 0 TO MWEEK1, MWEEK2, MWEEK3, MWEEK4, MWEEK5, MWEEK6, MWEEK7, MWEEK8
   SELECT 9
   SKIP
   IF EOF()
      EXIT
   ENDIF
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   SELECT SALE
   LOOP
ENDDO
SELECT WEEK
MSR_NO1 = SR_NO
SKIP
IF  .NOT. EOF()
   MSR_NO2 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO3 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO4 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO5 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO6 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO7 = SR_NO
   SKIP
ENDIF
IF  .NOT. EOF()
   MSR_NO8 = SR_NO
ENDIF
SELECT 5
GOTO TOP
DO WHILE  .NOT. EOF()
   IF S_CATEG='WS'
      REPLACE BAG WITH 1
      REPLACE DESC WITH 'Whole Sale'
   ENDIF
   IF S_CATEG='A'
      REPLACE BAG WITH 2
      REPLACE DESC WITH 'Category-A'
   ENDIF
   IF S_CATEG='B'
      REPLACE BAG WITH 3
      REPLACE DESC WITH 'Category-B'
   ENDIF
   IF S_CATEG='C'
      REPLACE BAG WITH 4
      REPLACE DESC WITH 'Category-C'
   ENDIF
   IF S_CATEG='C1'
      REPLACE BAG WITH 5
      REPLACE DESC WITH 'Category-C1'
   ENDIF
   IF S_CATEG='D'
      REPLACE BAG WITH 6
      REPLACE DESC WITH 'Category-D'
   ENDIF
   SKIP
ENDDO
CLEAR
@ 4, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 4, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RSWEEK
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE SAVDATPRO
SELECT 5
APPEND BLANK
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE WEEK1 WITH MWEEK1
REPLACE WEEK2 WITH MWEEK2
REPLACE WEEK3 WITH MWEEK3
REPLACE WEEK4 WITH MWEEK4
REPLACE WEEK5 WITH MWEEK5
REPLACE WEEK6 WITH MWEEK6
REPLACE WEEK7 WITH MWEEK7
REPLACE WEEK8 WITH MWEEK8
REPLACE S_CATEG WITH MS_CATEG
FLUSH

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MBAG = 0
MLINE = 7
STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8
STORE 0 TO MTOTAL, MSTOTAL
SELECT 5
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON BAG TAG TMP
SET ORDER TO Tmp
GOTO TOP
@ 1, 0 SAY 'Route No: '+MR_CODE
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MWS_DATE)+' '+'To:  '+DTOC(MS_DATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE  SHOP NAME                       TOTAL                   WEEKS'
@ 5, 0 SAY '                                              '+MSR_NO1+' '+MSR_NO2+' '+MSR_NO3+' '+MSR_NO4+' '+MSR_NO5+' '+MSR_NO6+' '+MSR_NO7+' '+MSR_NO8
@ 6, 0 SAY REPLICATE('-',77)
@ MLINE, 0 SAY 'Total Summary'
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   MGWEEK1 = MGWEEK1+MSWEEK1
   MGWEEK2 = MGWEEK2+MSWEEK2
   MGWEEK3 = MGWEEK3+MSWEEK3
   MGWEEK4 = MGWEEK4+MSWEEK4
   MGWEEK5 = MGWEEK5+MSWEEK5
   MGWEEK6 = MGWEEK6+MSWEEK6
   MGWEEK7 = MGWEEK7+MSWEEK7
   MGWEEK8 = MGWEEK8+MSWEEK8
   MGTOTAL = MGTOTAL+MSTOTAL
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
   LOOP
ENDDO
@ MLINE, 14 SAY '  GRAND TOTAL BAGS      '+IIF(MGTOTAL=0,'     ',STR(MGTOTAL,5))+'  '+IIF(MGWEEK1=0,'    ',STR(MGWEEK1,4))+IIF(MGWEEK2=0,'    ',STR(MGWEEK2,4))+IIF(MGWEEK3=0,'    ',STR(MGWEEK3,4))+IIF(MGWEEK4=0,'    ',STR(MGWEEK4,4))+IIF(MGWEEK5=0,'    ',STR(MGWEEK5,4))+IIF(MGWEEK6=0,'    ',STR(MGWEEK6,4))+IIF(MGWEEK7=0,'    ',STR(MGWEEK7,4))+IIF(MGWEEK8=0,'    ',STR(MGWEEK8,4))
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 10 SAY '          '+MS_CATEG+'       '+IIF(MSTOTAL=0,'     ',STR(MSTOTAL,5))+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1,4))+IIF(MSWEEK2=0,'    ',STR(MSWEEK2,4))+IIF(MSWEEK3=0,'    ',STR(MSWEEK3,4))+IIF(MSWEEK4=0,'    ',STR(MSWEEK4,4))+IIF(MSWEEK5=0,'    ',STR(MSWEEK5,4))+IIF(MSWEEK6=0,'    ',STR(MSWEEK6,4))+IIF(MSWEEK7=0,'    ',STR(MSWEEK7,4))+IIF(MSWEEK8=0,'    ',STR(MSWEEK8,4))
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
   LOOP
ENDDO
IF MLINE>5
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      RELEASE WINDOW SCR
      RETURN
   ENDIF
   MCQ = SPACE(1)
   @ 7, 0 CLEAR TO 20, 78
   MLINE = 7
ENDIF
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   @ MLINE, 10 SAY '         '+MS_CATEG COLOR B/W 
   @ MLINE, 30 SAY ' Bags   '+IIF(MSTOTAL=0,'     ',STR(MSTOTAL,5))+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1,4))+IIF(MSWEEK2=0,'    ',STR(MSWEEK2,4))+IIF(MSWEEK3=0,'    ',STR(MSWEEK3,4))+IIF(MSWEEK4=0,'    ',STR(MSWEEK4,4))+IIF(MSWEEK5=0,'    ',STR(MSWEEK5,4))+IIF(MSWEEK6=0,'    ',STR(MSWEEK6,4))+IIF(MSWEEK7=0,'    ',STR(MSWEEK7,4))+IIF(MSWEEK8=0,'    ',STR(MSWEEK8,4))
   MLINE = MLINE+1
   @ MLINE, 10 SAY '         '+MS_CATEG COLOR B/W 
   @ MLINE, 30 SAY ' %        '+IIF(MSTOTAL=0,'      ',STR(MSTOTAL/MGTOTAL*100,3)+'%')+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1/MGWEEK1*100,3)+'%')+IIF(MSWEEK2=0,'    ',STR(MSWEEK2/MGWEEK2*100,3)+'%')+IIF(MSWEEK3=0,'    ',STR(MSWEEK3/MGWEEK3*100,3)+'%')+IIF(MSWEEK4=0,'    ',STR(MSWEEK4/MGWEEK4*100,3)+'%')+IIF(MSWEEK5=0,'    ',STR(MSWEEK5/MGWEEK5*100,3)+'%')+IIF(MSWEEK6=0,'    ',STR(MSWEEK6/MGWEEK6*100,3)+'%')+IIF(MSWEEK7=0,'    ',STR(MSWEEK7/MGWEEK7*100,3)+'%')+IIF(MSWEEK8=0,'    ',STR(MSWEEK8/MGWEEK8*100,3)+'%')
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MBAG=BAG
      MTOTAL = WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      @ MLINE, 0 SAY SUR_CODE+'-'+SH_CODE+' '+SHOP.SH_NAME+' '+IIF(MTOTAL=0,'     ',STR(MTOTAL,5))+'  '+IIF(WEEK1=0,'    ',STR(WEEK1,4))+IIF(WEEK2=0,'    ',STR(WEEK2,4))+IIF(WEEK3=0,'    ',STR(WEEK3,4))+IIF(WEEK4=0,'    ',STR(WEEK4,4))+IIF(WEEK5=0,'    ',STR(WEEK5,4))+IIF(WEEK6=0,'    ',STR(WEEK6,4))+IIF(WEEK7=0,'    ',STR(WEEK7,4))+IIF(WEEK8=0,'    ',STR(WEEK8,4))
      SKIP
      MLINE = MLINE+1
      IF MLINE>20
         @ 21, 28 SAY 'Continue Or Quit C/Q'
         @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
         READ
         IF MCQ='Q'
            EXIT
         ENDIF
         MCQ = SPACE(1)
         @ 10, 0 CLEAR TO 20, 78
         MLINE = 10
      ENDIF
      STORE 0 TO MTOTAL
   ENDDO
   DELETE ALL FOR BAG=MBAG
   SET ORDER TO Tmp
   GOTO TOP
   MBAG = 0
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8
   STORE 0 TO MTOTAL, MSTOTAL
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      EXIT
   ENDIF
   MCQ = SPACE(1)
   @ 7, 0 CLEAR TO 20, 78
   MLINE = 7
   LOOP
ENDDO
RELEASE WINDOW SCR
RETURN

PROCEDURE REPPRTPRO
MBAG = 0
MLINE = 7
STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8
STORE 0 TO MTOTAL, MSTOTAL
SELECT 5
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON BAG TAG TMP
SET ORDER TO Tmp
GOTO TOP
SET PRINTER ON
SET DEVICE TO PRINTER
@ 1, 0 SAY 'Route No: '+MR_CODE
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
@ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MWS_DATE)+' '+'To:  '+DTOC(MS_DATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE  SHOP NAME                       TOTAL                   WEEKS'
@ 5, 0 SAY '                                              '+MSR_NO1+' '+MSR_NO2+' '+MSR_NO3+' '+MSR_NO4+' '+MSR_NO5+' '+MSR_NO6+' '+MSR_NO7+' '+MSR_NO8
@ 6, 0 SAY REPLICATE('-',77)
@ MLINE, 0 SAY 'Total Summary'
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   MGWEEK1 = MGWEEK1+MSWEEK1
   MGWEEK2 = MGWEEK2+MSWEEK2
   MGWEEK3 = MGWEEK3+MSWEEK3
   MGWEEK4 = MGWEEK4+MSWEEK4
   MGWEEK5 = MGWEEK5+MSWEEK5
   MGWEEK6 = MGWEEK6+MSWEEK6
   MGWEEK7 = MGWEEK7+MSWEEK7
   MGWEEK8 = MGWEEK8+MSWEEK8
   MGTOTAL = MGTOTAL+MSTOTAL
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
   LOOP
ENDDO
@ MLINE, 14 SAY '  GRAND TOTAL BAGS      '+IIF(MGTOTAL=0,'     ',STR(MGTOTAL,5))+'  '+IIF(MGWEEK1=0,'    ',STR(MGWEEK1,4))+IIF(MGWEEK2=0,'    ',STR(MGWEEK2,4))+IIF(MGWEEK3=0,'    ',STR(MGWEEK3,4))+IIF(MGWEEK4=0,'    ',STR(MGWEEK4,4))+IIF(MGWEEK5=0,'    ',STR(MGWEEK5,4))+IIF(MGWEEK6=0,'    ',STR(MGWEEK6,4))+IIF(MGWEEK7=0,'    ',STR(MGWEEK7,4))+IIF(MGWEEK8=0,'    ',STR(MGWEEK8,4))
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 10 SAY '          '+MS_CATEG+'       '+IIF(MSTOTAL=0,'     ',STR(MSTOTAL,5))+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1,4))+IIF(MSWEEK2=0,'    ',STR(MSWEEK2,4))+IIF(MSWEEK3=0,'    ',STR(MSWEEK3,4))+IIF(MSWEEK4=0,'    ',STR(MSWEEK4,4))+IIF(MSWEEK5=0,'    ',STR(MSWEEK5,4))+IIF(MSWEEK6=0,'    ',STR(MSWEEK6,4))+IIF(MSWEEK7=0,'    ',STR(MSWEEK7,4))+IIF(MSWEEK8=0,'    ',STR(MSWEEK8,4))
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8, MSTOTAL
   LOOP
ENDDO
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSWEEK1 = MSWEEK1+WEEK1
      MSWEEK2 = MSWEEK2+WEEK2
      MSWEEK3 = MSWEEK3+WEEK3
      MSWEEK4 = MSWEEK4+WEEK4
      MSWEEK5 = MSWEEK5+WEEK5
      MSWEEK6 = MSWEEK6+WEEK6
      MSWEEK7 = MSWEEK7+WEEK7
      MSWEEK8 = MSWEEK8+WEEK8
      MSTOTAL = MSTOTAL+WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+2
   @ MLINE, 10 SAY '         '+MS_CATEG+' Bags   '+IIF(MSTOTAL=0,'     ',STR(MSTOTAL,5))+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1,4))+IIF(MSWEEK2=0,'    ',STR(MSWEEK2,4))+IIF(MSWEEK3=0,'    ',STR(MSWEEK3,4))+IIF(MSWEEK4=0,'    ',STR(MSWEEK4,4))+IIF(MSWEEK5=0,'    ',STR(MSWEEK5,4))+IIF(MSWEEK6=0,'    ',STR(MSWEEK6,4))+IIF(MSWEEK7=0,'    ',STR(MSWEEK7,4))+IIF(MSWEEK8=0,'    ',STR(MSWEEK8,4))
   MLINE = MLINE+1
   @ MLINE, 10 SAY '         '+MS_CATEG+' %        '+IIF(MSTOTAL=0,'      ',STR(MSTOTAL/MGTOTAL*100,3)+'%')+'  '+IIF(MSWEEK1=0,'    ',STR(MSWEEK1/MGWEEK1*100,3)+'%')+IIF(MSWEEK2=0,'    ',STR(MSWEEK2/MGWEEK2*100,3)+'%')+IIF(MSWEEK3=0,'    ',STR(MSWEEK3/MGWEEK3*100,3)+'%')+IIF(MSWEEK4=0,'    ',STR(MSWEEK4/MGWEEK4*100,3)+'%')+IIF(MSWEEK5=0,'    ',STR(MSWEEK5/MGWEEK5*100,3)+'%')+IIF(MSWEEK6=0,'    ',STR(MSWEEK6/MGWEEK6*100,3)+'%')+IIF(MSWEEK7=0,'    ',STR(MSWEEK7/MGWEEK7*100,3)+'%')+IIF(MSWEEK8=0,'    ',STR(MSWEEK8/MGWEEK8*100,3)+'%')
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MBAG=BAG
      MTOTAL = WEEK1+WEEK2+WEEK3+WEEK4+WEEK5+WEEK6+WEEK7+WEEK8
      @ MLINE, 0 SAY SUR_CODE+'-'+SH_CODE+' '+SHOP.SH_NAME+' '+IIF(MTOTAL=0,'     ',STR(MTOTAL,5))+'  '+IIF(WEEK1=0,'    ',STR(WEEK1,4))+IIF(WEEK2=0,'    ',STR(WEEK2,4))+IIF(WEEK3=0,'    ',STR(WEEK3,4))+IIF(WEEK4=0,'    ',STR(WEEK4,4))+IIF(WEEK5=0,'    ',STR(WEEK5,4))+IIF(WEEK6=0,'    ',STR(WEEK6,4))+IIF(WEEK7=0,'    ',STR(WEEK7,4))+IIF(WEEK8=0,'    ',STR(WEEK8,4))
      SKIP
      MLINE = MLINE+1
      IF MLINE>60
         EJECT
         MPAGE = MPAGE+1
         MLINE = 7
         @ 1, 0 SAY 'Route No: '+MR_CODE
         @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
         @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
         @ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MWS_DATE)+' '+'To:  '+DTOC(MS_DATE)
         @ 3, 0 SAY REPLICATE('-',77)
         @ 4, 0 SAY 'CODE  SHOP NAME                       TOTAL                   WEEKS'
         @ 5, 0 SAY '                                              '+MSR_NO1+' '+MSR_NO2+' '+MSR_NO3+' '+MSR_NO4+' '+MSR_NO5+' '+MSR_NO6+' '+MSR_NO7+' '+MSR_NO8
         @ 6, 0 SAY REPLICATE('-',77)
         @ MLINE, 0 SAY MS_CATEG+' Continued.......'
         MLINE = MLINE+2
      ENDIF
      STORE 0 TO MTOTAL
   ENDDO
   IF MLINE>57
      EJECT
      MPAGE = MPAGE+1
      MLINE = 7
      @ 1, 0 SAY 'Route No: '+MR_CODE
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MWS_DATE)+' '+'To:  '+DTOC(MS_DATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY 'CODE  SHOP NAME                       TOTAL                   WEEKS'
      @ 5, 0 SAY '                                              '+MSR_NO1+' '+MSR_NO2+' '+MSR_NO3+' '+MSR_NO4+' '+MSR_NO5+' '+MSR_NO6+' '+MSR_NO7+' '+MSR_NO8
      @ 6, 0 SAY REPLICATE('-',77)
      MLINE = MLINE+1
      @ MLINE, 0 SAY MS_CATEG+' Continued.......'
      MLINE = MLINE+1
   ENDIF
   DELETE ALL FOR BAG=MBAG
   SET ORDER TO Tmp
   GOTO TOP
   MBAG = 0
   STORE 0 TO MSWEEK1, MSWEEK2, MSWEEK3, MSWEEK4, MSWEEK5, MSWEEK6, MSWEEK7, MSWEEK8
   STORE 0 TO MTOTAL, MSTOTAL
   LOOP
ENDDO
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
MLINE = MLINE+1
@ MLINE, 65 SAY 'End Of Report'
EJECT
RETURN

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN

PROCEDURE SHWWEKPRO
PUSH KEY
DEFINE WINDOW SHWWEK FROM 5, 48 TO 20, 78 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWWEK
SELECT WEEK
SET ORDER TO Sr_No
ON KEY LABEL F2 
ON KEY LABEL ENTER DO SlcWekPro
BROWSE FIELDS SR_NO : 4 :H = ' ', WS_DATE :H = 'Start Date', WE_DATE :H = 'End Date' NOAPPEND NOEDIT NODELETE IN SHWWEK
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCWEKPRO
MSR_NO = SR_NO
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWWEK
ON KEY LABEL ENTER 
RETURN
* 
* 
* RBSTAND.FXP 
* ----------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
SELECT 2
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
SELECT 3
USE SHARED SRout ALIAS SROUT
SET ORDER TO SS_code DESCENDING
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf')
SELECT 4
USE SHARED Routes ALIAS ROUT
SELECT 5
USE SHARED RWS ALIAS RWS
TMP = SYS(3)
COPY TO (TMP+'.Dbf') STRUCTURE
SELECT 6
USE EXCLUSIVE (TMP)
SELECT 7
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
SELECT 8
USE EXCLUSIVE (TMP1)
MPS = SPACE(1)
MPAGE = 1
MLINE = 6
MCQ = SPACE(1)
MSS_DATE = DATE()
MES_DATE = DATE()
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MR_CODE = SPACE(3)
MS_CATEG = SPACE(2)
STORE 0 TO MBASKET, MSBASKET, MGBASKET
DEFINE WINDOW RBSTAND FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RBSTAND
SET CENTURY OFF
DO WHILE .T.
   @ 4, 10 SAY 'Press F1 to see Route List' COLOR W/N 
   ON KEY LABEL F1 DO ShwRotPro
   @ 2, 10 SAY 'Enter Route Code'
   @ 2, 30 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      RELEASE WINDOW RBSTAND
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 2, 30 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF FOUND()
      EXIT
   ELSE
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
   ENDIF
ENDDO
CLEAR
@ 1, 13 SAY 'Report in Processing'
@ 3, 13 SAY "Please Don't Distrub"
SELECT ROUT
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SELECT 8
SET FILTER TO R_CODE=MR_CODE
INDEX ON SUR_CODE+SH_CODE TAG SSU_CODE UNIQUE
SET ORDER TO SSU_Code
GOTO TOP
MSUR_CODE = SUR_CODE
MSH_CODE = SH_CODE
SELECT SALE
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
SET ORDER TO S_Date
GOTO TOP
MSS_DATE = S_DATE
GOTO BOTTOM
MES_DATE = S_DATE
SET FILTER TO BASKIT>0
SET ORDER TO SS_Code
GOTO TOP
DO WHILE .T.
   SEEK MSUR_CODE+MSH_CODE
   IF  .NOT. FOUND()
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      SELECT 8
      IF EOF()
         EXIT
      ENDIF
      SKIP
      MSUR_CODE = SUR_CODE
      MSH_CODE = SH_CODE
      SELECT SALE
      LOOP
   ENDIF
   DO WHILE SUR_CODE+SH_CODE=MSUR_CODE+MSH_CODE
      MBASKET = MBASKET+BASKIT
      SELECT SHOP
      IF RETAIL='N'
         MS_CATEG = 'WS'
      ELSE
         MS_CATEG = S_CATEG
      ENDIF
      SELECT SALE
      SKIP
   ENDDO
   DO SAVDATPRO
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MBASKET = 0
   MS_CATEG = SPACE(2)
   SELECT 8
   SKIP
   IF EOF()
      EXIT
   ENDIF
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   SELECT SALE
   LOOP
ENDDO
SELECT 6
GOTO TOP
DO WHILE  .NOT. EOF()
   IF S_CATEG='WS'
      REPLACE BAG WITH 1
      REPLACE DESC WITH 'Whole Sale'
   ENDIF
   IF S_CATEG='A'
      REPLACE BAG WITH 2
      REPLACE DESC WITH 'Category-A'
   ENDIF
   IF S_CATEG='B'
      REPLACE BAG WITH 3
      REPLACE DESC WITH 'Category-B'
   ENDIF
   IF S_CATEG='C'
      REPLACE BAG WITH 4
      REPLACE DESC WITH 'Category-C'
   ENDIF
   IF S_CATEG='C1'
      REPLACE BAG WITH 5
      REPLACE DESC WITH 'Category-C1'
   ENDIF
   IF S_CATEG='D'
      REPLACE BAG WITH 6
      REPLACE DESC WITH 'Category-D'
   ENDIF
   SKIP
ENDDO
CLEAR
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ELSE
   DO REPSCRPRO
ENDIF
RELEASE WINDOW RBSTAND
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE SAVDATPRO
SELECT 6
APPEND BLANK
REPLACE SUR_CODE WITH MSUR_CODE
REPLACE SH_CODE WITH MSH_CODE
REPLACE BASKET WITH MBASKET
REPLACE S_CATEG WITH MS_CATEG
FLUSH

PROCEDURE REPSCRPRO
DEFINE WINDOW SCR FROM INT((SROWS()-23)/2), INT((SCOLS()-80)/2) TO INT((SROWS()-23)/2)+23, INT((SCOLS()-80)/2)+79 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR N/W 
ACTIVATE WINDOW SAME SCR
MBAG = 0
MLINE = 6
SELECT 6
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON BAG TAG TMP
SET ORDER TO Tmp
GOTO TOP
@ 1, 0 SAY 'Route No: '+MR_CODE
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MSS_DATE)+' '+'To:  '+DTOC(MES_DATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE  SHOP NAME                               TOTAL BASKET'
@ 5, 0 SAY REPLICATE('-',77)
@ MLINE, 0 SAY 'Total Summary'
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   MGBASKET = MGBASKET+MSBASKET
   STORE 0 TO MSBASKET
   LOOP
ENDDO
@ MLINE, 14 SAY '  GRAND TOTAL BASKETS              '+IIF(MGBASKET=0,'     ',STR(MGBASKET,5))
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
STORE 0 TO MSBASKET
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 10 SAY '          '+MS_CATEG+'                  '+IIF(MSBASKET=0,'     ',STR(MSBASKET,5))
   STORE 0 TO MSBASKET
   LOOP
ENDDO
IF MLINE>5
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      RELEASE WINDOW SCR
      RETURN
   ENDIF
   MCQ = SPACE(1)
   @ 6, 0 CLEAR TO 20, 78
   MLINE = 6
ENDIF
STORE 0 TO MSBASKET
MBAG = 0
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   @ MLINE, 10 SAY '         '+MS_CATEG COLOR B/W 
   @ MLINE, 30 SAY ' Basket            '+IIF(MSBASKET=0,'     ',STR(MSBASKET,5))
   MLINE = MLINE+1
   @ MLINE, 10 SAY '         '+MS_CATEG COLOR B/W 
   @ MLINE, 30 SAY ' %                   '+IIF(MSBASKET=0,'      ',STR(MSBASKET/MGBASKET*100,3)+'%')
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MBAG=BAG
      @ MLINE, 0 SAY SUR_CODE+'-'+SH_CODE+' '+SHOP.SH_NAME+'              '+IIF(BASKET=0,'     ',STR(BASKET,3))
      SKIP
      MLINE = MLINE+1
      IF MLINE>20
         @ 21, 28 SAY 'Continue Or Quit C/Q'
         @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
         READ
         IF MCQ='Q'
            EXIT
         ENDIF
         MCQ = SPACE(1)
         @ 10, 0 CLEAR TO 20, 78
         MLINE = 9
      ENDIF
   ENDDO
   DELETE ALL FOR BAG=MBAG
   SET ORDER TO Tmp
   GOTO TOP
   MBAG = 0
   STORE 0 TO MSBASKET
   @ 21, 28 SAY 'Continue Or Quit C/Q'
   @ 21, 50 GET MCQ PICTURE '@!' VALID MCQ='C' .OR. MCQ='Q' ERROR 'Continue Or Quit (C/Q)'
   READ
   IF MCQ='Q'
      EXIT
   ENDIF
   MCQ = SPACE(1)
   @ 6, 0 CLEAR TO 20, 78
   MLINE = 6
   LOOP
ENDDO
RELEASE WINDOW SCR
RETURN

PROCEDURE REPPRTPRO
MBAG = 0
MLINE = 6
SELECT 6
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON BAG TAG TMP
SET ORDER TO Tmp
GOTO TOP
SET PRINTER ON
SET DEVICE TO PRINTER
@ 1, 0 SAY 'Route No: '+MR_CODE
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
@ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MSS_DATE)+' '+'To:  '+DTOC(MES_DATE)
@ 3, 0 SAY REPLICATE('-',77)
@ 4, 0 SAY 'CODE  SHOP NAME                               TOTAL BASKET'
@ 5, 0 SAY REPLICATE('-',77)
@ MLINE, 0 SAY 'Total Summary'
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   MGBASKET = MGBASKET+MSBASKET
   STORE 0 TO MSBASKET
   LOOP
ENDDO
@ MLINE, 14 SAY '  GRAND TOTAL BASKETS              '+IIF(MGBASKET=0,'     ',STR(MGBASKET,5))
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
STORE 0 TO MSBASKET
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 10 SAY '          '+MS_CATEG+'                  '+IIF(MSBASKET=0,'     ',STR(MSBASKET,5))
   STORE 0 TO MSBASKET
   LOOP
ENDDO
STORE 0 TO MSBASKET
MBAG = 0
GOTO TOP
DO WHILE  .NOT. EOF()
   MBAG = BAG
   MS_CATEG = DESC
   DO WHILE MBAG=BAG
      MSBASKET = MSBASKET+BASKET
      SKIP
   ENDDO
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+2
   @ MLINE, 10 SAY '         '+MS_CATEG+' Basket            '+IIF(MSBASKET=0,'     ',STR(MSBASKET,5))
   MLINE = MLINE+1
   @ MLINE, 10 SAY '         '+MS_CATEG+' %                   '+IIF(MSBASKET=0,'      ',STR(MSBASKET/MGBASKET*100,3)+'%')
   MLINE = MLINE+1
   @ MLINE, 0 SAY REPLICATE('-',77)
   MLINE = MLINE+1
   GOTO TOP
   DO WHILE MBAG=BAG
      @ MLINE, 0 SAY SUR_CODE+'-'+SH_CODE+' '+SHOP.SH_NAME+'              '+IIF(BASKET=0,'     ',STR(BASKET,3))
      SKIP
      MLINE = MLINE+1
      IF MLINE>60
         EJECT
         MPAGE = MPAGE+1
         MLINE = 6
         @ 1, 0 SAY 'Route No: '+MR_CODE
         @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
         @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
         @ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MSS_DATE)+' '+'To:  '+DTOC(MES_DATE)
         @ 3, 0 SAY REPLICATE('-',77)
         @ 4, 0 SAY 'CODE  SHOP NAME                               TOTAL BASKET'
         @ 5, 0 SAY REPLICATE('-',77)
         @ MLINE, 0 SAY MS_CATEG+' Continued.......'
         MLINE = MLINE+2
      ENDIF
   ENDDO
   IF MLINE>57
      EJECT
      MPAGE = MPAGE+1
      MLINE = 6
      @ 1, 0 SAY 'Route No: '+MR_CODE
      @ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
      @ 1, 67 SAY 'Page: '+STR(MPAGE,2) SIZE 1, 8, 0
      @ 2, 0 SAY 'Route '+ROUT.ROUTE+' '+SALEM.SA_NAME+'Report From: '+DTOC(MSS_DATE)+' '+'To:  '+DTOC(MES_DATE)
      @ 3, 0 SAY REPLICATE('-',77)
      @ 4, 0 SAY 'CODE  SHOP NAME                               TOTAL BASKET'
      @ 5, 0 SAY REPLICATE('-',77)
      @ MLINE, 0 SAY MS_CATEG+' Continued.......'
      MLINE = MLINE+2
   ENDIF
   DELETE ALL FOR BAG=MBAG
   SET ORDER TO Tmp
   GOTO TOP
   MBAG = 0
   STORE 0 TO MSBASKET
   LOOP
ENDDO
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',77)
MLINE = MLINE+1
@ MLINE, 65 SAY 'End Of Report'
EJECT

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
* 
* 
* D-SUND.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sunday ALIAS SUND
SELECT 2
USE SHARED Week ALIAS WEEK
MSR_NO = SPACE(3)
MDATE = CTOD('  /  /    ')
MYN = SPACE(1)
DEFINE WINDOW DSUND FROM INT((SROWS()-12)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-12)/2)+11, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'DELETION SUNDAY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME DSUND
DO WHILE .T.
   DO DSPHEDPRO
   MSR_NO = SPACE(3)
   MDATE = CTOD('  /  /    ')
   @ 8, 0 CLEAR TO 8, 65
   @ 8, 21 SAY 'Press F1 to see Sunday Dates'
   ON KEY LABEL F1 DO ShwSalPro
   SELECT SUND
   SET ORDER TO Sr_No
   @ 2, 25 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Serail No Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   IF MSR_NO='000'
      EXIT
   ENDIF
   @ 2, 25 SAY MSR_NO PICTURE '999'
   SEEK MSR_NO
   IF  .NOT. FOUND()
      WAIT WINDOW 'Serail Number Not Exist'
      LOOP
   ENDIF
   @ 6, 25 SAY DATE
   MDATE = DATE
   @ 8, 0 CLEAR TO 8, 65
   @ 8, 15 SAY 'Do You Want To Delete This Entry  ' GET MYN PICTURE 'YN' VALID MYN<>'YN' ERROR 'Yes / No Only'
   READ
   IF MYN='Y'
      DELETE
      SELECT WEEK
      SET ORDER TO WE_Date
      SEEK MDATE
      IF FOUND()
         REPLACE WE_DATE WITH WE_DATE-1
      ENDIF
   ENDIF
ENDDO
RELEASE WINDOW DSUND
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Enter Serail No'
@ 6, 1 SAY 'Enter Sunday Date'

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSUN FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWSUN
SELECT SUND
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcSunPro
BROWSE FIELDS SR_NO : 4 :H = ' ', DATE :H = 'Sunday Date' NOAPPEND NOEDIT NODELETE IN SHWSUN
DEACTIVATE WINDOW SHWSUN
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSUNPRO
MSR_NO = SR_NO
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWSUN
ON KEY LABEL ENTER 
RETURN
* 
* 
* R-SUND.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sunday ALIAS SUND
SET ORDER TO Sr_No
MPS = SPACE(1)
DEFINE WINDOW RSUND FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RSUND
@ 2, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 2, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
CLEAR
IF MPS='P'
   REPORT FORMAT r-sund.Frx TO PRINTER
ELSE
   REPORT FORMAT r-sund.Frx PREVIEW
ENDIF
RELEASE WINDOW RSUND
CLOSE DATABASES
DO OPENDBFS
RETURN
* 
* 
* SUNDAY.FXP 
* ---------- 
*
CLOSE DATABASES
SELECT 1
USE SHARED Sunday ALIAS SUND
SELECT 2
USE SHARED Week ALIAS WEEK
MSR_NO = SPACE(3)
MDATE = CTOD('  /  /    ')
MMDATE = CTOD('  /  /    ')
MDAY = SPACE(15)
DEFINE WINDOW SUNDAY FROM INT((SROWS()-12)/2), INT((SCOLS()-69)/2) TO INT((SROWS()-12)/2)+11, INT((SCOLS()-69)/2)+68 NOFLOAT NOCLOSE SHADOW TITLE 'SUNDAY ENTRY PROGRAMME' FOOTER 'DESIGNER :- MUHAMMAD USMAN' NOMINIMIZE PANEL COLOR SCHEME 1
ACTIVATE WINDOW SAME SUNDAY
DO WHILE .T.
   DO DSPHEDPRO
   MSR_NO = SPACE(3)
   MDATE = CTOD('  /  /    ')
   @ 8, 0 CLEAR TO 8, 65
   @ 8, 21 SAY 'Press F1 to see Sunday Dates'
   ON KEY LABEL F1 DO ShwSalPro
   SELECT SUND
   SET ORDER TO Sr_No
   @ 2, 25 GET MSR_NO PICTURE '@3K 999' VALID MSR_NO<>SPACE(3) ERROR 'Serail No Can Not Be Blank - Enter 0 to Exit'
   READ
   IF MSR_NO='0'
      EXIT
   ENDIF
   MCODLEN = LEN(LTRIM(RTRIM(MSR_NO)))
   MSR_NO = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MSR_NO))
   @ 2, 25 SAY MSR_NO PICTURE '999'
   SEEK MSR_NO
   IF FOUND()
      WAIT WINDOW 'Serail Number Already Exist'
      LOOP
   ENDIF
   @ 6, 25 GET MDATE PICTURE ('99/99/9999')
   READ
   IF MDATE=CTOD('  /  /    ')
      MSR_NO = SPACE(3)
      LOOP
   ENDIF
   SET ORDER TO Date
   SEEK MDATE
   IF FOUND()
      WAIT WINDOW 'Sunday Date Already Exist'
      LOOP
   ENDIF
   MDAY = CDOW(MDATE)
   IF MDAY<>'Sunday'
      WAIT WINDOW 'This Is Not Sunday Date'
      LOOP
   ENDIF
   DO SAVDATPRO
   MMDATE = MDATE-1
   SELECT WEEK
   SET ORDER TO WE_Date
   SEEK MMDATE
   IF FOUND()
      REPLACE WE_DATE WITH MDATE
   ENDIF
ENDDO
RELEASE WINDOW SUNDAY
CLOSE DATABASES
DO OPENDBFS
RETURN

PROCEDURE DSPHEDPRO
@ 2, 1 SAY 'Enter Serail No'
@ 6, 1 SAY 'Enter Sunday Date'

PROCEDURE SAVDATPRO
SELECT SUND
APPEND BLANK
REPLACE SR_NO WITH MSR_NO
REPLACE DATE WITH MDATE
FLUSH

PROCEDURE SHWSALPRO
PUSH KEY
DEFINE WINDOW SHWSUN FROM 5, 48 TO 20, 78 FOOTER '<Press Enter>' DOUBLE
ACTIVATE WINDOW SHWSUN
SELECT SUND
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcSunPro
BROWSE FIELDS SR_NO : 4 :H = ' ', DATE :H = 'Sunday Date' NOAPPEND NOEDIT NODELETE IN SHWSUN
DEACTIVATE WINDOW SHWSUN
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCSUNPRO
DEACTIVATE WINDOW SHWSUN
ON KEY LABEL ENTER 
RETURN
* 
* 
* C-FILE.FXP 
* ---------- 
*

***********************
PROCEDURE C_FILE
***********************

DEFINE WINDOW CFILE FROM INT((SROWS()-15)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-15)/1)+6, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME CFILE
CLEAR
@ 1, 10 SAY 'Checking The Database Files'
@ 3, 13 SAY "Please Don't Distrub"
IF FILE('Week.Dbf')=.F.
   CREATE DBF Week ( SR_NO C ( 3 ), WS_DATE D ( 8 ), WE_DATE D ( 8 ) )
ENDIF
IF FILE('Week.Cdx')=.F.
   USE EXCLUSIVE Week
   INDEX ON SR_NO TAG SR_NO
   INDEX ON WS_DATE TAG WS_DATE
   INDEX ON WE_DATE TAG WE_DATE
ENDIF
IF FILE('Shop.Dbf')=.F.
   CREATE DBF Shop ( SUR_CODE C ( 3 ), SH_CODE C ( 2 ), SH_NAME C ( 30 ), SH_ADD C ( 50 ), SH_CONTACT C ( 10 ), SH_PHONE C ( 15 ), C_CODE C ( 2 ), S_CATEG C ( 2 ), RETAIL C ( 1 ) )
ENDIF
IF FILE('Shop.Cdx')=.F.
   USE EXCLUSIVE Shop
   INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
   INDEX ON C_CODE TAG C_CODE
   INDEX ON SH_CODE TAG SH_CODE
ENDIF
IF FILE('Attend.Dbf')=.F.
   CREATE DBF Attend ( A_DATE D ( 8 ), R_CODE C ( 3 ) )
ENDIF
IF FILE('Attend.Cdx')=.F.
   USE EXCLUSIVE Attend
   INDEX ON DTOC(A_DATE)+R_CODE TAG AR
ENDIF
IF FILE('Sale.Dbf')=.F.
   CREATE DBF Sale ( S_DATE D ( 8 ), SA_CODE C ( 3 ), SA_NAME C ( 15 ), SUR_CODE C ( 3 ), SH_CODE C ( 2 ), SALE C ( 1 ), BASKIT N ( 2 ), BAG N ( 3 ), R_CODE C ( 3 ) )
ENDIF
IF FILE('Sale.Cdx')=.F.
   USE EXCLUSIVE Sale
   INDEX ON DTOC(S_DATE)+SUR_CODE+SH_CODE TAG DRSH
   INDEX ON SA_CODE TAG SA_CODE
   INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
   INDEX ON S_DATE TAG S_DATE
   INDEX ON SH_CODE TAG SH_CODE
   INDEX ON R_CODE TAG R_CODE
   INDEX ON DTOC(S_DATE)+R_CODE TAG SR_CODE
   INDEX ON SUR_CODE+SH_CODE+DTOC(S_DATE) TAG SSS_DATE
   INDEX ON SUR_CODE+SH_CODE+R_CODE TAG SSR_CODE
   INDEX ON R_CODE+SA_CODE TAG RS_CODE
ENDIF
IF FILE('RWS.Dbf')=.F.
   CREATE DBF RWS ( R_CODE C ( 3 ), SA_CODE C ( 3 ), RDATE D ( 8 ), BAG N ( 5 ), BASKET N ( 5 ), SALE N ( 5 ), VISIT N ( 5 ), VISITABLE N ( 4 ), SR_NO C ( 3 ), SUR_CODE C ( 3 ), SH_CODE C ( 2 ), S_CATEG C ( 2 ), S_DATE D ( 8 ), WEEK1 N ( 3 ), WEEK2 N ( 3 ), WEEK3 N ( 3 ), WEEK4 N ( 3 ), WEEK5 N ( 3 ), WEEK6 N ( 3 ), WEEK7 N ( 3 ), WEEK8 N ( 3 ), WSSALE N ( 4 ), CSALE N ( 4 ), DESC C ( 11 ) )
ENDIF
IF FILE('Routes.Dbf')=.F.
   CREATE DBF Routes ( R_CODE C ( 3 ), ROUTE C ( 20 ), RDESC C ( 60 ), T_SURV N ( 4 ), T_VISIT N ( 4 ), SA_CODE C ( 3 ), DAY C ( 15 ) )
ENDIF
IF FILE('Routes.Cdx')=.F.
   USE EXCLUSIVE Routes
   INDEX ON R_CODE TAG R_CODE
ENDIF
IF FILE('Salesmen.Dbf')=.F.
   CREATE DBF Salesmen ( SA_CODE C ( 3 ), SA_NAME C ( 15 ) )
ENDIF
IF FILE('Salesmen.Cdx')=.F.
   USE EXCLUSIVE Salesmen
   INDEX ON SA_CODE TAG SA_CODE
ENDIF
IF FILE('Sunday.Dbf')=.F.
   CREATE DBF Sunday ( SR_NO C ( 3 ), DATE D ( 8 ) )
ENDIF
IF FILE('Sunday.Cdx')=.F.
   USE EXCLUSIVE Sunday
   INDEX ON SR_NO TAG SR_NO
   INDEX ON DATE TAG DATE
ENDIF
IF FILE('Pass.Dbf')=.F.
   CREATE DBF Pass ( SR_NO N ( 1 ), PASS C ( 6 ) )
   USE EXCLUSIVE Pass
   APPEND BLANK
   REPLACE SR_NO WITH 1
   REPLACE PASS WITH ':>=53-'
   APPEND BLANK
   REPLACE SR_NO WITH 2
   REPLACE PASS WITH ':>=53-'
   APPEND BLANK
   REPLACE SR_NO WITH 3
   REPLACE PASS WITH ':>=53-'
   APPEND BLANK
   REPLACE SR_NO WITH 4
   REPLACE PASS WITH ':>=53-'
   APPEND BLANK
   REPLACE SR_NO WITH 5
   REPLACE PASS WITH ':>=53-'
   APPEND BLANK
   REPLACE SR_NO WITH 6
   REPLACE PASS WITH ':>=53-'
ENDIF
IF FILE('Pass.Cdx')=.F.
   USE EXCLUSIVE Pass
   INDEX ON SR_NO TAG SR_NO
ENDIF
IF FILE('Licen.Dbf')=.F.
   CREATE DBF Licen ( L_DATE D ( 8 ), OK C ( 1 ) )
ENDIF
IF FILE('Licen.Cdx')=.F.
   USE EXCLUSIVE Licen
   INDEX ON OK TAG OK DESCENDING
ENDIF
IF FILE('Holiday.Dbf')=.F.
   CREATE DBF Holiday ( H_DATE D ( 8 ), H_DESC C ( 20 ) )
ENDIF
IF FILE('Holiday.Cdx')=.F.
   USE EXCLUSIVE Holiday
   INDEX ON DTOC(H_DATE) TAG H_DATE
ENDIF
IF FILE('Day.Dbf')=.F.
   CREATE DBF Day ( DAY C ( 15 ), D_DATE D ( 8 ) )
ENDIF
IF FILE('Day.Cdx')=.F.
   USE EXCLUSIVE Day
   INDEX ON DAY TAG DAY
ENDIF
IF FILE('Categ.Dbf')=.F.
   CREATE DBF Categ ( C_CODE C ( 2 ), C_CATE C ( 20 ) )
ENDIF
IF FILE('Categ.Cdx')=.F.
   USE EXCLUSIVE Categ
   INDEX ON C_CODE TAG C_CODE
ENDIF
IF FILE('SRout.Dbf')=.F.
   CREATE DBF SRout ( SR_DATE D ( 8 ), SUR_CODE C ( 3 ), SH_CODE C ( 2 ), R_CODE C ( 3 ), SIGN C ( 1 ), SRNO N ( 4 ) )
ENDIF
IF FILE('SRout.Cdx')=.F.
   USE EXCLUSIVE SRout
   INDEX ON DTOC(SR_DATE)+SUR_CODE+SH_CODE+R_CODE TAG SSSR
   INDEX ON DTOC(SR_DATE)+SUR_CODE+SH_CODE TAG SSS
   INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
   INDEX ON SUR_CODE+SH_CODE TAG SSC_DESC DESCENDING
   INDEX ON SUR_CODE+SH_CODE+DTOC(SR_DATE) TAG SSSD DESCENDING
ENDIF
IF FILE('Unactiv.Dbf')=.F.
   CREATE DBF Unactiv ( R_CODE C ( 3 ), SUR_CODE C ( 3 ), SH_CODE C ( 2 ), WEEK N ( 3 ), SALE N ( 4 ) )
ENDIF
RELEASE WINDOW CFILE
CLOSE ALL
RETURN
***************************


* 
* 
* R-UNACTI.FXP 
* ------------ 
*
DEFINE WINDOW RUNACTI FROM INT((SROWS()-17)/1), INT((SCOLS()-68)/1) TO INT((SROWS()-17)/1)+9, INT((SCOLS()-68)/1)+50 NOFLOAT NOCLOSE SHADOW NOMINIMIZE PANEL COLOR R/G 
ACTIVATE WINDOW SAME RUNACTI
@ 3, 13 SAY 'Report in Processing'
@ 5, 13 SAY "Please Don't Distrub"
CLOSE DATABASES
SELECT 1
USE SHARED Sale ALIAS SALE
TMP = SYS(3)
COPY TO (TMP+'.Dbf')
SELECT 2
USE SHARED Week ALIAS WEEK
SELECT 3
USE SHARED SRout ALIAS SROUT
SET ORDER TO SSSD DESCENDING
TMP1 = SYS(3)
COPY TO (TMP1+'.Dbf')
SELECT 4
USE EXCLUSIVE (TMP) ALIAS TMP
SELECT 5
USE EXCLUSIVE (TMP1) ALIAS TMP1
INDEX ON SUR_CODE+SH_CODE TAG SS_CODE UNIQUE
SET ORDER TO SS_Code
SELECT 6
USE Unactiv
TMP2 = SYS(3)
COPY TO (TMP2+'.Dbf') STRUCTURE
TMP3 = SYS(3)
COPY TO (TMP3+'.Dbf') STRUCTURE
TMP4 = SYS(3)
COPY TO (TMP4+'.Dbf') STRUCTURE
SELECT 7
USE EXCLUSIVE (TMP2) ALIAS TMP2
INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
SELECT 8
USE EXCLUSIVE (TMP3) ALIAS TMP3
SELECT 9
USE EXCLUSIVE (TMP4) ALIAS TMP4
SELECT 10
USE SHARED Salesmen ALIAS SALEM
SET ORDER TO Sa_Code
SELECT 11
USE SHARED Routes ALIAS ROUT
SET RELATION TO SA_CODE INTO SALEM ADDITIVE
SELECT 12
USE SHARED Shop ALIAS SHOP
SET ORDER TO SS_Code
MPS = SPACE(1)
MPAGE = 1
MLINE = 0
MCQ = SPACE(1)
SR = 0
MS_DATE = DATE()
MWS_DATE = DATE()
MSWS_DATE = DATE()
MWE_DATE = DATE()
MSR_NO = SPACE(3)
MR_CODE = SPACE(3)
MSUR_CODE = SPACE(3)
MSH_CODE = SPACE(2)
MSALE = 0
MCOUNT = 0
MSCOUNT = 0
MCAVG = 0
MPAVG = 0
MAVG = 0
MREC = 0
STORE 0 TO MBAG1, MBAG2, MBAG3, MBAG4
SET CENTURY OFF
CLEAR
DO WHILE .T.
   @ 7, 10 SAY 'Press F1 to see Route List' COLOR W/N 
   ON KEY LABEL F1 DO ShwRotPro
   @ 2, 10 SAY 'Enter Route Code'
   @ 2, 30 GET MR_CODE PICTURE '@3K 999' VALID MR_CODE<>SPACE(3) ERROR 'Route Code Can Not Be Blank - Enter 0 to Exit'
   READ
   MCODLEN = LEN(LTRIM(RTRIM(MR_CODE)))
   MR_CODE = REPLICATE('0',3-MCODLEN)+LTRIM(RTRIM(MR_CODE))
   IF MR_CODE='000'
      RELEASE WINDOW RUNACTI
      CLOSE DATABASES
      DELETE FILE TMP+'.Dbf'
      DELETE FILE TMP+'.Cdx'
      DELETE FILE TMP1+'.Dbf'
      DELETE FILE TMP1+'.Cdx'
      DELETE FILE TMP2+'.Dbf'
      DELETE FILE TMP2+'.Cdx'
      DELETE FILE TMP3+'.Dbf'
      DELETE FILE TMP3+'.Cdx'
      DELETE FILE TMP4+'.Dbf'
      DELETE FILE TMP4+'.Cdx'
      DO OPENDBFS
      RETURN
   ENDIF
   @ 2, 30 SAY MR_CODE PICTURE '999'
   SELECT ROUT
   SET ORDER TO R_Code
   SEEK MR_CODE
   IF  .NOT. FOUND()
      WAIT WINDOW 'Route Code Not Exist'
      LOOP
      MR_CODE = SPACE(3)
   ELSE
      @ 4, 30 SAY ROUTE
      EXIT
   ENDIF
ENDDO
CLEAR
@ 3, 13 SAY 'Report in Processing'
@ 5, 13 SAY "Please Don't Distrub"
SELECT TMP
REPLACE R_CODE WITH '   ' ALL
SELECT TMP1
SET FILTER TO R_CODE=MR_CODE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   SELECT TMP
   REPLACE R_CODE WITH MR_CODE ALL FOR SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
   SELECT TMP1
   SKIP
ENDDO
SELECT TMP
SET FILTER TO R_CODE<>MR_CODE
DELETE ALL
PACK
SET FILTER TO
INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
INDEX ON S_DATE TAG S_DATE
SET ORDER TO S_Date
GOTO BOTTOM
MS_DATE = S_DATE
SELECT WEEK
GOTO TOP
DO WHILE WE_DATE<MS_DATE .AND. WE_DATE<>MS_DATE
   SKIP
ENDDO
MSR_NO = SR_NO
SELECT WEEK
SET ORDER TO Sr_No
SEEK MSR_NO
SKIP -1
MWE_DATE = WE_DATE
SKIP -4
MWS_DATE = WS_DATE
SELECT TMP
SET FILTER TO S_DATE>=MWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MR_CODE = R_CODE
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
      IF BAG>0
         MSALE = MSALE+1
      ENDIF
      SKIP
   ENDDO
   IF MSALE=0
      SELECT TMP2
      APPEND BLANK
      REPLACE R_CODE WITH MR_CODE
      REPLACE SUR_CODE WITH MSUR_CODE
      REPLACE SH_CODE WITH MSH_CODE
      REPLACE WEEK WITH 5
   ENDIF
   MR_CODE = SPACE(3)
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = 0
   SELECT TMP
ENDDO
SELECT WEEK
SKIP 1
MSWS_DATE = WS_DATE
SELECT TMP
SET FILTER TO S_DATE>=MSWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MR_CODE = R_CODE
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
      IF BAG>0
         MSALE = MSALE+1
      ENDIF
      SKIP
   ENDDO
   IF MSALE=0
      SELECT TMP2
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         APPEND BLANK
         REPLACE R_CODE WITH MR_CODE
         REPLACE SUR_CODE WITH MSUR_CODE
         REPLACE SH_CODE WITH MSH_CODE
         REPLACE WEEK WITH 4
      ENDIF
   ENDIF
   MR_CODE = SPACE(3)
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = 0
   SELECT TMP
ENDDO
SELECT WEEK
SKIP 1
MSWS_DATE = WS_DATE
SELECT TMP
SET FILTER TO S_DATE>=MSWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MR_CODE = R_CODE
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
      IF BAG>0
         MSALE = MSALE+1
      ENDIF
      SKIP
   ENDDO
   IF MSALE=0
      SELECT TMP2
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         APPEND BLANK
         REPLACE R_CODE WITH MR_CODE
         REPLACE SUR_CODE WITH MSUR_CODE
         REPLACE SH_CODE WITH MSH_CODE
         REPLACE WEEK WITH 3
      ENDIF
   ENDIF
   MR_CODE = SPACE(3)
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = 0
   SELECT TMP
ENDDO
SELECT WEEK
SKIP 1
MSWS_DATE = WS_DATE
SELECT TMP
SET FILTER TO S_DATE>=MSWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MR_CODE = R_CODE
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
      IF BAG>0
         MSALE = MSALE+1
      ENDIF
      SKIP
   ENDDO
   IF MSALE=0
      SELECT TMP2
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         APPEND BLANK
         REPLACE R_CODE WITH MR_CODE
         REPLACE SUR_CODE WITH MSUR_CODE
         REPLACE SH_CODE WITH MSH_CODE
         REPLACE WEEK WITH 2
      ENDIF
   ENDIF
   MR_CODE = SPACE(3)
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = 0
   SELECT TMP
ENDDO
SELECT WEEK
SKIP 1
MSWS_DATE = WS_DATE
SELECT TMP
SET FILTER TO S_DATE>=MSWS_DATE .AND. S_DATE<=MWE_DATE
SET ORDER TO SS_Code
GOTO TOP
DO WHILE  .NOT. EOF()
   MR_CODE = R_CODE
   MSUR_CODE = SUR_CODE
   MSH_CODE = SH_CODE
   DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
      IF BAG>0
         MSALE = MSALE+1
      ENDIF
      SKIP
   ENDDO
   IF MSALE=0
      SELECT TMP2
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF  .NOT. FOUND()
         APPEND BLANK
         REPLACE R_CODE WITH MR_CODE
         REPLACE SUR_CODE WITH MSUR_CODE
         REPLACE SH_CODE WITH MSH_CODE
         REPLACE WEEK WITH 1
      ENDIF
   ENDIF
   MR_CODE = SPACE(3)
   MSUR_CODE = SPACE(3)
   MSH_CODE = SPACE(2)
   MSALE = 0
   SELECT TMP
ENDDO
SELECT TMP2
SET ORDER TO
COUNT TO MSCOUNT
GOTO TOP
IF MSCOUNT>0
   MCOUNT = 0
   DO WHILE MCOUNT<10
      MR_CODE = SPACE(3)
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      MWEEK = 0
      MR_CODE = R_CODE
      MSUR_CODE = SUR_CODE
      MSH_CODE = SH_CODE
      MWEEK = WEEK
      SELECT TMP4
      APPEND BLANK
      REPLACE R_CODE WITH MR_CODE
      REPLACE SUR_CODE WITH MSUR_CODE
      REPLACE SH_CODE WITH MSH_CODE
      REPLACE WEEK WITH MWEEK
      SELECT TMP2
      SKIP
      IF EOF()
         EXIT
      ENDIF
      MCOUNT = MCOUNT+1
   ENDDO
ENDIF
SELECT TMP4
MSCOUNT = 0
COUNT TO MSCOUNT
IF MSCOUNT<10
   SELECT TMP
   SET FILTER TO BAG>0
   INDEX ON SUR_CODE+SH_CODE+DTOC(S_DATE) TAG SSDATE DESCENDING
   SET ORDER TO SSDate
   GOTO TOP
   DO WHILE  .NOT. EOF()
      MR_CODE = SPACE(3)
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      MR_CODE = R_CODE
      MSUR_CODE = SUR_CODE
      MSH_CODE = SH_CODE
      SELECT TMP2
      SET ORDER TO SS_Code
      SEEK MSUR_CODE+MSH_CODE
      IF FOUND()
         SELECT TMP
         DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
            SKIP
         ENDDO
         LOOP
      ENDIF
      SELECT TMP
      STORE 0 TO MBAG1, MBAG2, MBAG3, MBAG4
      MREC = 0
      DO WHILE SUR_CODE=MSUR_CODE .AND. SH_CODE=MSH_CODE
         MREC = MREC+1
         SKIP
      ENDDO
      IF MREC<4
         SELECT TMP3
         APPEND BLANK
         REPLACE R_CODE WITH MR_CODE
         REPLACE SUR_CODE WITH MSUR_CODE
         REPLACE SH_CODE WITH MSH_CODE
         REPLACE WEEK WITH MREC*100
         SELECT TMP
         LOOP
      ENDIF
      SELECT TMP
      SKIP -4
      MBAG1 = BAG
      SKIP
      MBAG2 = BAG
      SKIP
      MBAG3 = BAG
      SKIP
      MBAG4 = BAG
      SKIP
      MCAVG = 0
      MPAVG = 0
      MAVG = 0
      MCAVG = (MBAG1+MBAG2)/2
      MPAVG = (MBAG3+MBAG4)/2
      MAVG = MPAVG-MCAVG
      SELECT TMP3
      APPEND BLANK
      REPLACE R_CODE WITH MR_CODE
      REPLACE SUR_CODE WITH MSUR_CODE
      REPLACE SH_CODE WITH MSH_CODE
      REPLACE WEEK WITH MAVG
      SELECT TMP
   ENDDO
ENDIF
SELECT TMP3
INDEX ON WEEK TAG WEEK DESCENDING FOR WEEK>9
SET ORDER TO Week
GOTO TOP
SELECT TMP4
MSCOUNT = 0
COUNT TO MSCOUNT
IF MSCOUNT<10
   MCOUNT = 0
   MCOUNT = MSCOUNT
   SELECT TMP3
   DO WHILE MCOUNT<10
      MR_CODE = SPACE(3)
      MSUR_CODE = SPACE(3)
      MSH_CODE = SPACE(2)
      MWEEK = 0
      MR_CODE = R_CODE
      MSUR_CODE = SUR_CODE
      MSH_CODE = SH_CODE
      MWEEK = WEEK
      SELECT TMP4
      APPEND BLANK
      REPLACE R_CODE WITH MR_CODE
      REPLACE SUR_CODE WITH MSUR_CODE
      REPLACE SH_CODE WITH MSH_CODE
      REPLACE WEEK WITH MWEEK
      SELECT TMP3
      IF EOF()
         EXIT
      ENDIF
      SKIP
      MCOUNT = MCOUNT+1
   ENDDO
ENDIF
CLEAR
@ 4, 5 SAY 'Report To Printer Or Screen (P/S)' COLOR W/N 
@ 4, 40 GET MPS PICTURE '@!' VALID MPS='P' .OR. MPS='S' ERROR 'Printer Or Screen (P/S)' COLOR W/N 
READ
IF MPS='P'
   DO REPPRTPRO
ENDIF
RELEASE WINDOW RUNACTI
SET CENTURY ON
SET PRINTER OFF
SET DEVICE TO SCREEN
CLOSE DATABASES
DELETE FILE TMP+'.Dbf'
DELETE FILE TMP+'.Cdx'
DELETE FILE TMP1+'.Dbf'
DELETE FILE TMP1+'.Cdx'
DELETE FILE TMP2+'.Dbf'
DELETE FILE TMP2+'.Cdx'
DELETE FILE TMP3+'.Dbf'
DELETE FILE TMP3+'.Cdx'
DELETE FILE TMP4+'.Dbf'
DELETE FILE TMP4+'.Cdx'
DO OPENDBFS
RETURN

PROCEDURE REPPRTPRO
MLINE = 9
SELECT TMP4
SET FILTER TO SUR_CODE<>'   '
SET RELATION TO SUR_CODE+SH_CODE INTO SHOP ADDITIVE
INDEX ON SUR_CODE+SH_CODE TAG SS_CODE
SET ORDER TO SS_Code
GOTO TOP
SET PRINTER ON
SET DEVICE TO PRINTER
@ 1, 28 SAY 'ASIA SNACKS (PVT) LTD'
@ 2, 25 SAY 'Route No:          '+ROUT.R_CODE
@ 3, 25 SAY 'Route:             '+ROUT.ROUTE
@ 4, 25 SAY 'Salesmen Assigned: '+SALEM.SA_NAME
@ 5, 0 SAY REPLICATE('-',79)
@ 6, 0 SAY 'SR.NO  CODE     SHOP NAME                           REMARKS'
@ 7, 0 SAY REPLICATE('-',79)
DO WHILE  .NOT. EOF()
   SR = SR+1
   IF WEEK>99
      MWEEK = WEEK/100
   ENDIF
   @ MLINE, 2 SAY STR(SR,2)+'   '+SUR_CODE+'-'+SH_CODE+'  '+SHOP.SH_NAME+'  '+IIF(WEEK<6,'No sale in last '+STR(WEEK,1)+' weeks',IIF(WEEK>99,'Sale mate only '+STR(MWEEK,1)+' times todate',IIF(WEEK>9 .AND. WEEK<99,'Sale drop '+STR(WEEK,2)+' %','       ')))
   MLINE = MLINE+2
   SKIP
ENDDO
MLINE = MLINE+1
@ MLINE, 0 SAY REPLICATE('-',79)
MLINE = MLINE+1
@ MLINE, 65 SAY 'End Of Report'
EJECT
RETURN

PROCEDURE SHWROTPRO
PUSH KEY
DEFINE WINDOW SHWROT FROM 5, 45 TO 20, 75 FOOTER '<Press Enter To Select>' DOUBLE
ACTIVATE WINDOW SHWROT
SELECT ROUT
ON KEY LABEL F1 
ON KEY LABEL ENTER DO SlcDatPro
BROWSE FIELDS R_CODE : 5 :H = ' ', ROUTE :H = 'Route Name List' NOAPPEND NOEDIT NODELETE IN SHWROT
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
POP KEY
RETURN

PROCEDURE SLCDATPRO
MR_CODE = R_CODE
SHOW GETS
CLEAR GETS
DEACTIVATE WINDOW SHWROT
ON KEY LABEL ENTER 
RETURN
*
