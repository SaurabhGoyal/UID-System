<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/mystyle.css">
<script type="text/javascript" src="scripts/jquery.min.js" ></script>
<script type="text/javascript" src="scripts/bootstrap.min.js" ></script>
<script type="text/javascript" src="scripts/bootstrapValidator.min.js" ></script>
<script type="text/javascript" src="scripts/myscript.js"></script>
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
				.executeQuery("select * from trcontroltable where stationid='"
						+ session.getAttribute("loginid") + "'");
		if (rs.next()) {
			session.setAttribute("stationid", rs.getString(1));
			session.setAttribute("location", rs.getString(2));
			session.setAttribute("incharge", rs.getString(3));
			session.setAttribute("pincode", rs.getString(5));
			session.setAttribute("area", rs.getString(6));
			session.setAttribute("controltype", rs.getString(7));
		}
	%>

	<nav class="navbar navbar-default middle"
		style="vertical-align: middle">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Welcome <%=session.getAttribute("incharge")%></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href='licensescheduling1.jsp' target='main'>Schedule
							license applications</a></li>
					<li><a href='licensetestresults1.jsp' target='main'>Update
							test results</a></li>
					<li><a href='licensedispatch1.jsp' target='main'>Dispatch
							license</a></li>
					<li><a href='passwordchange1.htm' target='main'>Change
							Password</a></li>
					<li><a href='logout.jsp' target="_top">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>