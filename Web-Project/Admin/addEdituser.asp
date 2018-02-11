<!--#include file="../CommonFile/inc_header.asp" -->
<%

DIM ErrorMessage
DIM UserExist : UserExist = 0
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	
	IF Request.Form("Update") <> "" THEN
	
		strSQL = " Update TC_Users SET Active = N'"&Request.Form("isActive")&"',UserType = '"&Request.Form("AdminType")&"' ,UserEmail = '"&Request.Form("txtUserName")&"',"&_
				 "  [UserPassword ] = N'"&Request.Form("txtPassword")&"' ,UserSiteID = '"&Request.Form("Site")&"',UserDeptID =  '"&Request.Form("department")&"'  WHERE UserID = " &Request.Form("Update")
		
	ELSE
	
	UserExist = IsUserExist(Request.Form("txtUserName"))
	IF UserExist = 1 THEN
		Response.Redirect("addedituser.asp?Message=1")
	END IF

	strSQL = " INSERT INTO TC_Users (Active,UserType,UserEmail,[UserPassword ],UserSiteID,UserDeptID)  Values('"&Request.Form("isActive")&"','"&Request.Form("AdminType")&"',N'"&Request.Form("txtUserName")&"',N'"&Request.Form("txtPassword")&"','"&Request.Form("Site")&"','"&Request.Form("department")&"')"
	
END IF

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
                    <a href="index.asp" title="איגוד הכירורגים בישראל"><img src="../images/logo.png" alt="איגוד הכירורגים בישראל" title="איגוד הכירורגים בישראל"></a>
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
					   <tr><td colspan="6"><%IF Request.QueryString("Message") <> "" Then Response.Write("User Already Exist") END IF%></td></tr>
  <tr>
    <td><input id="name" name="txtUserName" type="email" placeholder="User Name" value="<%=UserEmail%>" required></td>
    <td><input id="name" name="txtPassword" type="password" placeholder="Password" value="<%=UserPassword%>" required> </td>
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
	<option value="2" <%IF Active = 2 THEN%> selected <%END IF%>>Not Active</option>
	
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
<!--#include file="../CommonFile/inc_footer.asp" -->
