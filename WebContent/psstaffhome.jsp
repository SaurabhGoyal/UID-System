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
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/uiddb", "root", "");
		stmt = con.createStatement();
		rs = stmt
				.executeQuery("select * from psstafftable where psstaffid="
						+ session.getAttribute("loginid"));
		if (rs.next()) {
			session.setAttribute("psstaffname", rs.getString(2));
			session.setAttribute("location", rs.getString(3));
			session.setAttribute("regdate", rs.getString(4));
		}
	%>
	<nav class="navbar navbar-default middle"
		style="vertical-align: middle">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Welcome <%=session.getAttribute("psstaffname")%></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href='passportdispatch1.jsp' target='main'>Dispatch
							passport</a></li>
					<li><a href='passwordchange1.htm' target='main'>Change
							Password</a></li>
					<li><a href='logout.jsp' target="_top">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>