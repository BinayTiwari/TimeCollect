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

%>