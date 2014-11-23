<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<%
		Connection con;
		Statement stmt;
		ResultSet rs;
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/uiddb", "root", "");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select * from citizentable where uid="
				+ session.getAttribute("loginid"));
		if (rs.next()) {
			session.setAttribute("applicationo", rs.getString(1));
			session.setAttribute("uid", rs.getString(2));
			session.setAttribute("name", rs.getString(4));
			session.setAttribute("address", rs.getString(5));
			session.setAttribute("dob", rs.getString(6));
			session.setAttribute("fathername", rs.getString(7));
			session.setAttribute("contactno", rs.getString(8));
			session.setAttribute("occupation", rs.getString(9));
			session.setAttribute("photo", rs.getString(10));
			session.setAttribute("pincode", rs.getString(11));
			session.setAttribute("gender", rs.getString(12));
			session.setAttribute("applicationstatus", rs.getString(13));
		}
	%>
	<nav class="navbar navbar-default middle" style="vertical-align: middle">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Welcome <%=session.getAttribute("name")%>(<%=session.getAttribute("uid")%>)
				</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href='applicationpassport.jsp' target='main'>Apply
							for Passport</a></li>
					<li><a href='passportstatus.jsp' target='main'>Passport
							Status</a></li>
					<li><a href='applicationlicense.jsp' target='main'>Apply
							for License</a></li>
					<li><a href='testschedule.jsp' target='main'>Test Schedule</a></li>
					<li><a href='licensestatus1.jsp' target='main'>License
							Status</a></li>
					<li><a href='passwordchange1.htm' target='main'>Change
							Password</a></li>
					<li><a href='logout.jsp' target="_top">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>