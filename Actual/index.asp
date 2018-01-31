<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en-gb" class="no-js"> <!--<![endif]-->
<head>
<meta http-equiv="content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
<title>Kids Life- Home</title>
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/shortcodes.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/shortcodes.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' id='layerslider-css' href="css/layerslider.css" type='text/css' media='all' />
<!--prettyPhoto-->
<link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" media="all" />   
<!--[if IE 7]>
<link href="css/font-awesome-ie7.css" rel="stylesheet" type="text/css">
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--Fonts-->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Bubblegum+Sans' rel='stylesheet' type='text/css'>
<!--jquery-->
<!--script src="js/modernizr-2.6.2.min.js"></script>-->
<!--#Include file="CommonFile/Const.asp"-->
<!--#Include file="CommonFile/dbConnection.asp"-->
<!--#Include file="CommonFile/CommonFunction.asp"-->

<%

DIM ErrorMessage
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	

strSQL = "SELECT TC_Users.UserID, TC_Users.UserEmail, TC_Dept.[DeptName ] AS Department, TC_Sites.SiteName,TC_Sites.SiteID,TC_Dept.DeptID ,TC_Users.UserType FROM TC_Users INNER JOIN  TC_Dept ON TC_Users.UserDeptID = TC_Dept.DeptID INNER JOIN "&_
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
			Session("UserType") = rsCommon("UserType")
			Session("UserEmail") = rsCommon("UserEmail")
			Session("UserID")  = rsCommon("UserID")
			Response.Write(rsCommon("UserID"))
	strSQL = "INSERT INTO TC_EntryLog VALUES(DATEADD(hh,2,getdate()),"&rsCommon("UserID")&","&rsCommon("SiteID")&",'"&Request.ServerVariables("REMOTE_ADDR")&"',"&rsCommon("DeptID")&")"
	adoCon.Execute(strSQL)
			
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

</head>
<body class="main">
	<!--wrapper starts-->
    <div class="wrapper">
        <!--header starts-->
        <header>
            <div class="container">
                <div class="logo">
                    <a href="index.html" title="Kids Life"><img src="images/logo.png" alt="Kids Life" title="Kids Life"></a>
                </div>
                <div class="contact-details">
                    <p class="mail">
                        <a href="#">contact@kidslife.com</a>
                        <span class="fa fa-envelope"></span>
					</p>
                    <p class="phone-no">
                        <i>+1 959 552 5963</i>
                        <span class="fa fa-phone"></span>
                	</p>        
                </div>
            </div>
            <!--menu-container starts-->
                        <!--menu-container ends-->
        </header>
        <!--header ends-->
        <!--main starts-->
        <div id="main">
        
         
            <!--primary starts-->
            <section id="primary" class="content-full-width">
                <!--container starts-->
                <div class="container">
                   <form name="login" class="contact-form" method="post" action="index.asp">
                        	
                            <p >
                                <input id="name" name="txtEmail" type="email" placeholder="User Name" autofocus required="yes">
                            </p>
                            <p >
                                <input id="email" name="txtPassword" type="password" placeholder="Password" required="yes">
                            </p>
                         
                            <p>
                                <input name="btnLogin" type="submit" id="btnLogin" class="dt-sc-button medium" value="Login">
                            </p>
                        </form>
                       
                    <!--front-portfolio-container ends-->
                    
                </div>
                <!--container ends-->
                
                <div class="dt-sc-hr"></div>
                <!--fullwidth-background starts-->
              
        <!--footer starts-->
        <footer>
            <!--footer-widgets-wrapper starts-->
            <div class="footer-widgets-wrapper">
                <!--container starts-->
                <div class="container">
                    
                </div>    
                <!--container ends-->
            </div>
            <!--footer-widgets-wrapper ends-->  
            <div class="copyright">
        		<div class="container">
                	<p class="copyright-info">© 2014 Kids Life. All rights reserved. Design by <a href="http://themeforest.net/user/designthemes" title=""> Buddhathemes </a></p>
        			<div class="footer-links">
                        <p>Follow us</p>
                        <ul class="dt-sc-social-icons">
                        	<li class="facebook"><a href="#"><img src="images/facebook.png" alt="" title=""></a></li>
                            <li class="twitter"><a href="#"><img src="images/twitter.png" alt="" title=""></a></li>
                            <li class="gplus"><a href="#"><img src="images/gplus.png" alt="" title=""></a></li>
                            <li class="pinterest"><a href="#"><img src="images/pinterest.png" alt="" title=""></a></li>
                        </ul>
                    </div>
        		</div>
        	</div>  
        </footer>
        <!--footer ends-->
        
    </div>
    <!--wrapper ends-->
    <a href="#" title="Go to Top" class="back-to-top">To Top ↑</a>
    <!--Java Scripts-->
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-migrate.min.js"></script>

   
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/jquery-easing-1.3.js"></script>
    <script type="text/javascript" src="js/jquery.sticky.js"></script>
    <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="js/jquery.inview.js"></script>
    <script type="text/javascript" src="js/validation.js"></script>
    <script type="text/javascript" src="js/jquery.tipTip.minified.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>       
    <script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>  
    <script type="text/javascript" src="js/twitter/jquery.tweet.min.js"></script>
    <script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>   
    <script type="text/javascript" src="js/shortcodes.js"></script>   
    <script type="text/javascript" src="js/custom.js"></script>
    
    <!-- Layer Slider --> 
    <script type="text/javascript" src="js/jquery-transit-modified.js"></script> 
    <script type="text/javascript" src="js/layerslider.kreaturamedia.jquery.js"></script> 
    <script type='text/javascript' src="js/greensock.js"></script> 
    <script type='text/javascript' src="js/layerslider.transitions.js"></script> 
    <!--<script type="text/javascript">var lsjQuery = jQuery;</script>--> 
    <script type="text/javascript">var lsjQuery = jQuery;</script><script type="text/javascript"> lsjQuery(document).ready(function() { if(typeof lsjQuery.fn.layerSlider == "undefined") { lsShowNotice('layerslider_1','jquery'); } else { lsjQuery("#layerslider_4").layerSlider({responsiveUnder: 1240, layersContainer: 1060, skinsPath: 'js/layerslider/skins/'}) } }); </script>
    
</body>
</html>
