<!--#include file="inc_header.asp" -->
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
                  <strong>Admin </strong>                      
					
					</div>
				 <div class="contact-details" align="right">
                     <p class="mail">
                      Hello   <%= Session("UserEmail")  %> at <%=Request.Cookies("Department") & " and " & Request.Cookies("SiteName")%>
                      <br>  <a href="logout.asp">Logout</a> 
					</p>
                           
                </div>
				<%IF Session("UserType") = "1" THEN%>
                  <a href="addEdituser.asp" class="dt-sc-button small read-more"> Add Edit User <span class="fa fa-chevron-circle-right"> </span></a>
				<a href="addEditsite.asp" class="dt-sc-button small read-more"> Add Edit Site <span class="fa fa-chevron-circle-right"> </span></a>
				<a href="addEditdept.asp" class="dt-sc-button small read-more"> Add Edit Department <span class="fa fa-chevron-circle-right"> </span></a>
				<a href="entryLog.asp" class="dt-sc-button small read-more"> Entry Login <span class="fa fa-chevron-circle-right"> </span></a>
				<%END IF %>
                   <form name="login" class="contact-form" method="post" >
				   
                        	<table width="75%"  border="0">
    <tr>
    <td><input name="fromDate" type="date" placeholder="From Date" required="yes" value="<%=Request.Form("fromDate")%>" > </td> 
	 <td><input name="toDate" type="date" placeholder="To Date" required="yes" value="<%=Request.Form("toDate")%>"> </td>
	<td >
	<% 
	IF SESSION("USerType") = "1" THEN 
	 	strSQL = "   SELECT SiteID,SiteName FROM [TC_Sites] WHERE Active = 1 ORDER BY SiteName "
	ELSE
		strSQL = "   SELECT   TC_Sites.SiteID, TC_Sites.SiteName FROM   TC_Sites INNER JOIN  TC_Users ON TC_Sites.SiteID = TC_Users.UserSiteID WHERE  (TC_Sites.Active = 1 and UserID = "&Session("UserID")&") ORDER BY TC_Sites.SiteName"
	END IF	
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
			
			
  
	<select name="SiteName" >
	<option value="">---Select Site---</option>
	<%  For i = 0 To Ubound(arrAvailable,2)%>
	<option value="<%=arrAvailable(0,i)%>"><%=arrAvailable(1,i)%></option>
	<%NEXT%>
	</select>
	</td>
	<td>
	<%
	IF SESSION("USerType") = "1" THEN 
	
 	strSQL = "  Select DeptID,DeptName FROM TC_Dept ORDER BY DeptName "
	ELSE
	
	strSQL = "  SELECT     DeptName, TC_Users.UserDeptID FROM  TC_Dept INNER JOIN   TC_Users ON TC_Dept.DeptID = TC_Users.UserDeptID WHERE UserID = "&Session("UserID")&"  ORDER BY DeptName "
	END IF
	Set rsCommon = CreateObject("ADODB.Recordset")
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				''rsCommon.close
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
	<select name="department">
	<option value="">---Select department---</option>
		<%  For i = 0 To Ubound(arrAvailable,2)%>
	<option value="<%=arrAvailable(0,i)%>"><%=arrAvailable(1,i)%></option>
	<%NEXT%>
	</select></td>
	<td><input name="txtUserCardID" type="text" Placeholder="Card ID" value="<%=Request.Form("txtUserCardID")%>" ></td>
  </tr>
  <tr>
    <td><select name="Sortby" required="yes"> <option value="">---Sort By---</option><option value="StartTime Desc">Date Desc</option> <option value="StartTime Asc">Date Asc</option> <option value="SiteName">Site Name</option></select></td> 
	 <td><select name="report" required="yes"> <option value="">---Select Report ---</option><option value="SiteActivity">Site Activity 
</option> <option>Dept Activity </option> <option>User Activity </option>
 <option value="TopUsers">Top Users </option>
</select></td>
	<td > </td>
	<td><input name="btnLogin" type="submit" formaction="admin.asp" id="btnLogin" class="dt-sc-button medium" value="Run Filter"></td>
	<td><input name="btnExportExcel" formaction="report.asp" type="submit" id="btnExportExcel" class="dt-sc-button medium" value="Export Excel">
     </td>
  </tr>
  
</table>
                       
  </form>
<%
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then				

						
	IF Request.Form("Report") = "TopUsers" THEN
		strSQL = " SELECT   TC_Sites.SiteName, TC_Dept.[DeptName ],  TC_TimeCollect.userCardID, 'N/A' AS DATE, 'N/A' As StartTime, 'N/A' AS EndTime, CAST(DATEADD(ms,SUM(DATEDIFF(ms, '00:00:00', CAST(TC_TimeCollect.TotalTime AS time))), '00:00:00') AS TIME) AS totalTime FROM TC_TimeCollect INNER JOIN TC_Sites ON "&_
 				 " TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID GROUP BY TC_TimeCollect.userCardID, TC_Sites.SiteName, TC_Dept.[DeptName ]"
	ELSE			   

 		strSQL = " SELECT TC_Sites.SiteName, TC_Dept.[DeptName ], TC_TimeCollect.userCardID, CAST(TC_TimeCollect.[date ] AS DATE), TC_TimeCollect.[StartTime ] , "&_
			 " TC_TimeCollect.EndTime, TC_TimeCollect.TotalTime FROM  TC_TimeCollect INNER JOIN TC_Sites ON TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN " &_
             " TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID WHERE DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"' "
			 
				IF Request.Form("Site")	<> "" THEN 
			strSQL = strSQL & " and  TC_Sites.SiteID = '"&Request.Form("Site")&"'"
		END IF
		
		IF Request.Form("department")	<> "" THEN 
			strSQL = strSQL & " and  TC_Dept.DeptID = '"&Request.Form("department")&"'"
		END IF
		
		
		IF Request.Form("txtUserCardID")	<> "" THEN 
			strSQL = strSQL & " and userCardID = '"&Request.Form("txtUserCardID")&"'"
		END IF
		
		strSQL = strSQL & " ORDER BY "&Request.Form("Sortby")&""	 
	END IF	

	
		
		Set rsCommon = CreateObject("ADODB.Recordset")
		rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				''set adoCon=nothing
				arrAvailable = arrAvailable(0,0)
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				''adoCon.close
				set rsCommon=nothing
				
				''set adoCon=nothing
			END IF
	Response.Write("<br><h1><strong>"&Response.Write(Request.form("Report"))&"</strong></h1>")		
	Response.Write("<Table border=1><TR><TD><B>Site Name</b></TD><TD><B>Dept Name</b></TD><TD><B>userCardID</b></TD><TD><B>Date</b></TD><TD><B>Start Time</b></TD><TD><B>End Time</b></TD><TD><B>Total Time</b></TD></TR>")
			
	 
    FOR i=0 TO Ubound(arrAvailable,2)
	
        Response.Write("<tr>")
		
        For  j=0 To UBOUND(arrAvailable,1)
		    Response.Write("<td>")
            Response.Write(arrAvailable(j,i))
            Response.Write("</td>")
			''Response.Write(j)
        NEXT
        Response.Write("</tr>")
     NEXT   
	  Response.Write("</table>")
		
			
END IF
						%>
						<table width="75%"  border="0">
						<TR><TD colspan="9">TimeCollect data</TD></TR>
  <tr>
    <td>Time CollectID</td>
    <td>Site Name</td>
    <td>Dept Name</td>
    <td>User Card ID</td>
    <td>Date</td>
    <td>Start Time</td>'
	<td>End Time</td>
	<td>Total Time</td>
	<TD>IP Address</TD>
  </tr>
  <%
  	'DIM arrAvailable
 	strSQL = "SELECT TimeCollectID, TC_Sites.SiteName, TC_Dept.[DeptName ],TC_TimeCollect.userCardID,TC_TimeCollect.[date ], TC_TimeCollect.[StartTime ], TC_TimeCollect.EndTime,"&_
			 " TC_TimeCollect.TotalTime, TC_TimeCollect.[IPaddress ]FROM   TC_TimeCollect INNER JOIN  TC_Sites ON TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN "&_
             " TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID ORDER BY date DESC "
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
	<td><%=rsCommon(7)%></td>
	<td><%=rsCommon(8)%></td>
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
