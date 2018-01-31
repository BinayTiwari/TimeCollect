<!--#include file="inc_header.asp" -->
<%

DIM ErrorMessage
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	
IF Request.Form("Update") <> "" THEN
	
		strSQL = " Update TC_Users SET Active = '"&Request.Form("isActive")&"',UserType = '"&Request.Form("AdminType")&"' ,UserEmail = '"&Request.Form("txtUserName")&"',"&_
				 "  [UserPassword ] = '"&Request.Form("txtPassword")&"' ,UserSiteID = '"&Request.Form("Site")&"',UserDeptID =  '"&Request.Form("department")&"'  WHERE UserID = " &Request.Form("Update")
		
ELSE
	strSQL = " INSERT INTO TC_Users (Active,UserType,UserEmail,[UserPassword ],UserSiteID,UserDeptID)  Values('"&Request.Form("isActive")&"','"&Request.Form("AdminType")&"','"&Request.Form("txtUserName")&"','"&Request.Form("txtPassword")&"','"&Request.Form("Site")&"','"&Request.Form("department")&"')"
	
END IF
Response.Write(strSQL)
	adoCon.Execute(strSQL)
	Response.Redirect("addedituser.asp")
			
END IF	
IF Request.QueryString("ID") <> "" THEN
	strSQL = "SELECT Active,UserType,UserEmail,[UserPassword ],UserSiteID,UserDeptID FROM TC_Users WHERE UserID = "&Request.QueryString("ID")
	updatevalue = Request.QueryString("ID")
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				''set adoCon=nothing
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				Active = arrAvailable(0,0)
				UserType = arrAvailable(1,0)
				UserEmail = arrAvailable(2,0)
				UserPassword = arrAvailable(3,0)
				UserSiteID = arrAvailable(4,0)
				UserDeptID = arrAvailable(5,0)
				
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
                  
                   <a href="admin.asp"> Admin</a> &raquo;&raquo;  <strong> Add Edit User</strong>                       
					
					</div>
				 <div class="contact-details" align="right">
                     <p class="mail">
                      Hello   <%= Session("UserEmail")  %> at <%=Request.Cookies("Department") & " and " & Request.Cookies("SiteName")%>
                      <br>  <a href="logout.asp">Logout</a> 
					</p>
                           
                </div>
				       <form name="login" class="contact-form" method="post" action="addEdituser.asp">
					   <table width="75%"  border="0">
  <tr>
    <td><input id="name" name="txtUserName" type="text" placeholder="User Name" value="<%=UserEmail%>" required="yes"></td>
    <td><input id="name" name="txtPassword" type="text" placeholder="Password" value="<%=UserPassword%>" required="yes"> </td>
    <td><% 'DIM arrAvailable
 	strSQL = "   SELECT SiteID,SiteName FROM [TC_Sites] WHERE Active = 1 ORDER BY SiteName DESC"
	Set rsCommon = CreateObject("ADODB.Recordset")
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				'set adoCon=nothing
			END IF
			
			%>
			
			
  
	<select name="Site" required="yes">
	<option value="">---Select Site Name---</option>
	<%  For i = 0 To Ubound(arrAvailable,2)%>
	<option value="<%=arrAvailable(0,i)%>" <%IF arrAvailable(0,i) = UserSiteID THEN %>Selected <%END IF%>><%=arrAvailable(1,i)%></option>
	<%NEXT%>
	</select></td>
    <td> <%
 	strSQL = "  Select DeptID,DeptName FROM TC_Dept ORDER BY DeptName "
	Set rsCommon = CreateObject("ADODB.Recordset")
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				''set adoCon=nothing
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				''set adoCon=nothing
			END IF
			
			%>
	<select name="department" required="yes">
	<option value="">---Select Department Name---</option>
		<%  For i = 0 To Ubound(arrAvailable,2)%>
	<option value="<%=arrAvailable(0,i)%>" <%IF arrAvailable(0,i) = UserDeptID THEN %>Selected <%END IF%>><%=arrAvailable(1,i)%></option>
		<%NEXT%>
	</select></td>
  </tr>
  <tr>
    <td ><select name="AdminType" required="yes">
	<option value="">---Select User Type ----</option>
	<option value="1" <%IF UserType = 1 THEN%> selected <%END IF%>>Super Admin</option>
	<option value="2" <%IF UserType = 2 THEN%> selected <%END IF%>>Local Admin</option>
	<option value="3" <%IF UserType = 3 THEN%> selected <%END IF%>>User</option>
	</select></td>
    <td><select name="isActive" required="Yes">
	<option value="">---Select ----</option>
	<option value="1" <%IF Active = 1 THEN%> selected <%END IF%>>Active</option>
	<option value="2" <%IF Active = 2 THEN%> selected <%END IF%>>Deleted</option>
	
	</select></td>
    <td colspan="2">        <input name="btnLogin" type="submit" id="btnLogin" class="dt-sc-button medium" value="Submit">
	
<input type="hidden" name="Update" type="text" value="<%=updatevalue%>"></td>
    
  </tr>
</table>
				       </form>
					   <div class="dt-sc-hr"></div>
   <table width="75%"  border="0">
   				 
						 <tr>
    <td>userID</td>
    <td>Active</td>
    <td>User Type</td>
    <td>User Name</td>
	<td>User Password</td>
	<td>User Site</td>
	<td>User Dept</td>
	<td>Edit</td>
  </tr>
  <%
  	DIM arrAvailable
 	strSQL = " SELECT TC_Users.UserID,CASE WHEN TC_Users.Active = 1 THEN 'Yes' WHEN TC_Users.UserType = 2 THEN 'NO' END , CASE WHEN TC_Users.UserType = 1 THEN 'Super Admin' WHEN TC_Users.UserType = 2 THEN 'Local Admin' WHEN TC_Users.UserType = 3 THEN 'Users' END , TC_Users.UserEmail, TC_Users.[UserPassword ], TC_Sites.SiteName, "&_
			 " TC_Dept.[DeptName ] FROM  TC_Users INNER JOIN TC_Sites ON TC_Users.UserSiteID = TC_Sites.SiteID  INNER JOIN TC_Dept ON TC_Users.UserDeptID = TC_Dept.DeptID ORDER BY USEREmail"
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
    <td><%=rsCommon(1)%></td>
    <td><%=rsCommon(2)%></td>
	<td><%=rsCommon(3)%></td>
    <td><%=rsCommon(4)%></td>
    <td><%=rsCommon(5)%></td>
	<td><%=rsCommon(6)%></td>
	<td><a href="addedituser.asp?id=<%=rsCommon(0)%>">Edit</a></td>
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
