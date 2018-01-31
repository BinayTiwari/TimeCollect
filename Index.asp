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
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	
strSQL = "SELECT  TC_Users.UserEmail, TC_Dept.[DeptName ] AS Department, TC_Sites.SiteName,TC_Sites.SiteID,TC_Dept.DeptID FROM TC_Users INNER JOIN  TC_Dept ON TC_Users.UserDeptID = TC_Dept.DeptID INNER JOIN "&_
         " TC_Sites ON TC_Users.UserSiteID = TC_Sites.SiteID Where UserEmail = '"&Request.Form("txtEmail")&"' AND UserPassword  = '"&Request.Form("txtPassword")&"'"

IF(Request.Form("txtPassword") <> " " AND Request.Form("txtEmail") <> " ") THEN

		rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
			rsCommon.close
			adoCon.close
			set rsCommon=nothing
			set adoCon=nothing
			ErrorMessage = "Email-Id or password is wrong !!"
		ELSE
			Session("UserEmail") = rsCommon("UserEmail")
			
										Response.Cookies("Department") = rsCommon("Department")
										Response.Cookies("SiteName") = rsCommon("SiteName")
										Response.Cookies("DeptID") = rsCommon("DeptID")
										Response.Cookies("SiteID") = rsCommon("SiteID")
										Response.Cookies("Department").expires = Now() + 60
										Response.Cookies("SiteName").expires = Now() + 60
								
			Response.Redirect("start.asp")
		END IF	
ELSE
		ErrorMessage = "Email-Id or password is wrong !!"	
END IF
END IF

%>
 <script type="text/jscript">
function validateMyForm()
 { 
if (document.forms[0].txtUserName.value == '')
 { 
	document.forms[0].txtUserName.focus();
	alert('Please Enter your Email Address'); 
	return false; 
}
if (document.forms[0].txtPassword.value == '')
 { 
	alert('Please Enter Password'); 
	document.forms[0].txtPassword.focus();
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
                 <td width="50%"><div align="center"><strong><font color="#FF0000"><%=ErrorMessage%></font></strong></div></td>
               </tr>
           
      </tbody></table>
	  		<div class="forumcontent innercontainer">
<form method="post" action="index.asp" onsubmit="return validateMyForm();">
   <table style="width: 100%" class="Planeforumcontent innercontainer" >
        <tr>
            <td >
<table style="width: 100%">
        <tr>
            <td >
<table width="100%">
    <tr>
        <td  colspan="3">
           <strong>Email</strong></td>
        <td>
          <input name="txtEmail" value="<%= Request.Cookies("UsernameCookie") %>" type="text" Class="Formlong" />
        </td>
        <td>&nbsp;
            </td>
    </tr>
    <tr>
        <td class="style1" colspan="3">
            <strong>  Password</strong></td>
        <td>
             <input name="txtPassword" value="<%= Request.Cookies("PasswordCookie") %>" type="password" Class="Formlong" />
        </td>
        <td>&nbsp;
            </td>
    </tr>



    <tr>
      <td><input type="submit" name="btnLogin" value="Login" /></td>
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
