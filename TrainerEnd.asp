<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="he-IL" prefix="og: http://ogp.me/ns#" xmlns="http://www.w3.org/1999/xhtml"  xmlns:fb="http://www.facebook.com/2008/fbml" >
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<!--<![endif]-->
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

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->


<!--Share Google+-->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!--Share Facebook-->

<!--[if IE 7]>
<link href="http://www.machzorim.com/css/font-awesome-ie7.css" rel="stylesheet" type="text/css">
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->


</head>

<body dir="rtl">
<div id="fb-root"></div>


<script type="text/javascript">
    if (location.href.indexOf("#subscribethanks") != -1) {
         alert('ההרשמה התקבלה בהצלחה.  תודה')
window.opener.location.href='index.html';
window.close();    
}
    if (location.href.indexOf("#exisst") != -1) {
         alert('המנוי כבר קיים במערכת.  תודה')
window.opener.location.href='index.html';
window.close();    
}
</script>

	<!--wrapper starts-->
    <div class="wrapper">
        <!--header starts-->

        <!--header ends-->


        <!--main starts-->
        <div id="main">
        	<!--breadcrumb-section starts-->

            <!--breadcrumb-section ends-->


            <!--container starts-->
            <div class="container">
            	<!--primary starts-->
            	<section id="primary" class="content-full-width">
                 
                	<div class="content-full-width">
                    	<article class="blog-entry">


<p>

<%'**************************************************************************************%>
<%
MM_connMyPortal_STRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("MyPortalmachzorim.mdb")
Flag = request.form("Flag")
 
		Session("name") = Request("name")
		Session("MYDATE") = now()


'response.Write(GMT)

If IsEmpty(Flag) or Flag = "" or Flag = "0" then
%>

<%'//========validateFormOnSubmit=========================================%>
	<script language="javascript">
	function ValidateForm(){
	    var strErr;
 	    strErr="";

			document.CONTACT.logo.style.background = 'white'; 


		if (document.CONTACT.name.value == ""){
			strErr = strErr + "יש להעביר כרטיס רופא\n\n";
			document.CONTACT.name.style.background = 'Yellow'; 
	    }



		if(strErr==""){
			 document.CONTACT.submit()
			 
	    }else{
			alert(strErr);
 	    }
	}

</script>
<!--container starts-->
<div class="container"> 
<div class="dt-sc-pr-tb-col green">
    <div class="dt-sc-tb-header">
        <div class="dt-sc-tb-title">
				<%if request("msg")<>"" then%>
                   <div class="dt-sc-info-box"><p><%=request("msg")%></p></div>
                <%end if%>     
        </div>




    </div>
    <form action="<%=nameofform%>" method="post" name="CONTACT" id="CONTACT" onSubmit="return defaultagree(this)" class="admission-form">
    <ul class="dt-sc-tb-content">

                <li><img src="LOGO.png" alt="LOGO.png"></li>                        
                        
        <li>
<p class="dt-sc-one"><input id="name" name="name" type="text" placeholder="לסיום פעילות-העבר כרטיס רופא" required="" tabindex="16" value="<%Session("name")%>" autofocus></p>
        <input class="fa fa-chevron-circle-right" hidden="true" name="submit1" id="submit1" type="submit" tabindex="19" value="        שלח        " onClick="ValidateForm()">
        <%'FormatDateTime(MyStartTime,4)%>
        <%'response.write(MyStartTime)%>
        <%'response.write Now()+2%>
        </li>
                               
        <input type="hidden" name="Flag" value=1>

        <div id="ajax_admission_msg"> </div>

        </p>

    </ul>
    </form>

</div><!--end dt-sc-pr-tb-col green-->

</div>
<!--container ends-->

<%
End If' IsEmpty(Flag) or Flag = "" or Flag = "0" 

If Flag = 1 then


'****גמר משלוח ללקוח*********************

'*** Add this Mail To Database
'connMail =  "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=D:\HostingSpaces\dandush.net\dandush.net\data\blogush\machzorim\MyPortalmachzorim.mdb;"
GMT = DateAdd("h", +2, Now)
MyStartTime=FormatDateTime(GMT,3)'hour(Time())+2 &":"& minute(Time()) &":"& second(Time())
MyNewMANE=Request("name")
'response.Write(MyNewMANE)
'response.End()


	set rsContact = Server.CreateObject("ADODB.Recordset")
'	rsContact.ActiveConnection = connMail
	rsContact.ActiveConnection = MM_connMyPortal_STRING
	rsContact.Source = "Select * FROM CONTACT where NAME = '" & MyNewMANE &"'" & " ORDER BY MyDate DESC"
	rsContact.CursorType = 0
	rsContact.CursorLocation = 2
	rsContact.LockType = 3
	rsContact.Open()

	'rsContact.AddNew'    
		'rsContact("SUBJECT") = "סיום פעילות"
		'rsContact("NAME") = Request("name")
		rsContact("TimeEnd") = MyStartTime'Hour(now())
	rsContact.Update
	rsContact.Close 
	rsContact.ActiveConnection.Close ' Close Connection
	Set rsContact = Nothing
'==END Add this Mail To Database=====================================


Response.Redirect("trainer.asp?msg=לתרגול העבר כרטיס רופא")  
End If'Flag = 1 


'**********************************************************
%>







                        </article>
                	</div>
                    
                  
                </section>
                <!--primary ends-->
            </div>
            <!--container ends-->
        </div>
        <!--main ends-->
        
        
        
        <!--footer starts-->

        <!--footer ends-->
        
    
    <!--wrapper ends-->

<!--jquery-->
<script type="text/javascript">function openWin(url) {myWindow = window.open(url, "myWindow", "toolbar=no, scrollbars=no, resizable=no, top=500, left=500,width=500, height=500");}</script>



    <!--Java Scripts-->
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
    
	<script type="text/javascript" src="js/jquery.tabs.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/jquery-easing-1.3.js"></script>
    <script type="text/javascript" src="js/jquery.sticky.js"></script>
    <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="js/jquery.inview.js"></script>
    
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript" src="js/jquery.tipTip.minified.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>    
    <script type="text/javascript" src="js/twitter/jquery.tweet.min.js"></script>
    <script type="text/javascript" src="js/shortcodes.js"></script>        
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/jquery.scrollbox.js"></script>



</body>
</html>
