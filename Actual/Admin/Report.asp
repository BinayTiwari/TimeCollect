<!--#Include file="../CommonFile/Const.asp"-->
<!--#Include file="../CommonFile/dbConnection.asp"-->
<!--#Include file="../CommonFile/CommonFunction.asp"-->
<%

DIM arrAvailable

	IF Request.Form("Report") = "TopUsers" THEN
		strSQL = " SELECT   TC_Sites.SiteName, TC_Dept.[DeptName ],  TC_TimeCollect.userCardID, 'N/A' AS DATE, 'N/A' As StartTime, 'N/A' AS EndTime, CAST(DATEADD(ms,SUM(DATEDIFF(ms, '00:00:00', CAST(TC_TimeCollect.TotalTime AS time))), '00:00:00') AS TIME) AS totalTime FROM TC_TimeCollect INNER JOIN TC_Sites ON "&_
 				 " TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID GROUP BY TC_TimeCollect.userCardID, TC_Sites.SiteName, TC_Dept.[DeptName ]"
	ELSE			   

 		strSQL = " SELECT TC_Sites.SiteName, TC_Dept.[DeptName ], TC_TimeCollect.userCardID, CAST(TC_TimeCollect.[date ] AS DATE), TC_TimeCollect.[StartTime ] , "&_
			 " TC_TimeCollect.EndTime, TC_TimeCollect.TotalTime FROM  TC_TimeCollect INNER JOIN TC_Sites ON TC_TimeCollect.siteID = TC_Sites.SiteID INNER JOIN " &_
             " TC_Dept ON TC_TimeCollect.DeptID = TC_Dept.DeptID WHERE DATE BETWEEN '"&CDATE(Request.Form("fromDate"))&"' and '"&CDATE(Request.Form("toDate"))&"' "
	END IF	
		IF Request.Form("Site")	<> "" THEN 
			strSQL = strSQL & " and  SiteName = '"&Request.Form("Site")&"'"
		END IF
		
		IF Request.Form("department")	<> "" THEN 
			strSQL = strSQL & " and  DeptName = '"&Request.Form("department")&"'"
		END IF
		
		
		IF Request.Form("txtUserCardID")	<> "" THEN 
			strSQL = strSQL & " and userCardID = '"&Request.Form("txtUserCardID")&"'"
		END IF
		
		strSQL = strSQL & " ORDER BY "&Request.Form("Sortby")&""
		''Response.Write(strSQL)
				 
		rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
				arrAvailable = arrAvailable(0,0)
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
			END IF
			
			
			call writeXls (Request.Form("Report"), arrAvailable, columnCount)
			
%>