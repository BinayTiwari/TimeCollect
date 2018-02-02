<!--#include file="inc_header.asp" -->
<%

	DIM ErrorMessage
	IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then
		
		IF Request.Form("Update") <> "" THEN
	
			strSQL = " Update TC_Sites SET SiteName = '"&Request.Form("SiteName")&"',Active = '"&Request.Form("Active")&"'  WHERE SiteID = " &Request.Form("Update")
		ELSE
			strSQL = " INSERT INTO TC_Sites (Active,SiteName)  Values('"&Request.Form("Active")&"','"&Request.Form("SiteName")&"')"
	
		END IF
	
		adoCon.Execute(strSQL)
		Response.Redirect("addEditSite.asp")
			
	END IF	
IF Request.QueryString("ID") <> "" THEN
	strSQL = "Select SiteID,SiteName,Active FROM [TC_Sites]  WHERE SiteID = "&Request.QueryString("ID")
	updatevalue = Request.QueryString("ID")
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				''set adoCon=nothing
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				SiteID = arrAvailable(0,0)
				SiteName = arrAvailable(1,0)
				Active = arrAvailable(2,0)
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				'set adoCon=nothing
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
                    <a href="../index.html" title="Kids Life"><img src="../images/logo.png" alt="Kids Life" title="Kids Life"></a>
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
				<div class="contact-details">
                  <a href="admin.asp"> Admin</a> &raquo;&raquo;  <strong>  Add Edit Site</strong> 
					</div>
				 <div class="contact-details" align="right">
                     <p class="mail">
                      Hello   <%= Session("UserEmail")  %> at <%=Request.Cookies("Department") & " and " & Request.Cookies("SiteName")%>
                      <br>  <a href="logout.asp">Logout</a> 
					</p>
                           
                </div>
<form name="login" class="contact-form" method="post" action="addEditSite.asp">
					   <table width="75%"  border="0">
  <tr>
    <td>
	<input type="hidden" name="Update" type="text" value="<%=updatevalue%>">
	<input id="SiteName" name="SiteName" type="text" placeholder="Site Name" required="yes" value="<%=SiteName%>"></td>
	<td><select name="Active" required="Yes">
	<option value="">---Select ----</option>
	<option value="1" <%IF Active = 1 THEN%> selected <%END IF%>>Active</option>
	<option value="2" <%IF Active = 2 THEN%> selected <%END IF%>>Deleted</option>
	
	</select></td>
   </td>
     <td>        <input name="btnLogin" type="submit" id="btnLogin" class="dt-sc-button medium" value="Submit"></td>
  
   </tr>
 </table>

				       </form>
					   <div class="dt-sc-hr"></div>
				 <table width="75%"  border="0">
						 <tr>
    <td>SiteID</td>
    <td>Active</td>
    <td>Site Name</td>
    <td>Edit</td>
  </tr>
  <%
  	DIM arrAvailable
 	strSQL = "Select SiteID,SiteName,CASE WHEN Active = 1 THEN 'Yes' WHEN Active = 2 THEN 'No' END FROM [TC_Sites] ORDER BY SiteNAme"
	Set rsCommon = CreateObject("ADODB.Recordset")
    rsCommon.open strSQL,adoCon,3
						
	Dim PageLen,PageNo,TotalRecord,TotalPage,No,intID  
	PageLen = 10  
	PageNo = Request.QueryString("Page")  
	if PageNo = "" Then PageNo = 1  
		TotalRecord = rsCommon.RecordCount  
		rsCommon.PageSize = PageLen  
		TotalPage = rsCommon.PageCount  
		rsCommon.AbsolutePage = PageNo 
			%>
			
			<%  No=1  
				Do While Not rsCommon.EOF and No <= PageLen
		    %>

  <tr>
    <td><%=rsCommon(0)%></td>
    <td><%=rsCommon(2)%></td>
    <td><%=rsCommon(1)%></td>
	<td><a href="addeditsite.asp?id=<%=rsCommon(0)%>">Edit</a></td>
    </tr>
   <%  
	No = No + 1  
	rsCommon.MoveNext  
Loop %> 
 
 
</table>
<%Call Paging%>
                          
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
                        	<li class="facebook"><a href="#"><img src="../images/facebook.png" alt="" title=""></a></li>
                            <li class="twitter"><a href="#"><img src="../images/twitter.png" alt="" title=""></a></li>
                            <li class="gplus"><a href="#"><img src="../images/gplus.png" alt="" title=""></a></li>
                            <li class="pinterest"><a href="#"><img src="../images/pinterest.png" alt="" title=""></a></li>
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
    <script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/jquery-migrate.min.js"></script>

   
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/jquery-easing-1.3.js"></script>
    <script type="text/javascript" src="../js/jquery.sticky.js"></script>
    <script type="text/javascript" src="../js/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="../js/jquery.inview.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script type="text/javascript" src="../js/jquery.tipTip.minified.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider.min.js"></script>       
    <script type="text/javascript" src="../js/jquery.prettyPhoto.js"></script>  
    <script type="text/javascript" src="../js/twitter/jquery.tweet.min.js"></script>
    <script type="text/javascript" src="../js/jquery.parallax-1.1.3.js"></script>   
    <script type="text/javascript" src="../js/shortcodes.js"></script>   
    <script type="text/javascript" src="../js/custom.js"></script>
    
    <!-- Layer Slider --> 
    <script type="text/javascript" src="../js/jquery-transit-modified.js"></script> 
    <script type="text/javascript" src="../js/layerslider.kreaturamedia.jquery.js"></script> 
    <script type='text/javascript' src="../js/greensock.js"></script> 
    <script type='text/javascript' src="../js/layerslider.transitions.js"></script> 
    <!--<script type="text/javascript">var lsjQuery = jQuery;</script>--> 
    <script type="text/javascript">var lsjQuery = jQuery;</script><script type="text/javascript"> lsjQuery(document).ready(function() { if(typeof lsjQuery.fn.layerSlider == "undefined") { lsShowNotice('layerslider_1','jquery'); } else { lsjQuery("#layerslider_4").layerSlider({responsiveUnder: 1240, layersContainer: 1060, skinsPath: 'js/layerslider/skins/'}) } }); </script>
    
</body>
</html>
