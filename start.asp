<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="CONTENT-LANGUAGE" content="hebrew">
<meta http-equiv="Expires" content="Wed, 14 Sep 2020 00:00:01 CST">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/shortcodes.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" media="all" />   
<link href="css/notosanshebrew.css" rel="stylesheet" type="text/css">
<link href="css/opensanshebrew.css" rel="stylesheet" type="text/css">

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel='index' title='מחזורים' href='http://www.machzorim.com/' />
<link rel="alternate" type="application/rss+xml" title="RSS Feed - " href="rss/" />
<link rel="alternate" type="application/atom+xml" title="ATOM Feed - " href="rss/" />
<link rel="alternate" href="index.html" hreflang="he-il" />

<title>Laparoscopic Trainer</title>
<title><%=loginPageTitle%></title>

<!--#Include file="CommonFile/Const.asp"-->
<!--#Include file="CommonFile/dbConnection.asp"-->
<!--#Include file="CommonFile/CommonFunction.asp"-->

<%

DIM ErrorMessage
DIM PlaceHolder
PlaceHolder = "Please pass your Magnetic card"
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	
	strSQL = "INSERT INTO TC_TimeCollect ([SiteID],[DeptID],[UserCardID],[date ],[StartTime ]) Values("&Request.Cookies("SiteID")&","&Request.Cookies("DeptID")&","&Request.Form("txtMagneticCard")&",getdate(),getdate())"
	IF(Request.Form("txtMagneticCard") <> " ") THEN

		adoCon.Execute(strSQL)
		ErrorMessage = "Thank you – now please start your activity. Return to this screen at the end"
		PlaceHolder = "Please pass your Magnetic card at the end of your activity "
		
	END IF	
END IF

%>
 <script type="text/jscript">
function validateMyForm()
 { 
if (document.forms[0].txtMagneticCard.value == '')
 { 
	document.forms[0].txtMagneticCard.focus();
	alert('Please Enter your Magnetic Card'); 
	return false; 
}
return true
}
</script>
<link href="CSS/Site.css" rel="stylesheet" type="text/css" />
<body>


<table border="0" class="innercontainer">
   <tbody>
               <tr>
                 <td width="50%"><div align="center"><strong><font color="#FF0000"><%="Site Name  : " & Request.Cookies("SiteName")%></font></strong></div></td>
               </tr>
			   <tr>
                 <td width="50%"><div align="center"><strong><font color="#FF0000"><%="Department Name :" & Request.Cookies("Department") %></font></strong></div></td>
               </tr>
           
      </tbody></table>
	  		<div class="forumcontent innercontainer">
<form method="post" action="start.asp" onsubmit="return validateMyForm();">
   <table style="width: 100%" class="Planeforumcontent innercontainer" >
        <tr>
            <td >
<table style="width: 100%">
        <tr>
            <td >
<table width="100%">
 <tr>
        <td>
         <%=ErrorMessage%>
        </td>
        <td>&nbsp;
            </td>
    </tr>
    <tr>
        <td>
          <input name="txtMagneticCard" placeholder ="<%=PlaceHolder%>" value="" type="text" Class="Formlong" />
        </td>
        <td>&nbsp;
            </td>
    </tr>



    <tr>
      <td><input type="submit" name="btnLogin" value="Submit" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>


</table>
      </td>
        </tr>
    </table>
            </td>
        </tr>
    </table>
</form>
   </div>
</body>
</html>
