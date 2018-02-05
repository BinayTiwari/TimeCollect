<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE HTML>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="he" class="no-js"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
<title>Kids Life- Home</title>
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link href="../style.css" rel="stylesheet" type="text/css">
<link href="../css/shortcodes.css" rel="stylesheet" type="text/css">
<link href="../css/responsive.css" rel="stylesheet" type="text/css">
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../css/shortcodes.css" rel="stylesheet" type="text/css">
<link rel='stylesheet' id='layerslider-css' href="../css/layerslider.css" type='text/css' media='all' />
<!--prettyPhoto-->
<link href="../css/prettyPhoto.css" rel="stylesheet" type="text/css" media="all" />   
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
<!--#Include file="../CommonFile/Const.asp"-->
<!--#Include file="../CommonFile/dbConnection.asp"-->
<!--#Include file="../CommonFile/CommonFunction.asp"-->
<%
IF Session("UserID") = "" THEN 
	Response.Redirect("../Index.asp")
END IF	
%>