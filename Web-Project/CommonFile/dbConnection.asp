<%
Dim adoCon 			'Database Connection Variable Object
Dim strCon			'Holds the string to connect to the db
Dim rsCommon			'Holds the configuartion recordset
Dim strSQL			'Holds the SQL query for the database

strCon = "Provider=SQLOLEDB;Server=" & strSQLServerName & ";User ID=" & strSQLDBUserName & ";Password=" & strSQLDBPassword & ";Database=" & strSQLDBName & ";"
'Create a db connection odject
	Set adoCon = CreateObject("ADODB.Connection")
	
	'Set the connection string to the database
	adoCon.connectionstring = strCon
	
	'Set an active connection to the Connection object
	adoCon.Open
Set rsCommon = CreateObject("ADODB.Recordset")
%>