<%@page import="Extraction.RSSUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DataBase"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.net.URL"%>
<%@page import="Extraction.path"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.File"%>
<%@page import="Extraction.Extract"%>
<%@page import="com.binees.bayes.learn.BayesUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>News Customization</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<!-- Homepage Specific -->
<script type="text/javascript"
	src="layout/scripts/galleryviewthemes/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="layout/scripts/galleryviewthemes/jquery.timers.1.2.js"></script>
<script type="text/javascript"
	src="layout/scripts/galleryviewthemes/jquery.galleryview.2.1.1.min.js"></script>
<script type="text/javascript"
	src="layout/scripts/galleryviewthemes/jquery.galleryview.setup.js"></script>
<!-- / Homepage Specific -->
</head>
<body id="top">
	<%
		DataBase db = new DataBase();
		String site_id = "http://indianexpress.com/section/lifestyle/health/feed/";
		RSSUtil.getRSSFeed("health", site_id, "tbl_health");
	%>
	<div class="wrapper col0">
		<div id="topline">
			<p>Tel: 0481 2435187 | Mail: istroxacademy@gmail.com</p>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Contact Us</a></li>
				<li class="last"><a href="index.jsp">Latest News</a></li>
			</ul>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper">
		<div id="header">
			<div class="fl_left">
				<h1>
					<a href="index.jsp"><strong>N</strong>ews <strong>C</strong>ustomization</a>
				</h1>
				<p>News Customisation for managing RSS feeds from various news
					websites</p>
			</div>
			<div class="fl_right">
				<a href="#"><img src="1.png" alt="" /></a>
			</div>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper col2">
		<div id="topbar">
			<div id="topnav">
				<ul>
					<li class="active"><a href="index.jsp">Latest News</a></li>
					<li><a href="sports.jsp">Sports</a></li>
					<li><a href="education.jsp">Education</a></li>
					<li><a href="health.jsp">Health</a></li>

				</ul>
			</div>
			<div id="search">
				<form action="#" method="post">
					<fieldset>
						<legend>Site Search</legend>
						<input type="text" value="Search Our Website&hellip;"
							onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
						<input type="submit" name="go" id="go" value="Search" />
					</fieldset>
				</form>
			</div>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper">
		<div class="container">
			<div class="content">
      <div id="featured_slide">
        <ul id="featurednews">
            
            <%
            String sql1="select * from tbl_health limit 6";
        	BayesUtil bayesUtil=BayesUtil.getInstance();
            ResultSet rs=db.exquery(sql1);
            while(rs.next())
            {
            	String category=bayesUtil.getCategory(rs.getString("head"));
            	
            	
            %>
            <li><img width="600" height="280" src="<%=rs.getString("image")%>" alt="" />
            <div class="panel-overlay">
            <%
            	if(category.equals("positive")){
            		%>
          		  <h2  style="color:green;"><%=rs.getString("head")%></h2>
          		 <%
            	}else if(category.equals("negative")){
            		%>
          		  <h2 style="color:red;"><%=rs.getString("head")%></h2>
          		 <%
            	}else{
            		 %>
            		  <h2><%=rs.getString("head")%></h2>
            		 <%
            	}
            %>
              <h2><%=rs.getString("head")%></h2>
              <p><%=rs.getString("head")%><br />
                <a target="_blank" href="<%=rs.getString("url")%>">Continue Reading &raquo;</a></p>
            </div>
          </li>
          <%
          }
          %>
        </ul>
      </div>
    </div>
			<div class="column">
				<ul class="latestnews">
					<%
						String sql2 = "select * from tbl_health limit 6,3";
						ResultSet rs2 = db.exquery(sql2);
						while (rs2.next()) {
					%>
					<li><img width="100" height="100"
						src="<%=rs2.getString("image")%>" alt="" />
						<p>
							<strong><a target="_blank"
								href="<%=rs2.getString("url")%>"><%=rs2.getString("head")%></a></strong>
							<%=rs2.getString("head")%></p></li>
					<%
						}
					%>
				</ul>
			</div>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper">
		<div id="adblock">
			<div class="fl_left">
				<a href="#"><img src="2.png" alt="" /></a>
			</div>
			<div class="fl_right">
				<a href="#"><img src="2.png" alt="" /></a>
			</div>
			<br class="clear" />
		</div>
		<div id="hpage_cats">
			<div class="fl_left">

				<%
					String sql3 = "select * from tbl_health limit 9,1";
					ResultSet rs3 = db.exquery(sql3);
					while (rs3.next()) {
				%>
				<h2>
					<a href="#">Latest News</a>
				</h2>
				<img width="100" height="100" src="<%=rs3.getString("image")%>"
					alt="" />
				<p>
					<strong><a target="_blank"
						href="<%=rs3.getString("url")%>"><%=rs3.getString("head")%></a></strong>
				</p>
				<p><%=rs3.getString("head")%></p>
				<%
					}
				%>
			</div>
			<div class="fl_right">
				<%
					String sql4 = "select * from tbl_health limit 10,1";
					ResultSet rs4 = db.exquery(sql4);
					while (rs4.next()) {
				%>
				<h2>
					<a href="#">Latest News</a>
				</h2>
				<img width="100" height="100" src="<%=rs4.getString("image")%>"
					alt="" />
				<p>
					<strong><a target="_blank"
						href="<%=rs4.getString("url")%>"><%=rs4.getString("head")%></a></strong>
				</p>
				<p><%=rs4.getString("head")%></p>
				<%
					}
				%>
			</div>
			<br class="clear" />
			<div class="fl_left">
				<%
					String sql5 = "select * from tbl_health limit 11,1";
					ResultSet rs5 = db.exquery(sql5);
					while (rs5.next()) {
				%>
				<h2>
					<a href="#">Latest News &raquo;</a>
				</h2>
				<img width="100" height="100" src="<%=rs5.getString("image")%>"
					alt="" />
				<p>
					<strong><a target="_blank"
						href="<%=rs5.getString("url")%>"><%=rs5.getString("head")%></a></strong>
				</p>
				<p><%=rs5.getString("head")%></p>
				<%
					}
				%>
			</div>
			<div class="fl_right">
				<%
					String sql6 = "select * from tbl_health limit 12,1";
					ResultSet rs6 = db.exquery(sql6);
					while (rs6.next()) {
				%>
				<h2>
					<a href="#">Latest News &raquo;</a>
				</h2>

				<img width="100" height="100" src="<%=rs6.getString("image")%>"
					alt="" />
				<p>
					<strong><a target="_blank"
						href="<%=rs6.getString("url")%>"><%=rs6.getString("head")%></a></strong>
				</p>
				<p><%=rs6.getString("head")%></p>
				<%
					}
				%>
			</div>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper">
		<div class="container">
			<div class="content">
				<div id="hpage_latest">
					<h2>Current News</h2>
					<ul>
						<%
							String sql7 = "select * from tbl_health limit 13,2";
							ResultSet rs7 = db.exquery(sql7);
							while (rs7.next()) {
						%>
						<li><img width="190" height="130"
							src="<%=rs7.getString("image")%>" alt="" />
							<p><%=rs7.getString("head")%></p>
							<p><%=rs7.getString("head")%></p>
							<p class="readmore">
								<a target="_blank" href="<%=rs7.getString("url")%>">Continue
									Reading &raquo;</a>
							</p></li>
						<%
							}
						%>
					</ul>
					<br class="clear" />
				</div>
			</div>
			<div class="column">
				<%
					String sql8 = "select * from tbl_health limit 18,1";
					ResultSet rs8 = db.exquery(sql8);
					while (rs8.next()) {
				%>
				<div class="holder">
					<a target="_blank" href="<%=rs8.getString("url")%>"><img
						width="300" height="250" src="<%=rs8.getString("image")%>"
						alt="" /></a>
				</div>
				<%
					}
					String sql9 = "select * from tbl_health limit 19,1";
					ResultSet rs9 = db.exquery(sql9);
					while (rs9.next()) {
				%>
				<div class="holder">
					<a target="_blank" href="<%=rs9.getString("url")%>"><img
						width="300" height="80" src="<%=rs9.getString("image")%>"
						alt="" /></a>
				</div>
				<%
					}
				%>
			</div>
			<br class="clear" />
		</div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper">
		<div id="footer">
			<div class="footbox">
				<h2>News</h2>
				<ul>
					<%
						String sql10 = "select * from tbl_health limit 20,6";
						ResultSet rs10 = db.exquery(sql10);
						while (rs10.next()) {
					%>
					<li><a target="_blank" href="<%=rs10.getString("url")%>"><%=rs10.getString("head")%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="footbox">
				<h2>News</h2>
				<ul>
					<%
						String sql11 = "select * from tbl_health limit 26,6";
						ResultSet rs11 = db.exquery(sql11);
						while (rs11.next()) {
					%>
					<li><a target="_blank" href="<%=rs11.getString("url")%>"><%=rs11.getString("head")%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="footbox">
				<h2>News</h2>
				<ul>
					<%
						String sql12 = "select * from tbl_health limit 32,6";
						ResultSet rs12 = db.exquery(sql12);
						while (rs12.next()) {
					%>
					<li><a target="_blank" href="<%=rs12.getString("url")%>"><%=rs12.getString("head")%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="footbox">
				<h2>News</h2>
				<ul>
					<%
						String sql13 = "select * from tbl_health limit 38,6";
						ResultSet rs13 = db.exquery(sql13);
						while (rs13.next()) {
					%>
					<li><a target="_blank" href="<%=rs13.getString("url")%>"><%=rs13.getString("head")%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="footbox last">
				<h2>News</h2>
				<ul>
					<%
						String sql14 = "select * from tbl_health limit 44,6";
						ResultSet rs14 = db.exquery(sql14);
						while (rs14.next()) {
					%>
					<li><a target="_blank" href="<%=rs14.getString("url")%>"><%=rs14.getString("head")%></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<br class="clear" />
		</div>
	</div>

	<div class="wrapper col8">
		<div id="copyright">
			<p class="fl_left">
				Copyright &copy; 2014 - All Rights Reserved - <a href="#">News
					Customization</a>
			</p>

			<br class="clear" />
		</div>
	</div>
</body>
</html>