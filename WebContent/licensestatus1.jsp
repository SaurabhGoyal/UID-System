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
<body class="paddedClass middle">

	<%
		String uid, name;
		Connection con;
		Statement stmt, stmt1;
		ResultSet rs;

		uid = (String) session.getAttribute("uid");
		try {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt
					.executeQuery("select vehicletype from licensetable where uid="
							+ uid);

			if (!rs.isBeforeFirst()) {
	%>
	<h4>License Status</h4>
	<b>No applications for license from this UID</b>
	<%
		} else {
	%>
	<form method=post action=licensestatus2.jsp>
		<h4>Select the vehicle type</h4><hr>
		<b>Citizen ID:</b>	<%=uid%>
		<b>Vehicle Type:</b> <select name=vehicletype>
		<%
			while (rs.next())
				out.println("<option> " + rs.getString(1) + "</option>");
		%>
		</select>
		<input type=submit value='Check status'>
	</form>
	<%
		}
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
	%>
</body>
</html>