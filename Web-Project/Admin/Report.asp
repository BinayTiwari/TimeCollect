<!--#include file="../CommonFile/inc_header.asp" -->
<%

DIM arrAvailable

						
	IF Request.Form("Report") = "TopUsers" THEN
	 	IF SESSION("USerType") = "1" THEN  
			strSQL = " SELECT   TC_Sites.SiteName, TC_Dept.[DeptName ],  TC_TimeCollect.userCardID, 'N/A' AS DATE, 'N/A' As StartTime, 'N/A' AS EndTime, CAST(DATEADD(ms,SUM(DATEDIFF(ms, '00:00:00', CAST(TC_TimeCollect.TotalTime AS time))), '00:00:00') AS TIME) AS totalTime FROM TC_TimeCollect  INNER JOIN TC_Sites ON "&_
 				 		" TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID GROUP BY TC_TimeCollect.userCardID, TC_Sites.SiteName, TC_Dept.[DeptName ],DATE,TC_Sites.SiteID,TC_Dept.DeptID HAVING DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"'"
		ELSE
			strSQL = " SELECT   TC_Sites.SiteName, TC_Dept.[DeptName ],  TC_TimeCollect.userCardID, 'N/A' AS DATE, 'N/A' As StartTime, 'N/A' AS EndTime, CAST(DATEADD(ms,SUM(DATEDIFF(ms, '00:00:00', CAST(TC_TimeCollect.TotalTime AS time))), '00:00:00') AS TIME) AS totalTime FROM TC_TimeCollect  INNER JOIN TC_Sites ON "&_
 				 " TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID  INNER JOIN "&_
                 " TC_Users ON TC_Dept.DeptID = TC_Users.UserDeptID AND TC_Sites.SiteID = TC_Users.UserSiteID GROUP BY TC_TimeCollect.userCardID, TC_Sites.SiteName, TC_Dept.[DeptName ],DATE,TC_Users.UserID,TC_Sites.SiteID,TC_Dept.DeptID HAVING DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"' and TC_Users.UserID ="&Session("UserID")&" "

		END IF
		
	ELSE			   

		 IF SESSION("USerType") = "1" THEN 
 			strSQL = " SELECT TC_Sites.SiteName, TC_Dept.[DeptName ], TC_TimeCollect.userCardID, CAST(TC_TimeCollect.[date ] AS DATE), TC_TimeCollect.[StartTime ] , "&_
			 " TC_TimeCollect.EndTime, TC_TimeCollect.TotalTime FROM  TC_TimeCollect INNER JOIN TC_Sites ON TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN " &_
             " TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID WHERE DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"' "
		ELSE
			strSQL = " SELECT TC_Sites.SiteName, TC_Dept.[DeptName ], TC_TimeCollect.userCardID, CAST(TC_TimeCollect.[date ] AS DATE), TC_TimeCollect.[StartTime ] , "&_
			 " TC_TimeCollect.EndTime, TC_TimeCollect.TotalTime FROM  TC_TimeCollect INNER JOIN TC_Sites ON TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN " &_
             " TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID INNER JOIN "&_
             " TC_Users ON TC_Dept.DeptID = TC_Users.UserDeptID AND TC_Sites.SiteID = TC_Users.UserSiteID WHERE DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"'  and TC_Users.UserID ="&Session("UserID")&" "
	
		END IF		 
	END IF	 
				IF Request.Form("SiteName")	<> "" THEN 
			strSQL = strSQL & " and  TC_Sites.SiteID = '"&Request.Form("SiteName")&"'"
		END IF
		
		IF Request.Form("department")	<> "" THEN 
			strSQL = strSQL & " and  TC_Dept.DeptID = '"&Request.Form("department")&"'"
		END IF
		
		
		IF Request.Form("txtUserCardID")	<> "" THEN 
			strSQL = strSQL & " and userCardID = '"&Request.Form("txtUserCardID")&"'"
		END IF
		
		IF Request.Form("Report") = "TopUsers" THEN
			strSQL = strSQL & " ORDER BY totalTime Desc"	 
		ELSE
			strSQL = strSQL & " ORDER BY "&Request.Form("Sortby")&""	
		END IF	
''Response.Write(strSQL)
		
		Response.Write("<H1>"&Request.Form("Report")& "Report</H1>")
				 
		rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
				arrAvailable = arrAvailable(0,0)
				Response.Write("No Record found!!")
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
				IF Request.Form("fromDate") <> "" THEN
				Response.Write("From Date :" & Request.Form("fromDate")&"<BR>")
			END IF
			IF Request.Form("toDate") <> "" THEN
				Response.Write("To Date :" & Request.Form("toDate")&"<BR>")
			END IF
			IF Request.Form("txtUserCardID") <> "" THEN
				Response.Write("User CardID :" & Request.Form("txtUserCardID")&"<BR>")
			END IF
			IF Request.Form("SiteName") <> "" THEN
				Response.Write("Site Name :" & arrAvailable(0,0)&"<BR>")
			Else
				Response.Write("Site Name : All Site" &"<BR>")
			END IF
			IF Request.Form("department") <> "" THEN
			
				Response.Write("department Name:" & arrAvailable(1,0)&"<BR>")
			Else
				Response.Write("Department Name : All Department" &"<BR>")
			END IF
					call writeXls (Request.Form("Report"), arrAvailable, columnCount)

			END IF
			
			
			
					
%>