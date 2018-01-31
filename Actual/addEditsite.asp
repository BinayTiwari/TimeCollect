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
DIM PlaceHolder
PlaceHolder = "Please pass your Magnetic card"
IF Request.ServerVariables("REQUEST_METHOD") = "POST" Then	
	IF Request.Form("Strstatus") <> "1" THEN
		strSQL = "INSERT INTO TC_TimeCollect ([SiteID],[DeptID],[UserCardID],[date ],[StartTime ]) Values("&Request.Cookies("SiteID")&","&Request.Cookies("DeptID")&","&Request.Form("txtMagneticCard")&",getdate(),CAST(getdate() AS TIME))"
		Strstatus = 1
		ErrorMessage = "Thank you – now please start your activity. Return to this screen at the end"
		PlaceHolder = "Please pass your Magnetic card at the end of your activity "
		
	ELSE
			strSQL = "Update TC_TimeCollect SET TotalTIME = CAST((CAST(getdate() AS DATETIME) - CAST(StartTIME AS DATETIME)) AS TIME)  , ENDTIME = CAST(getdate() as time)"&_
 					 " where USERCARDID = "&Request.Form("txtMagneticCard")&" AND SiteID = "&Request.Cookies("SiteID")&" AND DeptID = "&Request.Cookies("DeptID")&" AND ENDTIME is null "
			 Strstatus = 0
			 ErrorMessage = ""
			PlaceHolder = "Please pass your Magnetic card"
		
	END IF
	IF(Request.Form("txtMagneticCard") <> " ") THEN

		adoCon.Execute(strSQL)
		
		
		
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
            <div id="menu-container">
                <div class="container">
                    <!--nav starts-->
                    <nav id="main-menu">
                    	<div class="dt-menu-toggle" id="dt-menu-toggle">Menu<span class="dt-menu-toggle-icon"></span></div>
                        <ul id="menu-main-menu" class="menu">
                            <li class="current_page_item menu-item-simple-parent menu-item-depth-0 red"> <a href="index.html"> Home </a> 
                                <ul class="sub-menu">
                                    <li> <a href="#"> Submenu Level I </a> </li>
                                    <li> <a href="#"> Submenu Level I </a>  </li>
                                    <li> <a href="#"> Submenu Level I </a> </li>
                                    <li> <a href="#"> Submenu Level I </a> </li>
                                    <li> <a href="#"> Submenu Level I </a> 
                                        <ul class="sub-menu">
                                            <li> <a href="#"> Submenu Level II </a> </li>
                                            <li> <a href="#"> Submenu Level II </a> </li>
                                            <li> <a href="#"> Submenu Level II </a>  </li>
                                        </ul>   
                                        <a class="dt-menu-expand">+</a>                             
                                    </li>
                                </ul>  
                                <a class="dt-menu-expand">+</a>                      
                          </li>
                            <li class="mustard"> <a href="about.html"> About us </a> </li>
                            <li class="green"> <a href="our-staffs.html"> Our Staffs </a> </li>
                            <li class="yellow"> <a href="services.html"> Services </a> </li>
                            <li class="menu-item-simple-parent menu-item-depth-0 blue"><a href="portfolio-four-column.html" title="">Portfolio</a>
                                <ul class="sub-menu">
                                    <li><a href="portfolio-four-column.html">Portfolio Four Column</a></li>
                                    <li><a href="portfolio-three-column.html">Portfolio Three Column</a>
                                        <ul class="sub-menu">
                                            <li><a href="portfolio-three-column-with-sidebar.html">With Sidebar</a></li>
                                        </ul>
                                        <a class="dt-menu-expand">+</a>
                                    </li>
                                </ul>
                                <a class="dt-menu-expand">+</a>
                          </li>
                            
                            <li class="menu-item-megamenu-parent megamenu-4-columns-group menu-item-depth-0 steelblue"> <a href="#" title=""> Pages </a> 
                            
                                <div class="megamenu-child-container">
                                    <ul class="sub-menu">
                                        <li> <a href="#">Useful Shortcodes</a>
                                            <ul class="sub-menu">
                                                <li> <a href="shortcodes.html">Typography </a> </li>
                                                <li><a href="buttons-lists.html" title="">Buttons &amp; Lists</a></li>
                                                <li><a href="columns.html" title="">Columns</a></li>
                                                <li><a href="fancy-boxes.html" title="">Fancy Boxes</a></li>
                                                <li><a href="icon-boxes.html" title="">Icon Boxes</a></li>
                                                <li><a href="pricing-tables.html" title="">Pricing Tables</a></li>
                                                <li><a href="progressbars.html" title="">Progress Bars</a></li>
                                                <li><a href="quotes.html" title="">Quotes</a></li>
                                    			<li><a href="tabs-toggles.html" title="">Tabs &amp; Toggles</a></li>
                                            </ul>
                                            <a class="dt-menu-expand">+</a> 
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-depth-1 menu-item-with-widget-area">
                                            <a href="#">Popular Products</a>
                                            <div class="menu-item-widget-area-container">
                                                <ul>
                                                    <li class="widget widget_popular_products">
                                                        <ul class="product_list_widget">
                                                            <li>
                                                                <a href="#" title="">
                                                                <img src="images/product_thumb1.jpg" alt="product"> Ellents Style Grade </a>
                                                                <span class="amount">$20.00</span>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="">
                                                                <img src="images/product_thumb2.jpg" alt="product"> Ellents Style Grade </a>
                                                                <span class="amount">$20.00</span>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="">
                                                                <img src="images/product_thumb3.jpg" alt="product"> Ellents Style Grade </a>
                                                                <span class="amount">$20.00</span>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-depth-1 menu-item-with-widget-area  fill-two-columns">
                                            <a href="#">Featured Blog</a>
                                            <div class="menu-item-widget-area-container">
                                            	<ul>
                                                	<li class="widget widget_recent_entries">
                                                    	<div class="entry-thumb">
                                                        	<a href="blog-detail.html"><img src="images/mega_menu_blog_img1.jpg" alt="" title=""></a>
                                                        </div>
                                                        <div class="entry-body">
                                                        	<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit.</p>
                                                        </div>
                                                        <div class="entry-details">
                                                        	<div class="entry-title">
                                                            	<h5><a href="blog-detail.html"> Create your Works </a></h5>
                                                            </div>
                                                            <div class="entry-metadata">
                                                            	<p class="author"><a href="#"> By Admin </a></p>
                                                                <span class=""> | </span>
                                                                <p class="comments"><a href="#"><span class="fa fa-comment"></span></a></p>
                                                                <p class="date"> 10 Aug </p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="widget widget_recent_entries">
                                                    	<div class="entry-thumb">
                                                        	<a href="blog-detail.html"><img src="images/mega_menu_blog_img2.jpg" alt="" title=""></a>
                                                        </div>
                                                        <div class="entry-body">
                                                        	<p>Minima ve nostrum exercita tionem ullam corporis suscipit laboriosam, nisi ut aliquid ex.</p>
                                                        </div>
                                                        <div class="entry-details">
                                                        	<div class="entry-title">
                                                            	<h5><a href="blog-detail.html"> Best of the Blogs </a></h5>
                                                            </div>
                                                            <div class="entry-metadata">
                                                            	<p class="author"><a href="#"> By Admin </a></p>
                                                                <span class=""> | </span>
                                                                <p class="comments"><a href="#"><span class="fa fa-comment"></span></a></p>
                                                                <p class="date"> 10 Aug </p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <a class="dt-menu-expand">+</a>
                          </li>
                            <li class="menu-item-simple-parent menu-item-depth-0 lavender"><a href="blog.html" title="">Blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog-two-column.html">Blog Two Column</a>
                                    	<ul class="sub-menu">
                                            <li><a href="blog-two-column-with-sidebar.html">With Sidebar</a></li>
                                        </ul>
                                        <a class="dt-menu-expand">+</a>
                                    </li>
                                    <li><a href="blog.html">Blog One Column</a>
                                        <ul class="sub-menu">
                                            <li><a href="blog-with-sidebar.html">With Sidebar</a></li>
                                        </ul>
                                        <a class="dt-menu-expand">+</a>
                                    </li>
                                </ul>
                                <a class="dt-menu-expand">+</a>
                          </li>
                            <li class="purple"><a href="shop.html" title="">Shop</a></li>
                            <li class="pink"><a href="contact.html" title="">Contact us</a></li>
                        </ul>
                    </nav>
                    <!--nav ends-->

                    <ul class="dt-sc-social-icons">
                        <li><a href="#" title="Facebook" class="dt-sc-tooltip-top facebook"><span class="fa fa-facebook"></span></a></li>
                        <li><a href="#" title="Youtube" class="dt-sc-tooltip-top youtube"><span class="fa fa-youtube"></span></a></li>
                        <li><a href="#" title="Twitter" class="dt-sc-tooltip-top twitter"><span class="fa fa-twitter"></span></a></li>
                        <li><a href="#" title="Google Plus" class="dt-sc-tooltip-top gplus"><span class="fa fa-google-plus"></span></a></li>
                    </ul>
                </div>
            </div>
            <!--menu-container ends-->
        </header>
        <!--header ends-->
        <!--main starts-->
        <div id="main">
        
         
            <!--primary starts-->
            <section id="primary" class="content-full-width">
                <!--container starts-->
                <div class="container">
				 <table width="75%"  border="0">
						 <tr>
    <td>SiteID</td>
    <td>Active</td>
    <td>Site Name</td>
    <td>Edit</td>
  </tr>
  <%
  	DIM arrAvailable
 	strSQL = "Select SiteID,SiteName,Active FROM [TC_Sites] ORDER BY SITEID"
	rsCommon.open strSQL,adoCon,1
			IF rsCommon.recordcount =0 Then
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
			
			ELSE
				arrAvailable = rsCommon.GetRows()
				rsCommon.close
				adoCon.close
				set rsCommon=nothing
				set adoCon=nothing
			END IF
			
			%>
			
			<%  For i = 0 To Ubound(arrAvailable,2)%>
  

  <tr>
    <td><%=arrAvailable(0,i)%></td>
    <td><%=arrAvailable(2,i)%></td>
    <td><%=arrAvailable(1,i)%></td>
	<td>Edit</td>
    </tr>
  <%NEXT%>
</table>
                    <div class="dt-sc-one-fourth column first">
                        <div class="dt-sc-ico-content type1">
                            <div class="icon">
                                <span class="icon-outer">
                                    <img src="images/service1.jpg" alt="" title="">
                                    <span class="infolayer">
                                        <a href="#"><i class="fa fa-link"></i></a>
                                    </span>
                                </span>
                            </div>
                            <h4><a href="#">Active Learning</a></h4>
                            <p>Curabitur ultrices posuere mattis. Nam ullamcorper, diam sit amet euismod pelleo ntesque, eros risus rhoncus libero, invest tibulum nisl ligula</p>
                        </div>
                    </div>
                    
                    <div class="dt-sc-one-fourth column">
                        <div class="dt-sc-ico-content type1">
                            <div class="icon">
                                <span class="icon-outer">
                                    <img src="images/service2.jpg" alt="" title="">
                                    <span class="infolayer">
                                        <a href="#"><i class="fa fa-link"></i></a>
                                    </span>
                                </span>
                            </div>
                            <h4><a href="#">Music Class</a></h4>
                            <p>Decor ostdcaer urabitur ultrices posuere mattis. Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, invest tibulum nisl ligula</p>
                        </div>
                    </div>
                    
                    <div class="dt-sc-one-fourth column">
                        <div class="dt-sc-ico-content type1">
                            <div class="icon">
                                <span class="icon-outer">
                                    <img src="images/service3.jpg" alt="" title="">
                                    <span class="infolayer">
                                        <a href="#"><i class="fa fa-link"></i></a>
                                    </span>
                                </span>
                            </div>
                            <h4><a href="#">Yoga Class</a></h4>
                            <p>Rabitur ultrices posuere mattis. Nam ullamcorper, diam sit  euismod pelleo ntesque, eros risus rhoncus libero, invest tibulum nisl gedretu osterftra ligula</p>
                        </div>
                    </div>
                    
                    <div class="dt-sc-one-fourth column">
                        <div class="dt-sc-ico-content type1">
                            <div class="icon">
                                <span class="icon-outer">
                                    <img src="images/service4.jpg" alt="" title="">
                                    <span class="infolayer">
                                        <a href="#"><i class="fa fa-link"></i></a>
                                    </span>
                                </span>
                            </div>
                            <h4><a href="#">Kung fu Class</a></h4>
                            <p>Curabitur ultrices posuere mattis. Nam ullamcorper, diam sit amet euismod pelleo ntesque, eros risus rhoncus libero, invest tibulum nisl ligula</p>
                        </div>
                    </div>
                    
                </div>
                <!--container ends-->
                <div class="dt-sc-hr"></div>
                <!--fullwidth-background starts-->
                <section class="fullwidth-background dt-sc-parallax-section turquoise-bg">
                    <!--container starts-->
                    <div class="container">
                        <!--dt-sc-one-half starts-->
                        <div class="dt-sc-one-half column first">
                            <h2>Play As You Learn</h2>
                            <!--dt-sc-one-half starts-->
                            <div class="dt-sc-one-half column first">
                                
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-glass"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> English Summer Camp </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                                <div class="dt-sc-hr-very-small"></div>
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-pencil"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> Drawing & Painting </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                                <div class="dt-sc-hr-very-small"></div>
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-bullseye"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> Swimming Camp </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                            
                            </div>
                            <!--dt-sc-one-half ends-->
                            
                            <!--dt-sc-one-half starts-->
                            <div class="dt-sc-one-half column">
                                
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-tachometer"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> Sports Camp </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                                <div class="dt-sc-hr-very-small"></div>
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-magic"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> Personalizing </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                                <div class="dt-sc-hr-very-small"></div>
                                <div class="dt-sc-ico-content type2">
                                    <div class="icon"> 
                                        <span class="fa fa-music"> </span> 
                                    </div>
                                    <h4><a href="#" target="_blank"> Sing & Dance </a></h4>
                                    <p>Nam ullamcorper, diam sit amet euismod pelleontesque, eros risus rhoncus libero, inst tibulum nisl ligula....</p>
                                </div>
                            
                            </div>
                            <!--dt-sc-one-half ends-->
                        </div>
                        <!--dt-sc-one-half ends-->
                        
                        <!--dt-sc-one-half starts-->
                        <div class="dt-sc-one-half column">
                            <h2>With Music4Kids, music is child's play!</h2>
                            <div class="add-slider-wrapper">
                                <ul class="add-slider">
                                    <li> <img src="images/add1.jpg" alt="" title=""> </li>
                                    <li> <img src="images/add2.jpg" alt="" title=""> </li>
                                    <li> <img src="images/add1.jpg" alt="" title=""> </li>
                                </ul>
                            </div>
                        </div>
                        <!--dt-sc-one-half ends-->
                    </div>
                    <!--container ends-->
                </section>
                <!--fullwidth-background ends-->
                <div class="dt-sc-hr"></div>
                <!--container starts-->
                <div class="container">
                    <h2 class="dt-sc-hr-green-title">Our Portfolio</h2>
                    
                    <!--portfolio-content starts-->
                    <div class="front-portfolio-container">
                       <div class="portfolio-content portfolio-content1">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                  	  <img src="images/image1.jpg" alt="" title="">
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image1.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                       <div class="portfolio-content portfolio-content2">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                  	  <img src="images/image2.jpg" alt="" title="">	
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image2.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                      
                       <div class="portfolio-content portfolio-content3">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                      <img src="images/image3.jpg" alt="" title="">
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image3.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                       
                       <div class="portfolio-content portfolio-content4">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                      <img src="images/image4.jpg" alt="" title="">
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image4.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                      
                       <div class="portfolio-content portfolio-content5">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                      <img src="images/image5.jpg" alt="" title="">
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image5.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                      
                       <div class="portfolio-content portfolio-content6">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                      <img src="images/image6.jpg" alt="" title="">
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image6.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                              
                       <div class="portfolio-content portfolio-content7">
                           <div class="front-portfolio">
                              <div class="portfolio-outer">
                                  <div class="portfolio-thumb">
                                      <img src="images/image7.jpg" alt="" title=""> 		
                                      <div class="image-overlay">
                                        <h5><a href="portfolio-detail.html">Gifts at Large</a></h5>
                                        <a href="portfolio-detail.html" class="link"><span class="fa fa-link"></span></a>
                                        <a href="images/image7.jpg" data-gal="prettyPhoto[gallery]" class="zoom"><span class="fa fa-search"></span></a>
                                    </div>
                                  </div>
                              </div>
                           </div>
                       </div>
                       <div class="dt-sc-hr-small"></div>
                       <div class="aligncenter">
                           <a href="#" class="dt-sc-button medium mustard"> Hit here to view all <span class="fa fa-chevron-circle-right"> </span></a>        
                       </div>
                    </div>
                       
                    <!--front-portfolio-container ends-->
                    
                </div>
                <!--container ends-->
                
                <div class="dt-sc-hr"></div>
                <!--fullwidth-background starts-->
                <section class="fullwidth-background dt-sc-parallax-section orange-bg">
                    <!--container starts-->
                    <div class="container">
                        <h2 class="dt-sc-hr-white-title">Recent Blog</h2>
                        <div class="column dt-sc-one-half first">
                            <article class="blog-entry">
                                <div class="blog-entry-inner">
                                    <div class="entry-meta">
                                        <a href="blog-detail.html" class="blog-author"><img src="images/rounded-bg-img.jpg" alt="" title=""></a>
                                        <div class="date">
                                            <span> 27 </span> 
                                            <p> Aug <br> 2014 </p> 
                                        </div>
                                        <a href="#" class="comments">
                                            12 <span class="fa fa-comment"> </span>
                                        </a>
                                        <a href="#" class="entry_format"><span class="fa fa-picture-o"></span></a>	
                                    </div>		
                                    <div class="entry-thumb">
                                        <a href="blog-detail.html"><img src="images/blog1.jpg" alt="" title=""></a>
                                    </div>		
                                    <div class="entry-details">	
                                        <div class="entry-title">
                                            <h3><a href="blog-detail.html"> Activities Improves Mind </a></h3>
                                        </div>			
                                        <!--entry-metadata ends-->	
                                        <div class="entry-body">
                                            <p>Roin bibendum nibhsds. Nuncsdsd fermdada msit ametadasd consequat. Praes porr nulla sit amet dui lobortis, id venenatis nibh accums.</p>
                                        </div>	 		
                                        <a href="blog-detail.html" class="dt-sc-button small"> Read More <span class="fa fa-chevron-circle-right"> </span></a>		
                                    </div>	
                                </div>
                            </article>
                        </div>
                        <!--dt-sc-one-half ends-->
                        <div class="column dt-sc-one-half">
                            <article class="blog-entry">
                                <div class="blog-entry-inner">
                                    <div class="entry-meta">
                                        <a href="blog-detail.html" class="blog-author"><img src="images/rounded-bg-img.jpg" alt="" title=""></a>
                                        <div class="date">
                                            <span> 27 </span> 
                                            <p> Aug <br> 2014 </p> 
                                        </div>
                                        <a href="#" class="comments">
                                            12 <span class="fa fa-comment"> </span>
                                        </a>
                                        <a href="#" class="entry_format"><span class="fa fa-picture-o"></span></a>	
                                    </div>		
                                    <div class="entry-thumb">
                                        <a href="blog-detail.html"><img src="images/blog2.jpg" alt="" title=""></a>
                                    </div>		
                                    <div class="entry-details">	
                                        <div class="entry-title">
                                            <h3><a href="blog-detail.html"> Weekly Reader Zone </a></h3>
                                        </div>			
                                        <!--entry-metadata ends-->	
                                        <div class="entry-body">
                                            <p>Iid venenatis nibh accums. Doinbibe ndum nibhsds. Nuncsdsd fermdada msit ametadasd consequat. Praes porr nulla sit amet dui lobortis, id venenatis nibh accumsan...</p>
                                        </div>	 		
                                        <a href="blog-detail.html" class="dt-sc-button small"> Read More <span class="fa fa-chevron-circle-right"> </span></a>		
                                    </div>	
                                </div>
                            </article>
                        </div>
                        <!--dt-sc-one-half ends-->
                    </div>
                    <!--container ends-->    
                </section>
                <!--fullwidth-background ends-->
                <div class="dt-sc-hr"></div>
                <!--container starts-->
                <div class="container">
                    <h2 class="dt-sc-hr-green-title">Our Staffs</h2>
                    
                    <div class="column dt-sc-one-fourth first">
                        <div class="dt-sc-team">	
                            <div class="image">
                                <img class="item-mask" src="images/mask.png" alt="" title="">
                                <img src="images/team1.jpg" alt="" title="">
                                <div class="dt-sc-image-overlay">
                                	<a href="#" class="link"><span class="fa fa-link"></span></a>
                                    <a href="#" class="zoom"><span class="fa fa-search"></span></a>
                                </div>
                            </div>
                            <div class="team-details">
                                <h4> Jack Daniels </h4>
                                <h6> Senior Supervisor </h6>
                                <p> Phasellus lorem augue, vulputate vel orci id, ultricies aliquet risus. </p>
                            </div>
                        </div>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <div class="dt-sc-team">	
                            <div class="image">
                                <img class="item-mask" src="images/mask.png" alt="" title="">
                                <img src="images/team2.jpg" alt="" title="">
                                <div class="dt-sc-image-overlay">
                                	<a href="#" class="link"><span class="fa fa-link"></span></a>
                                    <a href="#" class="zoom"><span class="fa fa-search"></span></a>
                                </div>
                            </div>
                            <div class="team-details">
                                <h4> Linda Glendell </h4>
                                <h6> Teaching Professor </h6>
                                <p> Phasellus lorem augue, vulputate vel orci id, ultricies aliquet risus. </p>
                            </div>
                        </div>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <div class="dt-sc-team">	
                            <div class="image">
                                <img class="item-mask" src="images/mask.png" alt="" title="">
                                <img src="images/team3.jpg" alt="" title="">
                                <div class="dt-sc-image-overlay">
                                	<a href="#" class="link"><span class="fa fa-link"></span></a>
                                    <a href="#" class="zoom"><span class="fa fa-search"></span></a>
                                </div>
                            </div>
                            <div class="team-details">
                                <h4> Kate Dennings </h4>
                                <h6> Children Diet </h6>
                                <p> Phasellus lorem augue, vulputate vel orci id, ultricies aliquet risus. </p>
                            </div>
                        </div>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <div class="dt-sc-team">	
                            <div class="image">
                                <img class="item-mask" src="images/mask.png" alt="" title="">
                                <img src="images/team4.jpg" alt="" title="">
                                <div class="dt-sc-image-overlay">
                                	<a href="#" class="link"><span class="fa fa-link"></span></a>
                                    <a href="#" class="zoom"><span class="fa fa-search"></span></a>
                                </div>
                            </div>
                            <div class="team-details">
                                <h4> Kristof Slinghot </h4>
                                <h6> Management </h6>
                                <p> Phasellus lorem augue, vulputate vel orci id, ultricies aliquet risus. </p>
                            </div>
                        </div>
                    </div>
                
                </div>
                <!--container ends-->
                
                <div class="dt-sc-hr"></div>
                <!--fullwidth-background starts-->
                <section class="fullwidth-background dt-sc-parallax-section product_bg">
                    <!--container starts-->
                    <div class="container">
                        <h2 class="dt-sc-hr-white-title">Recent Products</h2>
                        <ul class="products">
                            <li class="dt-sc-one-fourth column first">
                                <div class="product-thumb">
                                    <a href="#">
                                        <img src="images/product1.jpg" alt="" title="">
                                    </a>  
                                    <span class="sale"> Sale! </span>
                                    <div class="image-overlay">  
                                        <div class="product-button">
                                            <a href="#" class="add-cart-btn"> Add to cart </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details">
                                    <h5><a href="#"> Ellents Style Grade </a></h5>
                                    <span class="price"> $20.00 </span>
                                </div>
                            </li>
                            <li class="dt-sc-one-fourth column">
                                <div class="product-thumb">
                                    <a href="#">
                                        <img src="images/product2.jpg" alt="" title="">
                                    </a>  
                                    <div class="image-overlay">  
                                        <div class="product-button">
                                            <a href="#" class="add-cart-btn"> Add to cart </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details">
                                    <h5><a href="#"> Ellents Style Grade </a></h5>
                                    <span class="price"> $20.00 </span>
                                </div>
                            </li>
                            <li class="dt-sc-one-fourth column">
                                <div class="product-thumb">
                                    <a href="#">
                                        <img src="images/product3.jpg" alt="" title="">
                                    </a>  
                                    <span class="sale"> Sale! </span>
                                    <div class="image-overlay">  
                                        <div class="product-button">
                                            <a href="#" class="add-cart-btn"> Add to cart </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details">
                                    <h5><a href="#"> Ellents Style Grade </a></h5>
                                    <span class="price"> $20.00 </span>
                                </div>
                            </li>
                            <li class="dt-sc-one-fourth column">
                                <div class="product-thumb">
                                    <a href="#">
                                        <img src="images/product4.jpg" alt="" title="">
                                    </a>  
                                    <div class="image-overlay">  
                                        <div class="product-button">
                                            <a href="#" class="add-cart-btn"> Add to cart </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details">
                                    <h5><a href="#"> Ellents Style Grade </a></h5>
                                    <span class="price"> $20.00 </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--container ends-->
                </section>
                <!--fullwidth-background ends-->
            </section>
            <!--primary ends-->
        </div>
        <!--main ends-->
        
        <!--footer starts-->
        <footer>
            <!--footer-widgets-wrapper starts-->
            <div class="footer-widgets-wrapper">
                <!--container starts-->
                <div class="container">
                    
                    <div class="column dt-sc-one-fourth first">
                        <aside class="widget widget_text">
                            <h3 class="widgettitle red_sketch"> About Kids Life </h3>
                            <p>Happy <a href="#"><strong>Kids Life</strong></a> comes with powerful theme options, which empowers you to quickly and easily build incredible store.</p>
                            <ul>
                                <li> <a href="#"> English Grammar Class </a> </li>
                                <li> <a href="#"> Music class </a> </li>
                                <li> <a href="#"> Swimming & Karate </a> </li>
                                <li> <a href="#"> Lot of HTML Styles </a> </li>
                                <li> <a href="#"> Unique News Page Design </a> </li>
                            </ul>
                        </aside>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <aside class="widget widget_recent_entries">
                            <h3 class="widgettitle green_sketch"> Latest Post </h3>
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="images/blog_list1.jpg" alt="" title="">
                                    </a>    
                                    <h6><a href="#"> Amazing post with all  goodies </a></h6>
                                    <span> March 23, 2014 </span>       
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="images/blog_list2.jpg" alt="" title="">
                                    </a>
                                    <h6><a href="#"> Amazing post with all  goodies </a></h6>
                                    <span> March 23, 2014 </span> 
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="images/blog_list3.jpg" alt="" title="">
                                    </a>
                                    <h6><a href="#"> Amazing post with all  goodies </a></h6>
                                    <span> March 23, 2014 </span> 
                                </li>
                            </ul>
                        </aside>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <aside class="widget tweetbox">
                            <h3 class="widgettitle yellow_sketch"><a href="#"> Twitter Feeds </a></h3>
                            <div id="tweets_container"></div>
                        </aside>
                    </div>
                    <div class="column dt-sc-one-fourth">
                        <aside class="widget widget_text">
                        <h3 class="widgettitle steelblue_sketch">Contact</h3>
                            <div class="textwidget">
                                <p class="dt-sc-contact-info"><span class="fa fa-map-marker"></span> 4318 Mansion House, Greenland <br> United States </p>
                                <p class="dt-sc-contact-info"><span class="fa fa-phone"></span> (000) 233 - 3236 </p>
                                <p class="dt-sc-contact-info"><span class="fa fa-envelope"></span><a href="mailto:yourname@somemail.com"> Kidslife@somemail.com </a></p>
                            </div>
                        </aside>
                        <aside class="widget mailchimp">
                            <p> We're social </p>
                            <form name="frmnewsletter" class="mailchimp-form" action="http://wedesignthemes.com/html/kidslife/php/subscribe.php" method="post">
                                <p>
                                    <span class="fa fa-envelope-o"> </span>
                                    <input type="email" placeholder="Email Address" name="mc_email" required />	
                                </p>	
                                <input type="submit" value="Subscribe" class="button" name="btnsubscribe">
                            </form>
                            <div id="ajax_subscribe_msg"></div>
                        </aside>
                    </div>
                    
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
