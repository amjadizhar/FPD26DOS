

*aizprac1.prg


SET TALK OFF


frmMessage = CREATEOBJECT("FORM")
frmMessage.Caption = 'Test Form Amjad Izhar Parctice through Programming'
frmMessage.BackColor = RGB(95,120,154)

frmMessage.AddObject("txt1","TEXTBOX")
frmMessage.AddObject("txt2","TEXTBOX")
frmMessage.AddObject("cmdCommand1","cmdQuitBtn")


frmMessage.txt1.Top = 10
frmMessage.txt1.Visible = .t.
frmMessage.txt1.Enabled = .t.


frmMessage.txt2.Top = 50
frmMessage.txt2.Visible = .t.
frmMessage.txt2.Enabled = .t.

*frmMessage.cmdCommand1.Top = 200
*frmMessage.cmdCommand1.Left = 150
*frmMessage.cmdCommand1.Height = 30
*frmMessage.cmdCommand1.Caption = 'E\<xit'
frmMessage.cmdCommand1.Enabled = .t.
frmMessage.cmdCommand1.Visible = .t.


frmMessage.SHOW

READ EVENTS


DEFINE CLASS cmdQuitBtn AS CommandButton  && Create Command button
   Caption = '\<Quit'  && Caption on the Command button
   Cancel = .T.  && Default Cancel Command button (Esc)
   Left = 125  && Command button column
   Top = 210  && Command button row
   Height = 25  && Command button height

   PROCEDURE Click
      CLEAR EVENTS  && Stop event processing, close Form
		CANCEL
ENDDEFINE
