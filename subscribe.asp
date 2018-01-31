<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<head>
<meta http-equiv="content-Type" content="text/html; charset=utf-8">
<meta http-equiv="CONTENT-LANGUAGE" content="hebrew">
</head>
<%
MM_connMyPortal_STRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("MyPortalmachzorim.mdb")

EmailToSub=trim(request("email"))

strSMTPServerAddress = "smtp.WebSiteLive.net"'"mail.mybabysitter.co.il"
strSmtpServerUsername = "info@machzorim.com"'"mail@mybabysitter.co.il"
strSmtpServerPassword = "Mz@2016zA"'"Z1A2!a@r#ad12311"
strPageTitle="מחזורים"



Set rsMailingList = Server.CreateObject("ADODB.Recordset")
rsMailingList.ActiveConnection = MM_connMyPortal_STRING
rsMailingList.Source = "SELECT * FROM MAILINGLIST"
rsMailingList.CursorType = 3
rsMailingList.CursorLocation = 2
rsMailingList.LockType = 1
rsMailingList.Open()

session("message")=""
flag="notfound"


do until rsMailingList.eof
      if rsMailingList("U_EMAIL")=EmailToSub then
       flag="found"
       end if
      rsMailingList.movenext
loop  

 
if request.form("action")="subscribe" then
   if flag="notfound" then

 	MM_editConnection = MM_connMyPortal_STRING
	MM_editQuery =  "insert into MAILINGLIST (U_EMAIL,U_DATED,U_ACCESS) values('" & EmailToSub & "','" &  day(date())&"/"&month(date())&"/"&year(date())  & "','Subscriber')"

    ' execute the insert
    Set MM_editCmd = Server.CreateObject("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_editConnection
    MM_editCmd.CommandText = MM_editQuery
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close


	'JMail (v4.3)
	Function MYJMail(fromName, fromEmail, toEmail, subject, body)
	 
		Set objJMail = Server.CreateObject("JMail.SMTPMail")
		objJMail.Silent = True
		objJMail.Charset = "utf-8"
		objJMail.ServerAddress = "smtp.WebSiteLive.net"
		objJMail.Sender = fromEmail
		objJMail.SenderName = fromName
		objJMail.AddRecipient toEmail
		'objJMail.AddRecipientBCC CON_SAmail
		objJMail.Subject = subject
		objJMail.HTMLBody = body
		objJMail.Priority = 3 
		objJMail.Execute
		Set objJMail = Nothing
	
	end Function



	Dim strBody 
 			strBody = ""
			strBody = strBody & "<!DOCTYPE HTML PUBLIC""-//IETF//DTD HTML//HE"">" & VbCrLf
			strBody = strBody & "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html;charset=utf-8"">" & VbCrLf
			strBody = strBody & "<html>" & VbCrLf
			strBody = strBody & "<head>" & VbCrLf
			strBody = strBody & "</head>" & VbCrLf
			strBody = strBody & "<body dir=""rtl"">" & VbCrLf
			strBody = strBody & "<table width=""420"" style=""border:1px solid #C7D9E4; font:Arial 12px #C7D9E4"">" & VbCrLf
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "<td colspan=2 style=""border:1px solid #C7D9E4""><b>בקשה חדשה למדריך מאתר מחזורים</b></td>" & VbCrLf
			strBody = strBody & "</tr>" & VbCrLf
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "<td><table width=""485"" border=""0"">"
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "<td width=""120""><b>כתובתו : </b></td>" & VbCrLf
			strBody = strBody & "<td width=""120"">" & EmailToSub & "</td>" & VbCrLf
			strBody = strBody & "<td width=""5""></td>" & VbCrLf
			strBody = strBody & "<td width=""120""><b> </b></td>" & VbCrLf
			strBody = strBody & "<td width=""120""> </td>" & VbCrLf
			strBody = strBody & "</tr>" & VbCrLf
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "<td width=""120""><b>זמן הפנייה: </b></td>" & VbCrLf
			strBody = strBody & "<td align=""left"" valign=""top"">"&now()+2&"</td>" & VbCrLf
			strBody = strBody & "</tr>" & VbCrLf
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "<td width=""120""><b>נשלח מעמוד : </b></td>" & VbCrLf
			strBody = strBody & "<td align=""left"" valign=""top"">" & right(Request.ServerVariables("SCRIPT_NAME"),23) & "</td>" & VbCrLf
			strBody = strBody & "</tr>" & VbCrLf
			strBody = strBody & "<tr>" & VbCrLf
			strBody = strBody & "</table>" & VbCrLf
			strBody = strBody & "</body>" & VbCrLf
			strBody = strBody & "</html>" & VbCrLf


			call MYJMail(" אתר מחזורים ", "info@machzorim.com", "info@machzorim.com", "בקשה חדשה למדריך מאתר מחזורים", strBody)

			response.redirect ("index.html#subscribethanks")
end if'notfound

response.redirect ("index.html#exisst")
end if
%>

