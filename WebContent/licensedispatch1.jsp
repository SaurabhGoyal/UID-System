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
<h4>License Dispatch</h4><hr>
<%
	Connection con;
	Statement stmt;
	ResultSet rs;

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select uid from licensetable where status='Accept'");
		out.println("<form method=post action=licensedispatch2.jsp>");
		out.println("Select Citizen ID : <select name=uid>");
		while (rs.next()) {
			out.println("<option>" + rs.getString(1) + "</option>");
		}
		out.println("</select><hr><button type='submit' class='btn btn-primary'>Issue</button></form>");
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>