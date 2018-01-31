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

<title>ADMIN - Laparoscopic Trainer</title>

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

<%'//========validateFormOnSubmit=========================================%>

<%
'rsContactAdmin.PageSize = 50
'rsContactAdmin.CacheSize = rsContactAdmin.PageSize
'NumRows = 0
'CurrentPage = request("pageid")
'IF request("pageid") = "" Then  CurrentPage = 1 'start position
'IF request("pageid") <> "" Then  CurrentPage = Int(request("pageid"))
'IF NOT rsContactAdmin.EOF THEN rsContactAdmin.AbsolutePage = CurrentPage 'the ordinal position of current page 
''Session("sql") = strSQL

%>
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

           


<p>      <DIV>  <input class="fa-chevron-circle-right" name="reset" id="reset" type="reset" tabindex="19" value="        תחילת פעילות        " onClick="document.location='trainer.asp'" ></DIV>

   <table>
        <thead>
            <tr>
            <th>תאריך פעילות</th>
            <th>מס רופא</th>
            <th>שעת התחלה</th>
            <th>שעת סיום</th>
            <th>סה זמן פעילות</th>
            </tr>
        </thead>


       <tbody>
                       

<%
 
'response.Write(rsCat__MMColParam)
'response.End()


' 	rsCat__MMColParam = Request.QueryString("NAME")'
'	WHEREConCust= " WHERE NAME="& rsCat__MMColParam
 '		WHEREConCust = ""
	
'****take customerName********************************************************
MM_connMyPortal_STRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("MyPortalmachzorim.mdb")

	set rsContactAdmin = Server.CreateObject("ADODB.Recordset")
	rsContactAdmin.ActiveConnection = MM_connMyPortal_STRING
	rsContactAdmin.Source = "Select * FROM CONTACT ORDER BY MYDATE DESC"
	rsContactAdmin.CursorType = 1
	rsContactAdmin.CursorLocation = 3
	rsContactAdmin.LockType = 1
	rsContactAdmin.Open()

If Not rsContactAdmin.EOF Or Not rsContactAdmin.BOF Then
'While NOT rsContactAdmin.EOF
Do While Not rsContactAdmin.EOF 

'response.Write(rsContactAdmin.Fields.Item("MyDate").Value)
'response.End()

%>
<tr>
        <td>
        <%=rsContactAdmin("MyDate")%>
        </td>                  

        <td>
        <%=rsContactAdmin("NAME")%>
        </td>                  

        <td>
        <%=rsContactAdmin("TimeStart")%>
        </td>                  

        <td>
        <%=rsContactAdmin("TimeEnd")%>

        </td>             
<%
TotalTimeStart=rsContactAdmin("TimeStart")
TotalTimeEnd=rsContactAdmin("TimeEnd")

'TotalTime = SubtractTimes(TotalTimeStart, TotalTimeEnd)

TotalTimeH = DateDiff("h", [TotalTimeStart], [TotalTimeEnd])
TotalTimeM = DateDiff("n", [TotalTimeStart], [TotalTimeEnd])
TotalTimeS = DateDiff("s", [TotalTimeStart], [TotalTimeEnd])

TotalTime = TotalTimeH &":"&  TotalTimeM &":"&  TotalTimeS
%>                                  

        <td>
     <%=TotalTime%>
        </td>                  
 
</tr>

<%
rsContactAdmin.MoveNext 
Loop
%>
<%End If%>
        </tbody>
    </table> 


<table><tbody><tr><td>




<%
'rsContactAdmin.Close()
'rsContactAdmin.Close
%>

</div><!--end dt-sc-pr-tb-col green-->

</div>
<!--container ends-->

<%
'End If' IsEmpty(Flag) or Flag = "" or Flag = "0" 

'If Flag = 1 then

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
