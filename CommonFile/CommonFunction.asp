<%
function encrypt(inputstr)
        Dim i,x
        outputstr=""
        cc=0
        for i=1 to len(inputstr)
                x=asc(mid(inputstr,i,1))
                x=x-48
                if x<0 then x=x+255
                x=x+asc(mid(cryptkey,cc+1,1))
                if x>255 then x=x-255
                outputstr=outputstr&chr(x)
                cc=(cc+1) mod len(cryptkey)
        next
        encrypt=server.urlencode(replace(outputstr,"%","%25"))
end function

'**************************** DECRYPT FUNCTION ******************************

function decrypt(byval inputstr)
        Dim i,x
        inputstr=urldecode(inputstr)
        outputstr=""
        cc=0
        for i=1 to len(inputstr)
                x=asc(mid(inputstr,i,1))
                x=x-asc(mid(cryptkey,cc+1,1))
                if x<0 then x=x+255
                x=x+48
                if x>255 then x=x-255
                outputstr=outputstr&chr(x)
                cc=(cc+1) mod len(cryptkey)
        next
        decrypt=outputstr
end function

Function URLDecode(sConvert)
  Dim aSplit
  Dim sOutput
  Dim I
  If IsNull(sConvert) Then
         URLDecode = ""
         Exit Function
  End If
  'sOutput = REPLACE(sConvert, "+", " ") ' convert all pluses to spaces
  sOutput=sConvert
  aSplit = Split(sOutput, "%") ' next convert %hexdigits to the character
  If IsArray(aSplit) Then
        sOutput = aSplit(0)
        For I = 0 to UBound(aSplit) - 1
          sOutput = sOutput &  Chr("&H" & Left(aSplit(i + 1), 2)) & Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
        Next
  End If
  URLDecode = sOutput
End Function

Function writeXlsHttpHeaders(filename)

    Response.ContentType = "application/vnd.ms-excel"
    Response.Charset = "utf-8"
    Response.AddHeader "Content-Disposition", "attachment; filename="+filename+".xls"

END Function

Function IsUserExist(UserName)

strSQL = "SELECT UserEmail FROM TC_Users WHERE UserEmail = '"&UserName&"'" 
		rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				IsUserExist = 0
			
			ELSE
				IsUserExist = 1
				
				
			END IF
				
	
			
END FUNCTION

''SUB getXlsStart()
    
  ''  Response.Write("<html><BR>""<head><br> <meta http-equiv=\Content-Type\content=\text/html; charset=UTF-8\><br>"&_
   ''" <style type=\text/css\><br>   html, body, table {  margin: 0;<br>   padding: 0;<br>"&_
   ''"    font-size: 11pt; table, th, td { <br>  border: 0.1pt solid #D0D7E5;<br> border-collapse: collapse;<br>"&_
   ''"    border-spacing: 0;<br>}<br> </style><br></head><br><body>")
  
	
	
''END SUB

SUB getXlsEnd()

    Response.Write( "</table><br></body></html>")
	
END SUB

SUB writeXls(filename, data, columnCount)

    writeXlsHttpHeaders(filename)
    ''getXlsStart()
			
			Response.Write("<BR>")
			Response.Write("<Table border=1><TR><TD><b>Sno</b></TD><TD><B>Site Name</b></TD><TD><B>Dept Name</b></TD><TD><B>userCardID</b></TD><TD><B>Date</b></TD><TD><B>Start Time</b></TD><TD><B>End Time</b></TD><TD><B>Total Time</b></TD></TR>")
			
	 
    FOR i=0 TO Ubound(data,2)
	
        Response.Write("<tr>")
		Response.Write("<td>"&i+1&"</TD>")
        For  j=0 To UBOUND(data,1)
		    Response.Write("<td>")
            Response.Write(data(j,i))
            Response.Write("</td>")
			''Response.Write(j)
        NEXT
        Response.Write("</tr>")
     NEXT   
	  Response.Write("</table>")
    ''getXlsEnd()
	Response.End()
END SUB

SUB Paging

IF Cint(PageNo) >= 1 then %>  
<a href="<%=Request.ServerVariables("SCRIPT_NAME")%>?Page=1" class="dt-sc-button small read-more"><< First</a>  
<% End IF%>  
<% For intID = 1 To TotalPage%>  
<% if intID = Cint(PageNo) Then%>  
<b><%=intID%></b>  
<%Else%>  
<a href="<%=Request.ServerVariables("SCRIPT_NAME")%>?Page=<%=intID%>" class="dt-sc-button small read-more"><%=intID%></a>  
<%End IF%>  
<%Next%>  
<% IF Cint(PageNo) < TotalPage Then %>  
<a href="<%=Request.ServerVariables("SCRIPT_NAME")%>?Page=<%=TotalPage%>" class="dt-sc-button small read-more">Last >></a>  
<% End IF  
rsCommon.Close()  
adoCon.Close()  
Set rsCommon = Nothing  
Set adoCon = Nothing  

END SUB
%>